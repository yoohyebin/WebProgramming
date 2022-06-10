<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="que.BbsDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="que" class="que.BbsDTO" scope="page" />
<jsp:setProperty name="que" property="bbsTitle" />
<jsp:setProperty name="que" property="bbsContent" />
<jsp:setProperty name="que" property="bbsFileName" />

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
	
	String userID=null;
	if(session.getAttribute("userID") !=null)
	{
		userID = (String) session.getAttribute("userID");
	}
	
	BbsDAO bbsDAO = new BbsDAO();
	
	if(que.getBbsTitle() == null || que.getBbsContent() == null)
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	if(que.getBbsFileName()==null)
	{
		int result = bbsDAO.write( userID, que.getBbsTitle(), que.getBbsContent(),que.getBbsCount());
	
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
			script.println("location.href = '강의자료실.jsp'");
			script.println("</script>");
		}	
	}
	else
	{
		int result = bbsDAO.write( userID, que.getBbsTitle(), que.getBbsContent(), que.getBbsFileName(),que.getBbsCount());
		
		
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
			script.println("location.href = '강의자료실.jsp'");
			script.println("</script>");
		}	
	}
%>
</body>
</html>