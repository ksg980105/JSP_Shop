<%@page import="my.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	int check = bdao.deleteArticle(num, passwd);
	
	if(check==1){
		int count = bdao.getArticleCount();
		int pageSize = 10;
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		if(pageCount<pageNum){
			response.sendRedirect("list.jsp?pageNum=" + (pageNum-1));
		}else{
			response.sendRedirect("list.jsp?pageNum=" + pageNum);
		}
	}else{
%>

	<script language = "JavaScript">
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
	</script>
<%
	}
%>