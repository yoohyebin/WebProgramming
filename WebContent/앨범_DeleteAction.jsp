<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="que.AlbumDAO" %>
<%@ page import="que.Album" %>
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
	
		int albumId=0;
		if(request.getParameter("albumId") != null)
		{
			albumId = Integer.parseInt(request.getParameter("albumId"));
		}

		Album que = new AlbumDAO().getAlbum(albumId);
		AlbumDAO queDAO = new AlbumDAO();
		int result = queDAO.delete(albumId);
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
			script.println("location.href = '앨범.jsp'");
			script.println("</script>");
		}
	
	%>

</body>
</html>