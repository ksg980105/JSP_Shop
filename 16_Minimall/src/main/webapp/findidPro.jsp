<%@page import="my.member.MemberDAO"%>
<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	
	MemberDAO mdao = MemberDAO.getInstance();
	MemberDTO mdto = mdao.getMemberByNameAndSsn(name,ssn1,ssn2);
	
	String viewPage;
	String id;
	
	if(mdto != null){
		id = mdto.getId();
	}else{
		id = "가입하지 않은 회원";
	}
	viewPage = request.getContextPath() + "/main.jsp";
%>

<script type="text/javascript">
	alert("<%=id%>" + "입니다.");
	location.href="<%=viewPage%>";
</script>










