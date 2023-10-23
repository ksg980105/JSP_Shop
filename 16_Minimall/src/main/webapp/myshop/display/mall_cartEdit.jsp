<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>

<%
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getSelectByPnum(Integer.parseInt(pnum));
	
	if(pb.getPqty() < Integer.parseInt(oqty)){
%>
	<script type="text/javascript">
		alert('주문 수량 초과');
		location.href="mall.jsp";
	</script>
<%
		return; //주문수량 초과시 넘어가지 못하도록
	}
	
	mallCart.setEdit(pnum, oqty);
%>
	<script type="text/javascript">
		alert('주문수량 수정 성공');
		location.href="mall_cartList.jsp";
	</script>
