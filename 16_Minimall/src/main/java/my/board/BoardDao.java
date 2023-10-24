package my.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="sqlid";
	String dbpw="sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public static BoardDao instance = new BoardDao();
	
	private BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDao getInstance() {
//		if(instance==null) {
//			instance = new BoardDao();
//		}
		return instance;
	}
	
	public ArrayList<BoardBean> getArticles(int start, int end) {
		ArrayList<BoardBean> lists = new ArrayList<>();
		
		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(Integer.parseInt(rs.getString("num")));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(Integer.parseInt(rs.getString("readcount")));
				bb.setRef(Integer.parseInt(rs.getString("ref")));
				bb.setRe_step(Integer.parseInt(rs.getString("re_step")));
				bb.setRe_level(Integer.parseInt(rs.getString("re_level")));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				
				lists.add(bb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			try {
//				if(ps != null) {
//					ps.close();
//				}
//				if(rs != null) {
//					rs.close();
//				}
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
		}
		return lists;
	}
	
	public int getArticleCount() {
		int count = 0;
		String sql = "select count(*) as cnt from board";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			try {
//			if(ps != null) {
//				ps.close();
//			}
//			if(rs != null) {
//				rs.close();
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
	}
		return count;
	}
	
	public int insertArticle(BoardBean bb) {
		int cnt = -1;
		String sql = "insert into board(num,writer,email,subject,passwd,"
				+ "reg_date,ref,re_step,re_level,content,ip) "
				+ "values(board_seq.nextval,?,?,?,?,?,board_seq.currval,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getEmail());
			ps.setString(3, bb.getSubject());
			ps.setString(4, bb.getPasswd());
			ps.setTimestamp(5, bb.getReg_date());

			ps.setInt(6, 0);
			ps.setInt(7, 0);
			ps.setString(8, bb.getContent());
			ps.setString(9, bb.getIp());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	//			try {
	//			if(ps != null) {
	//				ps.close();
	//			}
	//			if(rs != null) {
	//				rs.close();
	//			}
	//		}catch(Exception e) {
	//			e.printStackTrace();
	//		}
		}
		return cnt;
	}
	
	public BoardBean getArticle(int num) {
		BoardBean bb = null;
		String sql2 = "update board set readcount=readcount+1 where num=?";
		String sql = "select * from board where num=?";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, num);
			rs = ps.executeQuery(); //조회수 증가
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setEmail(rs.getString("email"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bb;
	}
	
	public String getPasswd(int num) {
		String passwd = "";
		String sql = "select passwd from board where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				passwd = rs.getString("passwd");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return passwd;
	}
	
	public int deleteArticle(int num, String passwd) {
		int cnt = -1;
		String sql = "select passwd from board where num=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();

			if(rs.next()) {
				if(passwd.equals(rs.getString("passwd"))) {
					String sql2 = "delete from board where num=?";
					ps = conn.prepareStatement(sql2);
					ps.setInt(1, num);
					
					cnt = ps.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public BoardBean getArticleByNum(int num) {
		BoardBean bb = null;
		String sql = "select * from board where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setEmail(rs.getString("email"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bb;
	}
	
	public int updateArticle(BoardBean bb) {
		int cnt = -1;
		String sql = "select passwd from board where num=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bb.getNum());
			rs = ps.executeQuery();

			if(rs.next()) {
				if(bb.getPasswd().equals(rs.getString("passwd"))) {
					String sql2 = "update board set writer=?, subject=?, email=?, content=? where num=?";
					ps = conn.prepareStatement(sql2);
					ps.setString(1, bb.getWriter());
					ps.setString(2, bb.getSubject());
					ps.setString(3, bb.getEmail());
					ps.setString(4, bb.getContent());
					ps.setInt(5, bb.getNum());
					
					cnt = ps.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int replyArticle(BoardBean bb) {
		int cnt = -1;
		String sql2 = "update board set re_step=re_step+1 where ref=? and re_step>?";
		String sql = "insert into board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip) "
				+ "values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, bb.getRef());
			ps.setInt(2, bb.getRe_step());
			ps.executeUpdate();
			
			int re_step = bb.getRe_step()+1;
			int re_level = bb.getRe_level()+1;
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getEmail());
			ps.setString(3, bb.getSubject());
			ps.setString(4, bb.getPasswd());
			ps.setTimestamp(5, bb.getReg_date());
			ps.setInt(6, bb.getRef());
			ps.setInt(7, re_step);
			ps.setInt(8, re_level);
			ps.setString(9, bb.getContent());
			ps.setString(10, bb.getIp());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
}













