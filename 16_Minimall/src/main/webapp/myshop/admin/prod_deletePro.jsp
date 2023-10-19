<%@page import="java.io.File"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	String pimage = request.getParameter("pimage");

	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.deleteProduct(pnum); //DB 레코드 삭제
	
	String delPath = config.getServletContext().getRealPath("myshop/images"); //그냥 글자
	File dir = new File(delPath); //폴더의 역할을 할수있게 변환
	File delFile = new File(dir, pimage); //dir폴더 안에있는 pimage 파일 접근
	
	if(delFile.exists()){		//delFile이 존재하면 true
		if(delFile.delete()){	//delFile 삭제 성공하면 true
%>
			<script type="text/javascript">
				alert('이미지파일 삭제 성공');
			</script>
<%
		}
	}
	
	String msg, url;
	
	if(cnt != -1){
		msg = "삭제 성공";
		url = "prod_list.jsp";
	}else{
		msg = "삭제 실패";
		url = "prod_list.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>