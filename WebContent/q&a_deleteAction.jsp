<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="que.QueDAO" %>
<%@ page import="que.Que" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


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
		int queID=0;
		if(request.getParameter("queID") != null)
		{
			queID = Integer.parseInt(request.getParameter("queID"));
		}
		if(queID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href='q&a.jsp'");
			script.println("</script>");
		}
		Que que = new QueDAO().getQue(queID);
		if(userID != que.getQueUserID())
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'q&a.jsp'");
			script.println("</script>");
		}
	%>
	<% 
		QueDAO queDAO = new QueDAO();
		int result = queDAO.delete(queID);
		if( result == -1)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else 
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href = 'q&a.jsp'");
			script.println("</script>");
		}	
	%>

</body>
</html>