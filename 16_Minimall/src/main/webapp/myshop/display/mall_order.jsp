<%@page import="java.util.Vector"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>

<%@ include file="mall_top.jsp"%>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int oqty = Integer.parseInt(request.getParameter("oqty"));
	int sum = 0;
	
	if(pnum != 0 && oqty != 0){
		mallCart.addProduct(pnum, oqty);		
	}
	Vector<ProductBean> clist = mallCart.getAllProducts();
	
%>

<table border="1" width="90%" align="center" class="outline">
	<tr class="m2">
		<th colspan="3" align="center" height="50px;" >
				결제 내역서 보기</th>
	</tr>
	<tr class="m1">
		<th width="40%">상품명</th>
		<th width="20%">수량</th>
		<th width="40%">금액</th>
	</tr>
	
	<%
		for(int i=0; i<clist.size();i++){
			   ProductBean pb = clist.get(i);
			  
	            String pname = pb.getPname();
	            int pqty = pb.getPqty();
	            int price = pb.getPrice();
	            int amount = pqty * price;
	%>
			<tr>
				<th><%=pname %></th>
				<th><%=pqty %></th>
				<th><%=amount %>원</th>
			</tr>
		
			<% 
			  sum += amount;
	
			}//for
	%>
	<tr class=m1>
		<th colspan="3">
			결제 총액 : <font color=red><%=sum%>원</font>
		</th>
	</tr>
</table>
<br>

<input type="button" value="결제하기" onClick="location.href = 'mall_calculate.jsp'">
<%@ include file="mall_bottom.jsp"%>