package my.shop.mall;

import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

public class CartBean {	//장바구니
	private Vector<ProductBean> clist;
	
	public CartBean() {
		clist = new Vector<ProductBean>();
	}
	
	public void addProduct(int pnum, int oqty) throws Exception { //장바구니에 상품추가 메서드
		ProductBean pb = new ProductBean();
		ProductDao pdao = ProductDao.getInstance();
		
		pb = pdao.getSelectByPnum(pnum);
		pb.setPqty(oqty);
		clist.add(pb);
		System.out.println("clist.size():"+clist.size());
	}
	
	public Vector<ProductBean> getAllProducts() {	//장바구니에 담긴 물품 리턴
		return clist;
	}
}
