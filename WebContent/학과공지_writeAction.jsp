<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="que.NoticeDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="que" class="que.Notice" scope="page" />
<jsp:setProperty name="que" property="noticeTitle" />
<jsp:setProperty name="que" property="noticeContent" />

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
		
		if(que.getNoticeTitle() == null || que.getNoticeContent() == null )
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{	
			NoticeDAO qDAO = new NoticeDAO();
			int result = qDAO.write(que.getNoticeTitle(), userID , que.getNoticeContent(),que.getNoticeCount());
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
				script.println("location.href = '학과공지.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>