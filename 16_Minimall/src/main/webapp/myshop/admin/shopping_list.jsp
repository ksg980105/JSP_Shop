<%@page import="my.shop.mall.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="odao" class="my.shop.mall.OrderDao" scope="session"/>

<% 
	int total = 0;
	
	String id = request.getParameter("id");
	Vector<OrderBean> lists = null;
	if(id!=null){ //null이 아니면 shopping_list.jsp에서 넘어옴
		lists = odao.getOrderList(id);
	}
%>

<jsp:include page="top.jsp"/>
	<td colspan="6" align="center" valign="top">
		<table border="1" width="100%">
			<tr>
				<td colspan="5">
					<form action="shopping_list.jsp" method="post">
						조회할 회원 아이디 입력 : 
						<input type="text" name="id">
						<input type="submit" value="내역 조회">
					</form>
				</td>
			</tr>
			<tr class="m1">
				<td>고객명</td>
				<td>아이디</td>
				<td>상품명</td>
				<td>수량</td>
				<td>금액</td>
			</tr>
			<%
				if(lists != null){
				for(OrderBean ob : lists){
					String mname = ob.getMname();
					String mid = ob.getMid();
					String pname = ob.getPname();
					int qty = ob.getQty();
					int amount = ob.getAmount();
					total += amount;
			%>
			<tr>
				<td align="center"><%=mname%></td>
				<td align="center"><%=mid%></td>
				<td align="center"><%=pname%></td>
				<td align="center"><%=qty%></td>
				<td align="center"><%=amount%></td>
			</tr>
			<%}
			}%>
			<tr>
				<td colspan="4">총합</td>
				<td><%=total%></td>
			</tr>
		</table>
	</td>
<jsp:include page="bottom.jsp"/>