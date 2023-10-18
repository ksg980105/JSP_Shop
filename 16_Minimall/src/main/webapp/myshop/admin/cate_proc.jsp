<%@page import="my.shop.CategoryDTO"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String code = request.getParameter("code");
	String cname = request.getParameter("cname");
%>

	<jsp:useBean id="cdto" class="my.shop.CategoryDTO"/>
	<jsp:setProperty property="*" name="cdto"/>
	
<%
	CategoryDAO cdao = CategoryDAO.getInstance();
	
	int cnt = cdao.insertcate(cdto);
	
	String msg, url;
	
	if(cnt != -1){
		msg = "등록 성공";
		url = "cate_list.jsp";
	}else{
		msg = "등록 실패";
		url = "cate_input.jsp";
	}
%>
<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>