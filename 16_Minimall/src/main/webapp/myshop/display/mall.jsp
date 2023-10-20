<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>
dddd
<%
	request.setCharacterEncoding("UTF-8");
	
	ProductDao pdao = ProductDao.getInstance();
	String[] spec = {"HIT","NEW","BEST","NORMAL"};
	for(int i=0; i<spec.length; i++){
		ArrayList<ProductBean> plists = pdao.getSelectByPspec(spec[i]);
%>
	<hr color=green width="80%">
	<font color=red size=3><strong><%=spec[i]%></strong></font>
	<hr color=green width="80%">
	
	<%
		if(plists.size()==0){
	%>
			<b><%=spec[i]%>상품이 없습니다.</b>
	<%
		}else{
	%>
			<table width="600" align="center" border="0">
				<tr>
			<%
			int count=0;
			for(int j=0; j<plists.size(); j++){
				count ++;

				ProductBean pb = plists.get(j);
				String pimage = pb.getPimage();
				String pname = pb.getPimage();
				int price = pb.getPrice();
				int point = pb.getPoint();
				String imgPath = request.getContextPath()+"/myshop/images/"+pimage;
			%>
				<td align="center">
					<img src="<%=imgPath%>" width="100" heigh="80"><br>
					<%=pb.getPname()%><br>
					<%=pb.getPrice()%>원<br>
					[<%=pb.getPoint()%>]points
				</td>
				<%
					if(count%3 == 0){	//3의 배수일 때 한줄 끊기
						out.println("</tr><tr>");
					}
				%>
			<%} %>
				</tr>
			</table>
		<%} %>
	<%} %>

<%@ include file="mall_bottom.jsp"%>