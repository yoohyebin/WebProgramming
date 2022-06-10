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
			<div class="center-block" style="width:600px;"> 
			<div class="panel panel-default">    
				<div class="panel-heading">       	
					<h3 class="panel-title">          
						학과장 인사말      
					</h3> 
				</div>    
				<div class="panel-body">
				<br>
				<div class="media">    
					<a class="pull-left">       
						<img width="110" height="140" class="media-object" src="image/조태경교수님.jpg"        
						alt="Media Object">
					</a>   
					<div class="media-body">              
							상명대학교는 '최고의 정보보안 전문가 양성'을 목표로 기존의 국방정보공학과를 확대ㆍ발전시켜 정보보안공학과를 신설하였습니다.<p><br>
							저희 학과는 실무중심의 기술 습득을 위해 1 ~ 2 학년에는 '프로그래밍 언어', '컴퓨터 설계기술' 등을 집중적으로 교육하고, 3 ~ 4 학년에는 '보안알고리즘', '보안 시스템 설계', '보안S/W  설계', '보안 SoC 설계' 등을 교육하고 있습니다.<p><br>
							또한 저희 학과는 '우수한 교육환경', '풍부한 실무경험을 갖춘 교수진', '다양한 장학제도', '재학생들의 향학열' 등을 인정받아 국가 프라임 사업에 선정되어 현재 많은 혜택을 받고 있으며 이를 학생교육에 집중 투자하고 있습니다. 이러한 노력의 결과로 2018년도 졸업생(1회 졸업) 전원이 취업에 성공하였고, 저희 학과 모든 구성원은 향후에도 취업률 100%를 목표로 지속적인 노력을 다할 것입니다.<p><br> 
							진정한 정보보안 전문가가 되기를 희망하는 학생들은 저희와 함께 하시기 바랍니다.<p><br>
							함께 공부하고 함께 연구하여 최고의 엔지니어가 됩시다.<p><br>
							감사합니다.<p><br>
							2018. 03. 25    
					</div> 
				</div>
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