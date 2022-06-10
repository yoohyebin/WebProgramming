<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserDTO" scope="page" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserDAO uDAO =new UserDAO();
	ArrayList<UserDTO> list = uDAO.getList();
	for(int i=0;i<list.size();i++)
	{
		if(list.get(i).getUserName()==user.getUserName() && list.get(i).getUserEmail()==user.getUserEmail())
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert(list.get(i).getUserID)");
			script.println("</script>");
		}
	}
%>
</body>
</html>