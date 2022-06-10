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
		<a class="list-group-item">교수 소개</a>
		<a href="교수소개.jsp" class="list-group-item">교수소개</a>    
		</div>
		<div class="row">    	
			<div class="center-block" style="width:650px;"> 
			<div class="panel panel-default">    
				<div class="panel-heading">       	
					<h3 class="panel-title">          
						교수소개       
					</h3> 
				</div>    
				<div class="panel-body"> 
				<table class="table">    
					<tbody> 
						<tr>
						<td>      
							<div class="media">    
								<a class="pull-left">       
									<img width="80" height="100" class="media-object" src="image/조태경교수님.jpg"        
									alt="Media Object">
								</a>   
								<div class="media-body">              
									<h5 class="media-heading">조태경</h5>
									<br>
									&nbsp;직위(학위):교수(공학박사)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연구분야:초고속 데이터통신망<p>
									&nbsp;사무실:한누리관 601A 호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호:041-550-5354<p>
								</div>
							</div> 
						</td>
						</tr>
						<tr>
						<td>
						<br>
							•[업무경력]•<p>
							1986. 01. 01 - 1996. 02. 29 LG정보통신 중앙연구소 Network Group 선임연구원<p>
							1996. 03. 01 - 2001. 12. 31 동서울대학 전기과 교수<p>
							2002. 01. 01 - 2003. 08. 31 한양사이버대학교 컴퓨터학과 교수<p>
							2003. 09. 01 – 2013. 11. 30 상명대학교 정보통신공학과 교수<p>
							2004. 08. 23 – 2015. 08. 31 상명대학교 사이버교육센터 소장<p>
							2011. 11. 01 - 2015. 08. 31 상명대학교 정보통신처장<p>
							2012. 05. 21 - 2015. 08. 31 상명대학교 원격평생교육원 원장<p>
							2013. 12. 01 - 현재.............상명대학교 정보보안공학과 교수<p>
							<br>
							•[대외활동경력]•<p>
							2006. 05. 01 – 2010. 05. 31 국방부 자체평가위원<p>
							2009. 10. 28 – 2014. 03. 31 국방부 기관평가위원<p>
							2013. 01. 01 – 2014. 12. 31 산업기술연구회 기획평가위원<p>
							2015. 10. 01 – 현재.............조달청 대형 S/W사업 전문평가위원<p>
							
							•[논문]• <p>
							- "Performance Analysis on VoDSL with Splitting Two Sublayers in AAL2", IEICE Trans. on communications, 2005. 04<p>
							 - "A shaper for non-real time ATM traffic", IEICE Trans. on communications, 2004. 03<p>
							 - "Usage parameter control algorithm based on cell priority", IEE Electronics Letters, 2000. 09<p>
							<br>
							•[저서]•<p>
							- "디지털 전자회로", 21세기사, 2005. 08<p>
							- "I am Internet", 인터비젼, 2003. 03<p>
							<br>
							•[수상]•<p> 
							- IR52 장영실상, FDDI Router, 한국산학기술학회, 1995<p> 
							- 전자공학회 기술상, FDDI Router, 대한전자공학회, 1993<p> 
							- LG 특허등록 최우수상, Address Filtering Circuit, LG정보통신, 1995 <p>
							<br>
							•[국제특허]•<p>
							- Frame stripping method and circuit in FDDI bridge system, 5461625, 1995. 10<p>
							
						</td>
						</tr>
						</tbody>
					</table>
					<a href="교수소개.jsp" class="btn btn-primary pull-right">목록</a>
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