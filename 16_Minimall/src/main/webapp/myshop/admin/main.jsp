<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file="top.jsp" %> --%> <%--include 지시어 전체 내용을 복사해서 붙여넣은 효과 --%>
<jsp:include page="top.jsp"/>
	<td colspan="6" align="center">
		<img src="<%=request.getContextPath()%>/img/apple.jpg" width="400" height="300">
	</td>
<%-- <%@ include file="bottom.jsp" %> --%>
<jsp:include page="bottom.jsp"/>