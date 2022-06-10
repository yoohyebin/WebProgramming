<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="que.ReDAO" %>
<%@ page import="que.QueDAO" %>
<%@ page import="que.Que" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="que" class="que.Re" scope="page" />
<jsp:setProperty name="que" property="reText" />

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
		
		ReDAO qDAO = new ReDAO();
		if(que.getReText()==null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			int result = qDAO.write(queID,userID, request.getParameter("reText"));
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
				response.sendRedirect("q&a_view.jsp?queID="+queID);
			}
		}
	%>

</body>
</html>