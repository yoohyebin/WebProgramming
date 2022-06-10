<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상명대학교 정보보안공학과</title>
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
		<a class="list-group-item">학과소개</a>
		<a href="교육목표.jsp" class="list-group-item">교육목표</a>      
		<a href="학과장인사말.jsp" class="list-group-item">학과장인사말</a>    
		<a href="학과연혁.jsp" class="list-group-item">학과연혁</a>  
		<a href="졸업후진로.jsp" class="list-group-item">졸업후진로</a>
		<a href="학과사무실안내.jsp" class="list-group-item">학과사무실안내</a>     
		</div>
		<div class="row">    	
			<div class="center-block" style="width:620px;"> 
			<div class="panel panel-default">    
				<div class="panel-heading">       	         
					 <h2 class="panel-title">          
					 	교육목표       
					 </h2> 
				</div>    
				<div class="panel-body">       
					<h4>○학과 슬로건 </h4><p>
					Be the one!<p>
					<br>
					<h4>○학과 소개 </h4><p>
					정보보안공학과는 정보사회의 핵심기술인 정보보안 분야의 최고 전문가를 양성하는 학과이다.<p>
					이를 위해 본학과는 정보보안기술에 대한 입체적 교육과정을 운영하고 있으며, 전체 교육과정이 창의적 사고 능력의 향상과 실무 중심의 기술 교육에 집중하고 있다.<p>
					본 학과의 교육과정을 성실히 이수한 학생은 '암호기술', '정보보안 시스템 설계 기술', '정보보안 프로그램 개발 기술', '보안 칩 설계 기술', '인터넷 보안 기술' 등의 분야에 첨단 지식을 갖춘 정보보안 전문가로 성장할 것이다<p><br><br>
					<h4>○교육 목표</h4><p>
					본 학과는 '정보보안 분야의 최고 전문가 양성'을 교육목표로 한다.<p>
					또한 본 학과가 육성하고자 하는 인재상은 다음과 같다.<p>
					<ul>   
						<li>창의인재 양성 → 창의적 설계 능력을 갖춘 인재 양성</li>   
						<li>실무인재 양성 → 설계교과 강화를 통한 실무형 인재 양성</li>  
						<li>도덕인재 양성 → 공학윤리를 갖춘 인재 양성</li> 
					</ul>
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
<script src="https://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>