<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	session.invalidate(); //session 모두 해제
	String viewPage = "main.jsp";
	response.sendRedirect(viewPage);
%>