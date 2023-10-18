package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO(){
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	
	public int insertMember(MemberDTO mdto) throws Exception {
		Connection conn = getConnection();
		int cnt = -1;
		String sql = "insert into members values(memseq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getId());
			ps.setString(3, mdto.getPassword());
			ps.setString(4, mdto.getSsn1());
			ps.setString(5, mdto.getSsn2());
			ps.setString(6, mdto.getEmail());
			ps.setString(7, mdto.getHp1());
			ps.setString(8, mdto.getHp2());
			ps.setString(9, mdto.getHp3());
			ps.setString(10, mdto.getJoindate());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public boolean searchId(String id) throws Exception {
		Connection conn = getConnection();
		boolean check = false;
		
		String sql = "select * from members where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				check=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
		
	}
	
	public MemberDTO getMemberByNameAndSsn(String name, String ssn1, String ssn2) throws Exception {
		Connection conn = getConnection();
		MemberDTO mdto = null;
		String sql = "select * from members where name=? and ssn1=? and ssn2=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, ssn1);
			ps.setString(3, ssn2);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				mdto = getMemberDTO(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mdto;
	}
	
	public MemberDTO getMemberDTO(ResultSet rs) throws SQLException {
		MemberDTO mdto = new MemberDTO();
		mdto.setNo(rs.getInt("no"));
		mdto.setName(rs.getString("name"));
		mdto.setId(rs.getString("id"));
		mdto.setPassword(rs.getString("Password"));
		mdto.setSsn1(rs.getString("ssn1"));
		mdto.setSsn2(rs.getString("ssn2"));
		mdto.setEmail(rs.getString("email"));
		mdto.setHp1(rs.getString("hp1"));
		mdto.setHp2(rs.getString("hp2"));
		mdto.setHp3(rs.getString("hp3"));
		mdto.setJoindate(rs.getString("joindate"));
		
		return mdto;
	}
	
	public MemberDTO getPasswordByIdAndNameAndSsn(String id, String name, String ssn1, String ssn2) throws Exception {
		Connection conn = getConnection();
		MemberDTO mdto = null;
		String sql = "select * from members where id=? and name=? and ssn1=? and ssn2=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, ssn1);
			ps.setString(4, ssn2);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				mdto = getMemberDTO(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mdto;
	}
	
	public MemberDTO getMemberInfo(String id, String password) throws Exception {
		Connection conn = getConnection();
		MemberDTO mdto = null;
		String sql = "select * from members where id=? and password=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				mdto = getMemberDTO(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mdto;
	}
}















