<%@page import="my.shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_input.jsp => prod_proc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String pcategory_fk = request.getParameter("pcategory_fk");
	String pname = request.getParameter("pname");
	String pcode = request.getParameter("pcode");
	String pimage = request.getParameter("pimage");
	
	System.out.println("pcategory_fk:"+pcategory_fk);
	System.out.println("pname:"+pname);
	System.out.println("pcode:"+pcode);
	System.out.println("pimage:"+pimage);
	
	int maxSize = 1024*1024*10;
	String configFolder =""; 
	String encoding="UTF-8";
	String saveFolder="myshop/images"; 
	
	configFolder=config.getServletContext().getRealPath("myshop/images");
	System.out.println("configFolder:"+configFolder);
	// C:\JSP_ysy2\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\16_Minimall\myshop\images
	MultipartRequest mr = null;
	
	mr = new MultipartRequest(request,
								configFolder, 
								maxSize, 
								encoding, 
								new DefaultFileRenamePolicy());

	System.out.println("pcategory_fk:"+mr.getParameter("pcategory_fk"));
	System.out.println("pname:"+mr.getParameter("pname"));
	System.out.println("pcode:"+mr.getParameter("pcode"));
	//System.out.println("pimage:"+mr.getParameter("pimage"));
	String fs_filename = mr.getFilesystemName("pimage");
	System.out.println("fs_filename:"+fs_filename);
	
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.insertProduct(mr); 
	String msg, url;
	if(cnt > 0){
		msg = "등록 성공";
		url = "prod_list.jsp";
	}else{
		msg = "등록 실패";
		url = "prod_input.jsp";
	}
	//성공,실패 list.jsp input.jsp
%>

<script type="text/javascript">
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>
 
 
 
 
 
 
 
 
 
 