<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="que.QueDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="que" class="que.Que" scope="page" />
<jsp:setProperty name="que" property="queTitle" />
<jsp:setProperty name="que" property="queContent" />

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
		
		if(que.getQueTitle() == null || que.getQueContent() == null )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{	
			QueDAO qDAO = new QueDAO();
			int result = qDAO.write(que.getQueTitle(), userID , que.getQueContent(),que.getQueCount());
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
				script.println("location.href = 'q&a.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>