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
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>


<body>
	<b>글삭제</b>
	<form method="post" action="deleteProc.jsp" onsubmit="return writeSave()">
	<table border="1">
		<tr>
			<td>비밀번호를 입력해 주세요</td>
		</tr>
		<tr>
			<td>비밀번호 : <input type="password" name="passwd">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="hidden" name="pageNum" value="<%=pageNum%>">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="글삭제">
				<input type="button" value="글목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
	</table>
	</form>
</body>