<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css" type="text/css">
    
<style>
	.right{
		float:right;
	}
</style>
    
<%
	String cPath = request.getContextPath();
	String memid = (String)session.getAttribute("memid");
%>

<table border="1" align="center" width="800">
	<tr height="50">
		<td colspan="2" align="center">
				<a href="<%=cPath%>/main.jsp">HOME</a>|
				<%
					if(memid.equals("admin")){
				%>
						<a href="<%=cPath%>/myshop/admin/main.jsp">관리자홈</a>|
				<%
					}
				%>
				<a href="<%=cPath%>/myshop/display/mall.jsp">쇼핑몰홈</a>|
				<a href="<%=cPath%>/myshop/display/mall_cartList.jsp">장바구니</a>|
				<a href="<%=cPath%>/myshop/board/list.jsp">게시판</a>|
				<a href="<%=cPath%>/myshop/display/company.jsp">회사소개</a>
				
				<a href="<%=cPath%>/logout.jsp" class="right">
					<img src="<%=cPath%>/img/logout3.jpg" width="50" height="20">
				</a>
			<span class="right"><%=memid%>님</span>
		</td>
	</tr>
	<tr height="400">
		<td valign="top" width="150" align="center">
			<table border="1" width="100%">
			<caption><b>Tree/view</b></caption>
				<tr>
					<td>
						<a href="ceo.jsp"><font color="red">CEO 인사말</font></a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="history.jsp"><font color="red">회사 연혁</font></a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="chart.jsp"><font color="red">조직도</font></a>
					</td>
				</tr>
			</table>
		</td>
		<td align="center" valign="top">     

	