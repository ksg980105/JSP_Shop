<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int cnum = Integer.parseInt(request.getParameter("cnum"));

	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.deletecate(cnum);
	
	String msg, url;
	
	if(cnt != -1){
		msg = "삭제 성공";
		url = "cate_list.jsp";
	}else{
		msg = "삭제 실패";
		url = "cate_list.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>