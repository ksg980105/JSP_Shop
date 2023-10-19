<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));

	ProductDao pdao = ProductDao.getInstance();
	
	ProductBean pb = pdao.getAllProductByPnum(pnum);
%>

<jsp:include page="top.jsp"/>

	<td colspan="6" align="center" valign="top">
		<form name="f" action="prod_updateproc.jsp" method="post" enctype="multipart/form-data">
			<table border=0 class="outline" width="600">
			<caption><b>상품수정</b></caption>
				<tr>
					<th class="m2">카테고리</th>
					<td align=left>
						<input type="text" name="pcategory_fk" value="<%=pb.getPcategory_fk()%>">
					</td>
				</tr>
				<tr>
					<th class="m2">상품번호</th>
					<td align=left>
						<%=pb.getPnum()%>
						<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
					</td>
				</tr>
				<tr>
					<th class="m2">상품명</th>
					<td align=left>
						<input type="text" name="pname" value="<%=pb.getPname()%>">
					</td>
				</tr>
				<tr>
					<th class="m2">제조회사</th>
					<td align=left>
						<input type="text" name="pcompany" value="<%=pb.getPcompany()%>">
					</td>
				</tr>
				<tr>
					<th class="m2">상품이미지</th>
					<td align=left>
						<img  src="<%=request.getContextPath()%>/myshop/images/<%=pb.getPimage()%>" width="100"> 
						<input type="file" name="pimage"> <br>
						<input type="text" name="pimage2" value="<%=pb.getPimage()%>">
					</td>
				</tr>
				<tr>
					<th class="m2">상품 수량</th>
					<td align=left>
						<input type="text" name="pqty" value="<%=pb.getPqty()%>" maxlength=8>
					</td>
				</tr>
				<tr>
					<th class="m2">상품 가격</th>
					<td align=left>
						<input type="text" name="price" value="<%=pb.getPrice()%>" maxlength=8>
					</td>
				</tr>
				<tr>
					<th class="m2">상품 스펙</th>
					<td align=left>
						<select name="pspec">
							<%
								String[] pspec = {"NORMAL","HIT","NEW","BEST"};
								for(int i=0; i<pspec.length; i++){
							%>
							<option value="<%=pspec[i]%>" <%if(pb.getPspec().equals(pspec[i])){%>selected<%}%>><%=pspec[i]%></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th bgcolor="yellow">상품 소개</th>
					<td align=left>
						<textarea cols="50" rows="5" style="resize:none;" name="pcontents"><%=pb.getPcontents()%></textarea>
						<%--resize:none textarea 크기 늘리지 못하게 설정--%>
					</td>
				</tr>
				<tr>
					<th bgcolor="yellow">상품 포인트</th>
					<td align=left>
						<input type="text" name="point" value="<%=pb.getPoint()%>">
					</td>
				</tr>
				<tr>
					<td colspan="2" align=center>
						<input type="submit" value="상품 수정">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</td>
<jsp:include page="bottom.jsp"/>