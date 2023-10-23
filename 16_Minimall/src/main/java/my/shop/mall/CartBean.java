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
		
		for(int i=0; i<clist.size(); i++) { //이미 장바구니에 들어가있는 상품을 보고 내가 넘긴 번호랑 같으면 개수 추가
			int cPnum = clist.get(i).getPnum(); //장바구니에 담겨있는 상품의 번호
			if(cPnum == pnum) {
				int cPqty = clist.get(i).getPqty(); //장바구니에 담겨있는 상품의 주문수량
				clist.get(i).setPqty(cPqty+oqty);	//같은 장바구니 상품의 주문수량 추가
				return;
			}
		}
		
		//기존 장바구니에 같은 상품이 없으면 새상품 추가
		pb.setPqty(oqty);
		clist.add(pb);
		System.out.println("clist.size():"+clist.size());
	}
	
	public Vector<ProductBean> getAllProducts() {	//장바구니에 담긴 물품 리턴
		return clist;
	}
	
	public void setEdit(String pnum, String oqty){ //넘어온 pnum의 상품 개수를 oqty로 수정
		for(ProductBean pb : clist) {
			if(pb.getPnum()==Integer.parseInt(pnum)) {
				if(Integer.parseInt(oqty)==0) {
					clist.removeElement(pb);
					break;
				}else {
					pb.setPqty(Integer.parseInt(oqty));
					break;					
				}
			}
		}
	}
	
	public void deleteProduct(String pnum) {
		for(int i=0; i<clist.size(); i++) {
			int cPnum = clist.get(i).getPnum();
			if(cPnum == Integer.parseInt(pnum)) {
				clist.remove(i);
				break;
			}
		}
	}
	
	public void removeAllProducts() {
		clist.removeAllElements(); //장바구니 안에 모든 요소 삭제
	}
}
