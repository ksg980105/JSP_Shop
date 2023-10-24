<%@page import="my.board.BoardBean"%>
<%@page import="my.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="color.jsp"%>
<link rel="stylesheet" href="style.css" type="text/css">

<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin: auto;
	}
</style>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="script.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert(1);
	});

</script>

<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.getArticleByNum(num);
%>


<body>
<b>글수정</b>
<form method="post" name="updateForm" action="updateProc.jsp?num=<%=num%>&pageNum=<%=pageNum%>" onsubmit="return writeSave()">
	<table border="1" width="450" bgcolor="<%=bodyback_c%>" align="center">
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">이 름</td>
			<td width="300">
				<input type="text" name="writer" maxlength="10" value="<%=bb.getWriter()%>">
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">제 목</td>
			<td width="300">
				<input type="text" name="subject" maxlength="50" value="<%=bb.getSubject()%>">
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">Email</td>
			<td width="300">
				<input type="text" name="email" maxlength="10" value="<%=bb.getEmail()%>">
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">내 용</td>
			<td width="300">
				<textarea name="content" id="ta" rows="15" cols="50"><%=bb.getContent()%></textarea>
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">비밀번호</td>
			<td width="300">
				<input type="password" name="passwd" maxlength="10">
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="<%=value_c%>" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
</form>
</body>