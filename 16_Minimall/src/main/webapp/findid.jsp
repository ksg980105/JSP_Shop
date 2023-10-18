<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css" type="text/css">


<form method="post" action="findidPro.jsp">
	<table border="1" align="center">
		<tr>
			<th bgcolor="yellow">이름</th>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow">주민 등록 번호</th>
			<td>
				<input type="text" name="ssn1" maxlength="6"> -
				<input type="text" name="ssn2" maxlength="7">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" bgcolor="#ffcc00">
				<input type="submit" value="아이디 찾기">
			</td>
		</tr>
	</table>
</form>