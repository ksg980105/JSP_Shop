package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CategoryDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static CategoryDao instance = new CategoryDao();
	
	public static CategoryDao getInstance() {
		return instance;
	}
	
	private CategoryDao(){
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	
	public int insertcate(CategoryBean cdto) throws Exception {
		Connection conn = getConnection();

		int cnt = -1;
		String sql = "insert into category values(catseq.nextval, ?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cdto.getCode());
			ps.setString(2, cdto.getCname());
			
			cnt = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ArrayList<CategoryBean> getAllcate() throws Exception {
		Connection conn = getConnection();
		ArrayList<CategoryBean> lists = new ArrayList<CategoryBean>();
		
		String sql = "select * from category order by cnum asc";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				CategoryBean cdto = new CategoryBean();
				cdto.setCnum(Integer.parseInt(rs.getString("cnum")));
				cdto.setCode(rs.getString("code"));
				cdto.setCname(rs.getString("cname"));
				
				lists.add(cdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public int deletecate(int cnum) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "delete from category where cnum=?";
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, cnum);
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	
}
