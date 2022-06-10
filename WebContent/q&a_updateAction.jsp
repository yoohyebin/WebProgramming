<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="que.QueDAO" %>
<%@ page import="que.Que" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="que" class="que.Que" scope="page" />
<jsp:setProperty name="que" property="queTitle" />
<jsp:setProperty name="que" property="queContent" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int queID=0;
	if(request.getParameter("queID") != null)
	{
		queID=Integer.parseInt(request.getParameter("queID"));
	}
	QueDAO nDAO = new QueDAO();
	if(request.getParameter("queTitle")==null || request.getParameter("queContent") ==null)
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else
	{
		int result=nDAO.update(queID,request.getParameter("queTitle"),request.getParameter("queContent"));
		if( result == -1)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('수정에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else 
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href = 'q&a_view.jsp'");
			script.println("</script>");
		}	
	}
%>
</body>
</html>