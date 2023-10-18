<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDAO"%>
<%@page import="my.shop.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="top.jsp"/>

	<td colspan="6" align="center" valign="top">
		<form name="f" action="prod_proc.jsp" method="post" enctype="multipart/form-data">
			<table border=0 class="outline" width="600">
			<caption><b>상품등록 카테고리</b></caption>
				<tr>
					<th class="m2">카테고리</th>
					<td align=left>
						<select name="pcategory_fk">
						<%
							CategoryDAO cdao = CategoryDAO.getInstance();
							ArrayList<CategoryDTO> lists = cdao.getAllcate();
							if(lists.size()==0){
						%>
							<option value="">카테고리 없음</option>		
						<%	
							}else{
								for(CategoryDTO cb : lists){
									String cname = cb.getCname();
									String code = cb.getCode();
						%>
									<option value="<%=code%>"><%=cname %>[<%=code%>]</option>
						<%
								}
							}
						%>
						</select>
					</td>
				</tr>
				<tr>
					<th class="m2">상품명</th>
					<td align=left>
						<input type="text" name="pname" value="이름">
					</td>
				</tr>
				<tr>
					<th class="m2">상품코드</th>
					<td align=left>
						<input type="text" name="code" value="상품코드">
					</td>
				</tr>
				<tr>
					<th class="m2">제조회사</th>
					<td align=left>
						<input type="text" name="pcompany">
					</td>
				</tr>
				<tr>
					<th class="m2">상품이미지</th>
					<td align=left>
						<input type="file" name="pimage">
					</td>
				</tr>
				<tr>
					<th class="m2">상품 수량</th>
					<td align=left>
						<input type="text" name="pqty" maxlength=8>
					</td>
				</tr>
				<tr>
					<th class="m2">상품 가격</th>
					<td align=left>
						<input type="text" name="price" maxlength=8>
					</td>
				</tr>
				<tr>
					<th class="m2">상품 스펙</th>
					<td align=left>
						<select name="pspec">
							<option value="NORMAL" SELECTED>::NORMAL::</option>
							<option value="HIT">HIT</option>
							<option value="NEW">NEW</option>
							<option value="BEST">BEST</option>
						</select>
					</td>
				</tr>
				<tr>
					<th bgcolor="yellow">상품 소개</th>
					<td align=left>
						<textarea cols="50" rows="5" style="resize:none;" name="pcontents"></textarea>
					</td>
				</tr>
				<tr>
					<th bgcolor="yellow">상품 포인트</th>
					<td align=left>
						<input type="text" name="point">
					</td>
				</tr>
				<tr>
					<td colspan="2" align=left>
						<input type="submit" value="상품 등록">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</td>
<jsp:include page="bottom.jsp"/>