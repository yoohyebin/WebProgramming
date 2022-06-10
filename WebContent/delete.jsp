<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	UserDAO uDAO = new UserDAO();
	int result = uDAO.delete(userID);
	if( result == -1)
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('탈퇴에 실패하였습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else 
	{
		PrintWriter script=response.getWriter();
		session.invalidate();
		script.println("<script>");
		script.println("alert('탈퇴되었습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}	
%>
</body>
</html>