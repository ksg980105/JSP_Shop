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

<%
	request.setCharacterEncoding("UTF-8");

	String ref = request.getParameter("ref");
	String re_step = request.getParameter("re_step");
	String re_level = request.getParameter("re_level");
	String pageNum = request.getParameter("pageNum");

	System.out.println(ref);
	System.out.println(re_step);
	System.out.println(re_level);
%>


<script src="js/jquery.js" type="text/javascript"></script>
<script src="script.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert(1);
	});
</script>

<body>
<b>글쓰기</b>
<form method="post" name="replyForm" action="replyProc.jsp?ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&pageNum=<%=pageNum%>" onsubmit="return writeSave()">
	<table border="1" width="450" bgcolor="<%=bodyback_c%>" align="center">
		<tr>
			<td align="right" colspan="2" bgcolor="<%=value_c%>">
				<a href="list.jsp">글목록</a>
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">이 름</td>
			<td width="300">
				<input type="text" name="writer" maxlength="10" value="홍길동">
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">제 목</td>
			<td width="300">
				<input type="text" name="subject" maxlength="50" value="어떤글">
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">Email</td>
			<td width="300">
				<input type="text" name="email" maxlength="10" value="aa@xx.com">
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">내 용</td>
			<td width="300">
				<textarea name="content" id="ta" rows="15" cols="50">호호호</textarea>
			</td>
		</tr>
		<tr>
			<td width="150" bgcolor="<%=value_c%>" align="center">비밀번호</td>
			<td width="300">
				<input type="password" name="passwd" maxlength="10" value="1234">
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="<%=value_c%>" align="center">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
</form>
</body>