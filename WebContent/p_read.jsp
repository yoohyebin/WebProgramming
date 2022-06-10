<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%@ page import="que.pDAO" %>
<%@ page import="que.p" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>
<body>
	<%
		int pId=1;
		if(request.getParameter("pId") != null)
		{
			pId = Integer.parseInt(request.getParameter("pId"));
		}
		p que = new pDAO().getp(pId);
		
		
		out.clear();//jsp에서 쓰고있는 내장객체를 outputstream을 쓰기위해 해줘야함
		 
	    response.setHeader("Content-Type","images/jpg"); 
		BufferedOutputStream outs = null;
		outs = new BufferedOutputStream(response.getOutputStream());
		
				
		response.setContentType("images/jpg");
		InputStream is = que.getPData();
		
		int length = 0;
		int bufferSize = 1024;
		byte[] buffer = new byte[bufferSize];
		while((length=is.read(buffer))!=-1){
			outs.write(buffer, 0, length);
		}
		is.close();
		outs.close();
	%>
	
</body>
</html>
