<%@page import="my.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
%>

<jsp:useBean id="bb" class="my.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
	BoardDao bdao = BoardDao.getInstance();
	int check = bdao.updateArticle(bb);
	
	if(check==1){
		response.sendRedirect("list.jsp?pageNum=" + pageNum);
	}else{
		
%>
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.go(-1);	//이전페이지로
</script>
<%}%>