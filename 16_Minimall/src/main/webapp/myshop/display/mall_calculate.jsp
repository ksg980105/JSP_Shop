<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:useBean id="odao" class="my.shop.mall.OrderDao" scope="session"/>

<%
	Vector<ProductBean> cv = mallCart.getAllProducts();
	int memno = (Integer)session.getAttribute("memno"); //loginPro.jsp에서 session.setAttribute한 값
	
	int cnt = odao.insertOrder(memno, cv);
	String msg;
	if(cnt != 0){
		msg = "주문 완료했습니다.";
		mallCart.removeAllProducts(); //결제 완료시 장바구니 모든 상품 삭제
%>
		<script type="text/javascript">
			alert('<%=msg%>');
			var resp = confirm("계속하시겠습니까?");
			if(resp){
				location.href="<%=request.getContextPath()%>/myshop/display/mall.jsp";
			}else{
				location.href="<%=request.getContextPath()%>/logout.jsp";
			}
		</script>
<%
	}else{
		msg = "주문 실패했습니다.";
%>
		<script type="text/javascript">
			alert('<%=msg%>');
			location.href="<%=request.getContextPath()%>/myshop/display/mall.jsp";
		</script>
<%		
	}
%>