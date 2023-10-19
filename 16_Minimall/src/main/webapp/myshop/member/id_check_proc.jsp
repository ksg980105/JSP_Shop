<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

	String userid = request.getParameter("userid");
	MemberDao mdao = MemberDao.getInstance();
	
	boolean isCheck = mdao.searchId(userid);
	String str = "";
	if(isCheck){
		str = "NO";
		out.print(str);
	}else{
		str = "YES";
		out.print(str);
	}
%>