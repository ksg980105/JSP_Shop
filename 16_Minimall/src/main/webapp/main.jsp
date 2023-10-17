<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="style.css" type="text/css">

[로그인 화면]

<form method="post" action="LoginPro.jsp">
	<table border="1" height="120">
		<tr>
			<td bgcolor="yellow">아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td bgcolor="yellow">비번</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#ffcc00">
				<input type="submit" value="로그인" onClick="">
				<input type="button" value="회원 가입" onClick="location.href='myshop/member/register.jsp'">
				<input type="button" value="아이디 찾기" onClick="">
				<input type="button" value="비번 찾기" onClick="">
		</td>
	</table>
</form>