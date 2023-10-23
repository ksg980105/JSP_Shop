<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));		//상품번호
	int ovalue = Integer.parseInt(request.getParameter("ovalue")); //주문수량
	System.out.println("상품번호:"+pnum);
	System.out.println("주문수량:"+ovalue);
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getSelectByPnum(pnum);
	
	if(pb.getPqty() < ovalue){
%>
	<script type="text/javascript">
		alert('주문 수량 초과');
		location.href="mall.jsp";
	</script>
<%
		return; //주문수량 초과시 넘어가지 못하도록
	}
	mallCart.addProduct(pnum,ovalue); //ex)10번상품 3개 주문한다.
	response.sendRedirect("mall_cartList.jsp");
%>