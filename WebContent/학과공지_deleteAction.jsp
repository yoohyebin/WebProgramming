<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="que.NoticeDAO" %>
<%@ page import="que.Notice" %>
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
		int noticeID=0;
		if(request.getParameter("noticeID") != null)
		{
			noticeID = Integer.parseInt(request.getParameter("noticeID"));
		}
		if(noticeID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href='학과공지.jsp'");
			script.println("</script>");
		}
		Notice que = new NoticeDAO().getNotice(noticeID);
		NoticeDAO queDAO = new NoticeDAO();
		int result = queDAO.delete(noticeID);
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
			script.println("location.href = '학과공지.jsp'");
			script.println("</script>");
		}	
	%>

</body>
</html>