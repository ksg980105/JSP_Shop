<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="my.shop.mall.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<!-- 
	mall_cartAdd.jsp와 carList.jsp를 객체가 새로 생성되지 못하도록 session 설정 
	설정이 없을시 여러가지 물건을 장바구니에 담을 때 장바구니가 초기화되어 1개만 들어감
-->

<%
	Vector<ProductBean> clist = mallCart.getAllProducts();
%>
	<table border=1 width="90%" align="center">
		<tr>
			<td colspan="6" align="center">
				<h4>장바구니 보기</h4>
			</td>
		</tr>
		<tr class="m1" align="center">
			<th width="10%">번호</th>
			<th width="20%">상품명</th>
			<th width="20%">수량</th>
			<th width="20%">단가</th>
			<th width="20%">금액</th>
			<th width="10%">삭제</th>
		</tr>
		<%
			if(clist.size()==0){
		%>
				<tr>
					<td colspan="6"	align="center">
						선택한 상품이 없습니다.
					</td>
				</tr>
			</table>	<!-- 선택한 상품이 없으면 테이블 끝 -->
		<%		
			}else{
				int sumPrice = 0;
				int sumPoint = 0;
				
				for(int i=0; i<clist.size(); i++){
					ProductBean pb = clist.get(i);
					sumPrice += pb.getPrice()*pb.getPqty();	// 가격 * 갯수 = 전체가격
					sumPoint += pb.getPoint()*pb.getPqty(); // 포인트 * 갯수 = 전체포인트
		%>
				<tr align="center">
					<td><%=pb.getPnum()%></td>
					<td>
						<img  src="<%=request.getContextPath()+"/myshop/images/"+pb.getPimage()%>" width="40" height="40">
						<br>
						<%=pb.getPname()%>
					</td>
					<td>
						<form name="f" method="post" action="mall_cartEdit.jsp">
							<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
							<input type="text" name="oqty" size="5"	value="<%=pb.getPqty()%>">개
							<input type="submit" value="수정">
						</form>
					</td>
					<td>
						<font color=blue><%=pb.getPrice()%>원</font><br>
						<font color=blue>[<%=pb.getPoint()%>] point</font>
					</td>
					<td>
						<font color=red><%=pb.getPrice()%>원</font><br>
						<font color=red>[<%=pb.getPoint()%>] point</font>
					</td>
					<td>
						<a href="mall_cartDel.jsp?pnum=<%=pb.getPnum()%>">삭제</a>
					</td>
				</tr>
				<%} %>
				<tr>
					<td colspan="4">
						<font color=blue>장바구니 총액 : </font>
						<font color=red><%=sumPrice%> 원</font><br>
						<font color=green>총 적립 포인트 : [<%=sumPoint%>] point</font>
					</td>
					<td align="left" colspan="2">
						<a href="#">[주문하기]</a>
						<a href="#">[계속 쇼핑]</a>
					</td>
				</tr>
			</table>
		<%		
			}
		%>

<%@ include file="mall_bottom.jsp"%>