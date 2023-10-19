<%@page import="my.shop.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="top.jsp"/>
<%
CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> lists = cdao.getAllcate();
%>

	<td colspan="6" align="center" valign="top">
			<table border="1" width="500" align="center">
			<caption><b>카테고리 목록</b></caption>
				<tr bgcolor="yellow">
					<td width="10%" align="center">번호</td>
					<td width="30%" align="center">카테고리 코드</td>
					<td width="50%" align="center">카테고리 이름</td>
					<td width="10%" align="center">삭제</td>
				</tr>
				<%
				if(lists.size()==0){
				%>
				<tr>
						<td colspan="4">등록된 카테고리가 없습니다.</td>
				</tr>
				<%
				}else{
				%>
				<%
				for(int i=0; i<lists.size(); i++){
								CategoryBean cdto = lists.get(i);
				%>
				<tr class="m3">
					<td><%=cdto.getCnum()%></td>
					<td><%=cdto.getCode()%></td>
					<td><%=cdto.getCname()%></td>
					<td><a href="cate_delete.jsp?cnum=<%=cdto.getCnum()%>">삭제</a></td>
				</tr>
					<%}
				}%>
			</table>
	</td>
<jsp:include page="bottom.jsp"/>