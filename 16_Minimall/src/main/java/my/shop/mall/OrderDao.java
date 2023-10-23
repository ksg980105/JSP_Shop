package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	public Vector<OrderBean> getOrderList(String id) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vector<OrderBean> lists = new Vector<OrderBean>();
		
		String sql = "select m.name, m.id, p.pname, o.qty, o.amount "
				+ "from (members m inner join orders o on m.no = o.memno) "
				+ "inner join product p on o.pnum = p.pnum where id=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			OrderBean ob = new OrderBean();
			ob.setMname(rs.getString("name"));
			ob.setMid(rs.getString("id"));
			ob.setPname(rs.getString("pname"));
			ob.setQty(rs.getInt("qty"));
			ob.setAmount(rs.getInt("amount"));
			
			lists.add(ob);
		}
		return lists;
	}
}
