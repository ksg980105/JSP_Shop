<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="top.jsp"/>
<script type="text/javascript">
	function check(){
		vcode = document.f.code.value;
		vcname = document.f.cname.value;
		
		if(vcode == ""){
			alert('코드를 입력하세요.');
			document.f.code.focus();
			return false;
		}
		
		if(vcname == ""){
			alert('카테고리 이름을 입력하세요.');
			document.f.cname.focus();
			return false;
		}
	}
</script>
	<td colspan="6" align="center">
		<form method="post" action="cate_proc.jsp" name="f">
			<table border="1" width="350" align="center">
			<caption><b>카테고리 등록</b></caption>
				<tr>
					<td bgcolor="yellow" align="center">카테고리 코드</td>
					<td><input type="text" name="code" maxlength=12></td>
				</tr>
				<tr>
					<td bgcolor="yellow" align="center">카테고리 이름</td>
					<td><input type="text" name="cname"></td>
				</tr>
				<tr>
					<td colspan="2" align="center" bgcolor="#ffcc00">
						<input type="submit" value="등록" onClick="return check()">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</td>
<jsp:include page="bottom.jsp"/>