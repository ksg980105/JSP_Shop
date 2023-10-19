<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var result = confirm("정말 삭제하시겠습니까?"); //확인, 취소
		
		if(result){
			location.href="prod_deletePro.jsp?pnum="+pnum+"&pimage="+pimage;
		}
	}
</script>
<jsp:include page="top.jsp"/>
<%
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> lists = pdao.getAllProduct();
%>
	<td colspan="6" align="center">
			<table border=0 class="outline" width="600" valign="top">
			<caption><b>상품목록</b></caption>
				<tr class="m2">
					<th>번호</th>
					<th>상품코드</th>
					<th>상품명</th>
					<th>이미지</th>
					<th>가격</th>
					<th>제조사</th>
					<th>수량</th>
					<th>수정|삭제</th>
				</tr>
				<%
					if(lists.size()==0){
				%>
						<tr><td colspan = "8">등록된 상품이 없습니다.</td></tr>
				<%
					}else{
						
					for(ProductBean pb : lists){
						String imgPath = request.getContextPath() + "/myshop/images/" + pb.getPimage();
				%>
					<tr>
						<td><%=pb.getPnum()%></td>
						<td><%=pb.getPcategory_fk()%></td>
						<td><%=pb.getPname()%></td>
						<td><img src="<%=imgPath%>" width="50" height="50"></td>
						<td><%=pb.getPrice()%></td>
						<td><%=pb.getPcompany()%></td>
						<td><%=pb.getPqty()%></td>
						<td>
							<a href="prod_update.jsp?pnum=<%=pb.getPnum()%>">수정|</a>
							<a href="javascript:checkDel('<%=pb.getPnum()%>','<%=pb.getPimage()%>')">삭제</a>
						</td>
					</tr>
				<%		
					}
				}
				%>
			</table>
	</td>
<jsp:include page="bottom.jsp"/>