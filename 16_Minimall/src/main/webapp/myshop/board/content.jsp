<%@page import="my.board.BoardBean"%>
<%@page import="my.board.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.getArticle(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>

<body>
	<b>글내용 보기</b>
	<table border="1" width="500" bgcolor="<%=bodyback_c%>" align="center">
		<tr>
			<td width="125" bgcolor="<%=value_c%>" align="center">글번호</td>
			<td width="125" align="center"><%=bb.getNum()%></td>
			<td width="125" bgcolor="<%=value_c%>" align="center">조회수</td>
			<td width="125" align="center"><%=bb.getReadcount()%></td>
		</tr>
		<tr>
			<td width="125" bgcolor="<%=value_c%>" align="center">작성자</td>
			<td width="125" align="center"><%=bb.getWriter()%></td>
			<td width="125" bgcolor="<%=value_c%>" align="center">작성일</td>
			<td width="125" align="center"><%=sdf.format(bb.getReg_date())%></td>
		</tr>
		<tr>
			<td width="125" bgcolor="<%=value_c%>" align="center">글제목</td>
			<td colspan="3" align="center" width="375"><%=bb.getSubject()%></td>
		</tr>
		<tr>
			<td width="125" bgcolor="<%=value_c%>" align="center">글내용</td>
			<td colspan="3" align="left" width="375"><%=bb.getContent()%></td>
		</tr>
		<tr>
			<td bgcolor="<%=value_c%>" colspan=4 align="right">
				<input type="button" value="글수정" onClick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="답글쓰기" onClick="location.href='replyForm.jsp?ref=<%=bb.getRef()%>&re_step=<%=bb.getRe_step()%>&re_level=<%=bb.getRe_level()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="글목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>	
	</table>
</body>