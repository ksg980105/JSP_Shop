<%@page import="my.shop.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="top.jsp"/>
<%
	CategoryDAO cdao = CategoryDAO.getInstance();
	ArrayList<CategoryDTO> lists = cdao.getAllcate();
%>

	<td colspan="6" align="center">
		<form method="post" action="cate_list_proc.jsp" name="catelist">
			<table border="1" width="500" align="center">
			<caption><b>카테고리 목록</b></caption>
				<tr bgcolor="yellow">
					<td width="10%" align="center">번호</td>
					<td width="30%" align="center">카테고리 코드</td>
					<td width="50%" align="center">카테고리 이름</td>
					<td width="10%" align="center">삭제</td>
				</tr>
				<%
					for(int i=0; i<lists.size(); i++){
						CategoryDTO cdto = lists.get(i);
				%>
				<tr class="m3">
					<td><%=cdto.getCnum()%></td>
					<td><%=cdto.getCode()%></td>
					<td><%=cdto.getCname()%></td>
					<td><a href="">삭제</a></td>
				</tr>
				<%} %>
			</table>
		</form>
	</td>
<jsp:include page="bottom.jsp"/>