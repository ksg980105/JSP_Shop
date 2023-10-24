<%@page import="my.board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bb" class="my.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
	bb.setIp(request.getRemoteAddr());
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	String pageNum = request.getParameter("pageNum");
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.replyArticle(bb);
	
	if(cnt == 1){
		response.sendRedirect("list.jsp?pageNum=" + pageNum);
	}else{
		%>
		<script type="text/javascript">
			alert("실패");
			history.go(-1);
		</script>
	<%}
%>