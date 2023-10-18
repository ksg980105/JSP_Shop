<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO mdao = MemberDAO.getInstance();
	MemberDTO mdto = mdao.getMemberInfo(id,password);
	
	String viewPage;
	
	if(mdto != null){
		String _id = mdto.getId();
		if(_id.equals("admin")){		//관리자
			viewPage = request.getContextPath() + "/myshop/admin/main.jsp";
		}else{	//일반회원
			viewPage = request.getContextPath() + "/myshop/display/mall.jsp";
		}
	}else{
		//가입하지 않은 회원
		viewPage = request.getContextPath() + "/main.jsp";
%>
		<script type="text/javascript">
			alert('가입하지 않은 회원입니다.');
		</script>
<%
	}
%>

<script type="text/javascript">
	location.href="<%=viewPage%>";
</script>
