<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="que.ReDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="que" class="que.Re" scope="page" />
<jsp:setProperty name="que" property="reText" />
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload to Database Demo</title>
</head>
<body>
	<%
		int reID=0;
		if(request.getParameter("reID") != null)
		{
			reID = Integer.parseInt(request.getParameter("reID"));
		}
		if(que.getReText() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{	
			ReDAO rDAO = new ReDAO();
			int result = rDAO.update(reID, request.getParameter("reText"));
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else 
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("location.href='q&a.jsp'");
				script.println("</script>");
			}
		}	
	%>
</body>
</html>
