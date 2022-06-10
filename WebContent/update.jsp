<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<center>
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
<br>
<div class="center-block" style="width:900px;"> 	
<div class="panel panel-default">    
	<div class="panel-heading">       	
		<h3 class="panel-title">          
			정보수정
		</h3> 
	</div>    
	<div class="panel-body">	
		<%
			String userID=null;
			if(session.getAttribute("userID") !=null)
			{
				userID = (String) session.getAttribute("userID");
			}
			UserDTO u = new UserDAO().getBbs(userID);
			UserDAO uDAO = new UserDAO();	
		%>			
		<form method="post" action="updateAction.jsp?userID=<%=userID%>">
			<table class="table">
				<tbody>
						<%		
							UserDTO list = uDAO.getBbs(userID);
						%>
						<tr>
						 <td>비밀번호 </td>
						</tr>
					<tr>
						<td><textarea type="text"  class="form-control" name="userPassword" maxlength="200" style="height:40px;"><%= list.getUserPassword() %></textarea></td>
				    </tr>
				    <tr>
						 <td>이름 </td>
					</tr>
					<tr>
						<td><textarea type="text"  class="form-control" name="userName" maxlength="200" style="height:40px;"><%= list.getUserName() %></textarea></td>
					</tr>
					<tr>
						 <td>성별 </td>
					</tr>
					<tr>
						<td><label class="checkbox-inline">       
							<input type="checkbox" name="userGender" value="여자"> 여자    
						</label>    
						<label class="checkbox-inline">
							 <input type="checkbox" name="userGender" value="남자"> 남자    
						</label></td>
					</tr>
					<tr>
						 <td>이메일 </td>
					</tr>
					<tr>
						<td><textarea type="text"  class="form-control" name="userEmail" maxlength="200" style="height:40px;"><%= list.getUserEmail() %></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
					        <input type="submit" class="btn btn-primary" value="저장">
	                        <a href="mypage.jsp" class="btn btn-primary">목록</a>
						</td>
					</tr>
				</tbody>		
			</table>
		</form>
	</div>	
</div>
</div>
<br>
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