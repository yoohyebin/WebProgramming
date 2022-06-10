<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserDTO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

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
		if(userID != null)	
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어 있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	
		if(user.getUserID() == null || user.getUserPassword() == null ||
			user.getUserName() == null || user.getUserGender() == null
			|| user.getUserEmail() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if( result == -1)
			{
				UserDTO u = userDAO.getBbs(user.getUserID());
				if(u.getUserAvailable()==0)
				{
					int re= userDAO.reupdate(user.getUserID(),user.getUserPassword(),user.getUserName(),user.getUserGender(),user.getUserEmail());
					if(re==-1)
					{
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('회원가입에 실패하였습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else
					{	
						session.setAttribute("userID", user.getUserID());
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("location.href = 'main.jsp'");
						script.println("</script>");
					}
				}
				else
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
			}
			else if( result == 1)
			{
				session.setAttribute("userID", user.getUserID());
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>