<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="que.NoticeDAO" %>
<%@ page import="que.Notice" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="que" class="que.Notice" scope="page" />
<jsp:setProperty name="que" property="noticeTitle" />
<jsp:setProperty name="que" property="noticeContent" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int noticeID=0;
	if(request.getParameter("noticeID") != null)
	{
		noticeID=Integer.parseInt(request.getParameter("noticeID"));
	}
	NoticeDAO nDAO = new NoticeDAO();
	if(request.getParameter("noticeTitle")==null || request.getParameter("noticeContent") ==null)
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else
	{
		int result=nDAO.update(noticeID,request.getParameter("noticeTitle"),request.getParameter("noticeContent"));
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
			script.println("location.href = '학과공지.jsp'");
			script.println("</script>");
		}	
	}
%>
</body>
</html>