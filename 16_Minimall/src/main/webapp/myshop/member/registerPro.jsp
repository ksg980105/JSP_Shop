<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mdto" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>

<%
	MemberDAO mdao = MemberDAO.getInstance();
	int cnt = mdao.insertMember(mdto);
	
	String msg,url;
	if(cnt != -1){
		msg = "성공";
		url = request.getContextPath()+"/main.jsp";
	}else{
		msg = "실패";
		url = "register.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>