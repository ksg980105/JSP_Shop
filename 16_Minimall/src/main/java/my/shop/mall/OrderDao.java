package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.shop.ProductBean;

public class OrderDao {
	Connection conn;
	public OrderDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:"+conn);
						
		} catch (NamingException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertOrder(int memno, Vector<ProductBean> cv) throws SQLException {
		PreparedStatement ps = null;
		int sum = 0;
		int cnt = 0;
		
		conn.setAutoCommit(false);
		
		for(int i=0; i<cv.size(); i++) {
			String sql = "insert into orders values(orderseq.nextval,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, memno);
			ps.setInt(2, cv.get(i).getPnum());
			ps.setInt(3, cv.get(i).getPqty());
			ps.setInt(4, cv.get(i).getPrice()*cv.get(i).getPqty());
			
			cnt += ps.executeUpdate();
		}
		
		if(cnt == cv.size()) {
			conn.commit();
		}
		
		return cnt;
	}
}
