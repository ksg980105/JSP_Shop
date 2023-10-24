<%@page import="my.board.BoardBean"%>
<%@page import="my.board.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="color.jsp"%>
<%@ include file="../display/mall_top.jsp"%>

<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin: auto;
	}
</style>
list.jsp<br>

<%
	BoardDao bdao = BoardDao.getInstance();
	System.out.println("list.jsp bdao:" + bdao);
	
	int pageSize = 10; //한페이지에 보일 개수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String pageNum = request.getParameter("pageNum"); // pageNum=2
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum); // 현재 페이지
	int startRow = (currentPage-1) * pageSize + 1; // 시작 페이지번호
	int endRow = currentPage * pageSize;	// 마지막 페이지번호
	// 1:1,10
	// 2:11,20
	// 3:21,30
	
	int count = bdao.getArticleCount();
	System.out.println("count:" + count);
	int number = count - (currentPage-1) * pageSize;
	// 1page : 14
	// 2page : 4
	ArrayList<BoardBean> articleLists = bdao.getArticles(startRow,endRow); 

%>

<body>
	<b>글목록(전체 글:<%=count %>)</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="<%=value_c%>">
					<a href="writeForm.jsp">글쓰기</a>
				</td>
			</tr>
		</table>
		<%
			if(count == 0){
		%>
				<table width="700">
					<tr>
						<td align="right" bgcolor="<%=value_c%>">
							게시판에 저장된 글이 없습니다.
						</td>
					</tr>
				</table>
		<%}else{ %>
		
		<table width="700" align="center">
			<tr bgcolor="<%=value_c%>" align="center">
				<th width="50">번호</th>
				<th width="250">제목</th>
				<th width="100">작성자</th>
				<th width="150">작성일</th>
				<th width="50">조회</th>
				<th width="100">IP</th>
			</tr>
			<%
				for(int i=0; i<articleLists.size(); i++){
					BoardBean bb = articleLists.get(i);
			%>
			<tr>
				<td><%=number-- %></td>
				<td>
					<%
						int wid = 0; //폭설정
						if(bb.getRe_level()>0){	//답글종류
							wid = bb.getRe_level() * 20;
							// 1(답글) : 20
							// 2(답글의답글) : 40
							// 3(답글의답글의답글) : 60
					%>
							<img src="images/level.gif" width="<%=wid%>">
							<img src="images/re.gif">
					<%
						}else{ //원글
							
						}
					%>
					
				<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=currentPage%>">
					<%=bb.getSubject()%>
				</a>
				<%
					if(bb.getReadcount()>=10){
				%>
					<img src="images/hot.gif">
				<%} %>
				</td>
				<td><%=bb.getWriter()%></td>
				<td><%=sdf.format(bb.getReg_date())%></td>
				<td><%=bb.getReadcount()%></td>
				<td><%=bb.getIp()%></td>
			</tr>
			<%} %>
		</table>
		
		<%}%>
		<!-- 페이지 설정 -->
		<%
			if(count > 0 ){
				int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
							// pageSize:10 =>14:2 20:2 전체 페이지 개수
						
				int pageBlock = 3; // 보일수있는 최대 페이지 개수
				int startPage = ((currentPage-1)/pageBlock * pageBlock)+1;
				int endPage = startPage + pageBlock - 1;
				//1page : start:1, end:3
				//2page : start:1, end:3
				//3page : start:1, end:3
				//4page : start:4, end:6
				//5page : start:4, end:6
				//6page : start:4, end:6
				//7page : start:7, end:7
				if(endPage > pageCount){	//9>7 endpage가 pagecount보다 크면 
					endPage = pageCount;	//endpage를 7로 만든다.
				}
				
				if(startPage>3){
			%>
					<a href="list.jsp?pageNum=<%=startPage-3%>">[이전]</a>
			<%		
				}
				for(int i=startPage; i<=endPage; i++){
			%>
					<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
			<%					
				}
				if(endPage < pageCount){
			%>
					<a href="list.jsp?pageNum=<%=startPage+3%>">[다음]</a>
			<%		
				}
			}
		%>
</body>

<%@ include file="../display/mall_bottom.jsp"%>