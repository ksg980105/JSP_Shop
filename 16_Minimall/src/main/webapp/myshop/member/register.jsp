<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="../../style.css" type="text/css"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css" type="text/css">
myshop\member\register.jsp<br>

<script src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script src="../../script.js" type="text/javascript"></script>

<form action="registerPro.jsp" method="post" onSubmit="return writeSave()">
	<table border="1" align="center">
		<tr>
			<th colspan="2" bgcolor="#ffcc00">
				<font size="3" color="#5d1900">◈ 기본 정보 ◈</font>
			</th>
		</tr>
		<tr>
			<th bgcolor="yellow">* 회원 아이디</th>
			<td>
				<input type="text" name="id">
				<button type="button" onClick="return duplicate()">중복체크</button>
				<span id="idmessage"></span>
			</td>
			
		</tr>
		<tr>
			<th bgcolor="yellow">* 비밀 번호</th>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<th bgcolor="yellow">* 비밀 번호 확인</th>
			<td>
				<input type="password" name="repassword" onKeyUp="repassword_keyup()">
				<span id="pwmessage"></span>
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow">E-Mail</th>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#ffcc00">
				<font size="3" color="#5d1900">◈ 개인 신상 정보 ◈</font>
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow">한글 이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th bgcolor="yellow">주민 등록 번호</th>
			<td>
				<input type="text" name="ssn1" size="9"> - <input type="text" name="ssn2" size="9">
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow">휴대 전화 번호</th>
			<td>
				<select name="hp1">
					<option value="010">010
					<option value="011">011
					<option value="012">012
					<option value="013">013
				</select>
				-
				<input type="text" name="hp2" size="5"> - <input type="text" name="hp3" size="5">
			</td>
		</tr>
		<tr>
			<th bgcolor="yellow">가입 일자</th>
			<td><input type="text" name="joindate" size="13"></td>
		</tr>
		<tr bgcolor="#ffcc00">
			<td colspan="2">
				<input type="submit" id="sub" value="가입 하기">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>