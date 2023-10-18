package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CategoryDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static CategoryDAO instance = new CategoryDAO();
	
	public static CategoryDAO getInstance() {
		return instance;
	}
	
	private CategoryDAO(){
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	
	public int insertcate(CategoryDTO cdto) throws Exception {
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
	
	public ArrayList<CategoryDTO> getAllcate() throws Exception {
		Connection conn = getConnection();
		ArrayList<CategoryDTO> lists = new ArrayList<CategoryDTO>();
		
		String sql = "select * from category order by cnum asc";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			CategoryDTO cdto = new CategoryDTO();
			cdto.setCnum(Integer.parseInt(rs.getString("cnum")));
			cdto.setCode(rs.getString("code"));
			cdto.setCname(rs.getString("cname"));
			
			lists.add(cdto);
		}
		return lists;
	}
	
}
