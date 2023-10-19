package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public static ProductDao instance = new ProductDao();
	
	public static ProductDao getInstance() {
		return instance;
	}
	
	private ProductDao(){
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		return conn;
	}
	
	public int insertProduct(MultipartRequest mr) throws Exception {
		Connection conn = getConnection();
		
		int cnt = -1;
		String sql = "insert into product values(catprod.nextval,?,?,?,?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		
		String pcategory_fk = mr.getParameter("pcategory_fk"); //카테고리 코드
		pcategory_fk += mr.getParameter("pcode"); //상품 코드, pcategory_fk = 카테고리코드 + 상품코드
		
		ps.setString(1, mr.getParameter("pname"));
		ps.setString(2, pcategory_fk);
		ps.setString(3, mr.getParameter("pcompany"));
		ps.setString(4, mr.getFilesystemName("pimage"));
		ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));
		ps.setInt(6, Integer.parseInt(mr.getParameter("price")));
		ps.setString(7, mr.getParameter("pspec"));
		ps.setString(8, mr.getParameter("pcontents"));
		ps.setInt(9, Integer.parseInt(mr.getParameter("point")));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String pinputdate = sdf.format(today);
		ps.setString(10, mr.getParameter(pinputdate));
		
		cnt = ps.executeUpdate();
		
		return cnt;
	}
	
	public ArrayList<ProductBean> getAllProduct() throws Exception{
	      ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
	      conn = getConnection();
	      
	      String sql = "select * from product order by pnum";
	      ps = conn.prepareStatement(sql);
		      
	      rs = ps.executeQuery();
	      
	      lists = makeArrayList(rs);
	      return lists;
	   }
	
	public ArrayList<ProductBean> makeArrayList(ResultSet rs) throws SQLException{
		 ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		 while(rs.next()) {
	    	 ProductBean pdto = new ProductBean();
	         pdto.setPnum(rs.getInt("pnum"));
	         pdto.setPname(rs.getString("pname"));
	         pdto.setPcategory_fk(rs.getString("pcategory_fk"));
	         pdto.setPcompany(rs.getString("pcompany"));
	         pdto.setPimage(rs.getString("pimage"));
	         pdto.setPqty(rs.getInt("pqty"));
	         pdto.setPrice(rs.getInt("price"));
	         pdto.setPspec(rs.getString("pspec"));
	         pdto.setPcontents(rs.getString("pcontents"));
	         pdto.setPinputdate(rs.getString("pinputdate"));
	         
	         lists.add(pdto);
	      }
		 return lists;
	}
	
	public int deleteProduct(int pnum) throws Exception {
		conn = getConnection();
		
		int cnt = -1;
		String sql = "delete from product where pnum=?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum);
		
		cnt = ps.executeUpdate();
		return cnt;
	}
	
	public ProductBean getAllProductByPnum(int pnum) throws Exception {
	      conn = getConnection();
	      
	      ProductBean pdto = null;
	      String sql = "select * from product where pnum=? order by pnum";
	      ps = conn.prepareStatement(sql);
		  ps.setInt(1, pnum);
	      rs = ps.executeQuery();
	      
	      while(rs.next()) {
	    	  pdto = new ProductBean();
		      pdto.setPnum(rs.getInt("pnum"));
		      pdto.setPname(rs.getString("pname"));
		      pdto.setPcategory_fk(rs.getString("pcategory_fk"));
		      pdto.setPcompany(rs.getString("pcompany"));
		      pdto.setPimage(rs.getString("pimage"));
		      pdto.setPqty(rs.getInt("pqty"));
		      pdto.setPrice(rs.getInt("price"));
		      pdto.setPspec(rs.getString("pspec"));
		      pdto.setPcontents(rs.getString("pcontents"));
		      pdto.setPinputdate(rs.getString("pinputdate"));
		   }
	      
	      return pdto;
	}
	
	public int updateProduct(MultipartRequest mr, String img ) throws Exception{
		conn = getConnection();
		int cnt = -1;
		String sql = "update product set pname=?, pcompany=?, pimage=?, pqty=?, price=?, pspec=?, pcontents=?, point=? where pnum=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1,mr.getParameter("pname"));
			ps.setString(2,mr.getParameter("pcompany"));
			ps.setString(3,img);
			ps.setInt(4,Integer.parseInt(mr.getParameter("pqty")));				
			ps.setInt(5,Integer.parseInt(mr.getParameter("price")));
			ps.setString(6,mr.getParameter("pspec"));
			ps.setString(7,mr.getParameter("pcontents"));
			ps.setInt(8,Integer.parseInt(mr.getParameter("point")));
			ps.setInt(9,Integer.parseInt(mr.getParameter("pnum")));

			cnt = ps.executeUpdate();

			return cnt;
	}//updateProduct
}
















