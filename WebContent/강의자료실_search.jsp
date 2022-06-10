<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="que.BbsDAO" %>
<%@ page import="que.BbsDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>
<body>
<center>
<div class="clearfix"  style="width:900px;"> 
		<div class="pull-right">
		 <%
		 	String userID=null;
			if(session.getAttribute("userID") !=null)
			{
				userID = (String) session.getAttribute("userID");
			}
			if(userID != null)	
			{
		 %>
		  	<a href="mypage.jsp" style="color:#444"><%=userID %></a> &nbsp;
			<a href="logoutAction.jsp" style="color:#444">로그아웃</a>
		<%
			}
			else
			{
		%>
			<table>
		<tr>
			<td><a href="login.jsp" style="color:#444"><h5>로그인 </h5></a></td>
			<td>&nbsp;&nbsp;</td>
			<td><a href="join.jsp" style="color:#444"><h5>회원가입</h5></a></td>
		</tr>
		</table>
		<%
			}
		%>
		</div> 
	</div>
<%
	if(userID == null)	
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용하세요.')");
		script.println("location.href = '강의자료실.jsp'");
		script.println("</script>");
	}
%>
	<div class="clearfix"  style="width:900px;">     	
		<div class="pull-left">       
			<div class="col-sm-6 col-md-6">       
				<a href="main.jsp">          
					<img src="image/상명대.png"           
					alt="Generic placeholder thumbnail">       
				</a>    
			</div>    
			<a href="main.jsp" style="color:#444"><h3>정보보안공학과</h3></a>
		</div>    
		<div class="pull-right">       
			<ul class="nav nav-pills">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="교육목표.jsp" style="color:#444">
						학과소개
					</a>
					<ul class="dropdown-menu">       
						<li><a href="교육목표.jsp">교육목표</a></li>       
						<li><a href="학과장인사말.jsp">학과장인사말</a></li> 
						<li><a href="학과연혁.jsp">학과연혁</a></li> 
						<li><a href="졸업후진로.jsp">졸업 후 진로</a></li> 
						<li><a href="학과사무실안내.jsp">학과사무실안내</a></li>     
					</ul> 
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="교수소개.jsp"style="color:#444">
						교수소개
					</a>
					<ul class="dropdown-menu">       
						<li><a href="교수소개.jsp">교수소개</a></li>         
					</ul> 
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="학사일정.jsp"style="color:#444">
						학사안내
					</a>
					<ul class="dropdown-menu">       
						<li><a href="학사일정.jsp">학사일정</a></li>       
						<li><a href="학과공지.jsp">학과공지</a></li>     
					</ul> 
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="강의자료실.jsp"style="color:#444">
						커뮤니티
					</a>
					<ul class="dropdown-menu">       
						<li><a href="강의자료실.jsp">강의자료실</a></li>       
						<li><a href="앨범.jsp">앨범</a></li> 
						<li><a href="q&a.jsp">Q&A</a></li>     
					</ul> 
				</li>
			</ul>   
		</div> 
	</div>
</center>
<div class="center-block" style="background-color:#3C6F95;">
	<center> 
		<img src="image/sample2.jpg" alt="Cinque Terre">
	</center>
</div>
<br>
<div class="center-block" style="width:900px;">
	<div class="clearfix" > 
		<div class="pull-left">
		<a class="list-group-item">커뮤니티</a>
		<a href="강의자료실.jsp" class="list-group-item">강의자료실</a>      
		<a href="앨범.jsp" class="list-group-item">앨범</a>    
		<a href="q&a.jsp" class="list-group-item">Q&A</a>       
		</div>
		<div class="row">    	
			<div class="center-block" style="width:650px;">	
			<div class="panel panel-default">    
				<div class="panel-heading">       	
					<h3 class="panel-title">          
						강의자료실   
					</h3> 
				</div>    
				<div class="panel-body">  
					<%
					int pageNumber=1;
					if(request.getParameter("pageNumber") != null)
					{
						pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
					}
				%>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>	
					</thead>	
					<tbody>
						<%
						BbsDAO qDAO = new BbsDAO();
						ArrayList<BbsDTO> list = qDAO.getList(pageNumber);
						for(int i=0; i< list.size(); i++){
							if(request.getParameter("option").equals("작성자"))
							{
							if(request.getParameter("search").equals(list.get(i).getBbsUserID())){
						%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="강의자료실_view.jsp?bbsID=<%=list.get(i).getBbsID()%>" style="color:#444"><%=list.get(i).getBbsTitle()%></a></td>
							<td><%= list.get(i).getBbsUserID() %></td>
							<td><%= list.get(i).getBbsDate()%></td>
							<td><%=list.get(i).getBbsCount() %></td>
						</tr>
						<%
								}
							}
							else if(request.getParameter("option").equals("제목"))
							{
								if(request.getParameter("search").equals(list.get(i).getBbsTitle()))
								{
						%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="강의자료실_view.jsp?nbbsID=<%=list.get(i).getBbsID()%>" style="color:#444"><%=list.get(i).getBbsTitle()%></a></td>
							<td><%= list.get(i).getBbsUserID() %></td>
							<td><%= list.get(i).getBbsDate()%></td>
							<td><%=list.get(i).getBbsCount() %></td>
						</tr>
						<%
								}
							}
						}
						%>
					</tbody>
				</table>
				<a href="강의자료실.jsp" class="btn btn-primary pull-right">목록</a>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
<center>
	<div class="row">    
		<div class="center-block" style="background-color:#F3F3F3;">
		<div class="clearfix" style="width:900px;background-color:#F3F3F3;">
		<div class="pull-left"> 
			<div class="clearfix" style="width:150px;background-color:#F3F3F3;"> 
				<div class="pull-left"> 
				<br>          
					<img src="image/상명대.png" alt="Cinque Terre" width="120">           
				</div>
			</div>
		</div>
		<div class="pull-left"> 
		<div class=""col-md-3" style="background-color:#F3F3F3;">
		<br>
			<p class="text-left">개인정보처리방침|이메일수집거부</p>
			<p class="text-left">(우)31066 충남 천안시 동남구 상명대길 31</p>
			<p class="text-left">TEL.041-550-5114</p>
			<br>
		</div>
		</div>
		</div>
		</div>
	</div>  
</center>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>