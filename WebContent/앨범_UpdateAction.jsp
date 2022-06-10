<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="que.AlbumDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

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
		int albumId=0;
		if(request.getParameter("albumId") != null)
		{
			albumId = Integer.parseInt(request.getParameter("albumId"));
		}
			
		AlbumDAO queDAO = new AlbumDAO();
		
		if( request.getParameter("albumText") == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		else
		{
			int result = queDAO.update( albumId, request.getParameter("albumText"), request.getParameter("albumFileName") );
			
			if(result ==2)
			{
				int re=queDAO.update(albumId, request.getParameter("albumText"));
				if( re == -1)
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('수정에2 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else 
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("location.href = '앨범.jsp'");
					script.println("</script>");
				}	
			}
			else if( result == -1)
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
				script.println("location.href = '앨범.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>
