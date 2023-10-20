<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function goCart(pnum){
		ovalue = document.f.oqty.value;
		if(ovalue < 1 || ovalue ==""){
			alert("주문수량 누락 또는 상품갯수를 1 이상 입력하세요");
			return false;
		}
		
		location.href = "mall_cartAdd.jsp?pnum="+pnum+"&ovalue="+ovalue;
	}
</script>

<%@ include file="mall_top.jsp"%>
	<%
		int pnum = Integer.parseInt(request.getParameter("pnum"));
	
		ProductDao pdao = ProductDao.getInstance();
		ProductBean pb = pdao.getSelectByPnum(pnum);
		
	%>
	
	<table align="center" border="0" class="outLine" width="100%">
		<tr class="m1">
			<td colspan="2" align="center">
				<font color=green size=3>
					<b>[<%=pb.getPname()%>] 상품 정보</b>
				</font>
			</td>
		</tr>
		<tr>
			<td align="center" class="m3">
				<%
				String pimage = pb.getPimage();
				String imgPath = request.getContextPath()+"/myshop/images/"+pimage;
				%>
				<img src="<%=imgPath%>" width="200" height="200"><br>
			</td>
			<td>
				<form name="f" method="post">
					상품번호: <%=pnum%> <br>
					상품이름: <%=pb.getPname()%> <br>
					상품가격: <font color=red><%=pb.getPrice()%>원 </font><br>
					상품포인트: <font color=red>[<%=pb.getPoint()%>] point</font><br>
					상품갯수: 
						<input type="text" name="oqty" value="1" size="5">개 <br><br>
						
					<table border="0" width="100" align="center">
						<tr>
							<td>
								<a href="javascript:goCart('<%=pnum%>')">
									<img src="<%=request.getContextPath()%>/img/cartbtn.gif" width="100" height="40">
								</a>
							</td>
							<td>
								<a href="">
									<img src="<%=request.getContextPath()%>/img/orderbtn.gif" width="100" height="40">
								</a>
							</td>
						</tr>
					</table>
				</form>
		<tr height="200" valign="top">
			<td colspan="2">
				상품 상세 설명<br>
				<%=pb.getPcontents()%>
			</td>
		</tr>
	</table>
<%@ include file="mall_bottom.jsp"%>