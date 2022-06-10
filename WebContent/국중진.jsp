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
									<img width="80" height="100" class="media-object" src="image/국중진교수님.jpg"        
									alt="Media Object">
								</a>   
								<div class="media-body">              
									<h5 class="media-heading">국중진</h5>
									<br>
										&nbsp;직위(학위):조교수(공학박사)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연구분야:운영체제<p>
										&nbsp;사무실:한누리관 507B 호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호:041-550-5398<p>
								</div> 
							</div> 
						</td>
						</tr>
						<tr>
						<td>
						<br>
							•[업무경력]•<p>
							2005. 03. 01 - 2017. 06. 30 전자부품연구원 VR/AR연구센터 연구원<p>
							2017. 09. 01 - 현재..........상명대학교 정보보안공학과 조교수<p>
							<br>
							<br>
							•[대외활동경력]•<p>
							2016. 09. 01 - 현재......... 한국전자정보통신산업진흥회 IoT융합지원센터 기술전문위원<p>
							2017. 09. 01 - 현재......... (주)HAII 기술자문<p>
							<br>
							<br>
							•[논문]• <p>
							- Joongjin Kook, Junghoon Shin, “Design and Implementation of Tizen IVI-based MobileSecond Platform Architecture & its Applications”, International Journal of Applied Engineering Research, Vol. 12, No. 12, pp. 3282-3286, Jul, 2017.<p>
							- Joongjin Kook, Jinman Kim, Eui-chul Lee, “Design and Implementation of Android IVI-based MobileSecond Platform Architecture & its Applications”, International Journal of Applied Engineering Research, Vol. 12, No. 12, pp. 3157-3161, Jul, 2017.<p>
							- Jinman Kim, Joongjin Kook, “A Study on Density-Based Clustering Method Considering Directionality,” International Journal of Applied Engineering Research, Vol. 12, No. 12, Jul, 2017.<p>
							- Yong-Seok Lim, Seung-Ok Lim, Young-Choong Park, Byoung-Ha Park and Joongjin Kook, “A Design and Implementation of an Emotion Reasoning Chip Based Emotion Reasoning System,” Lecture Node on Software Engineering, IACSIT Press, Apr. 2013.<p>
							- Joongjin Kook, “A Symmetric Hierarchical Clustering Related to the Sink Position and Power Threshold for Sensor Networks,” Lecture Note in Computer Science, Springer, May. 2013.<p>
							- LaxmishaRai, Joongjin Kook, and Jiman Hong, “Non-Deterministic Behavior Modeling Framework for Embedded Real-Time Systems Operating in Uncertain Environments,” Journal of Information Science and Engineering, Vol. 26, pp. 83-96, 2010.<p>
							- Joongjin Kook, Jiman Hong, Sangjun Lee, Dongseop Kwon, and Sangho Yi, “T-LEACH: The method of threshold-based cluster head replacement for wireless sensor networks,”Journal of Information Systems Frontiers, Vol. 11, Issue 5, pp. 513-521, Nov., 2009.<p>
							- KwangMo Jung, Joong-Jin Kook, Kwang-Soon Choi, Seong-Dong Kim, Sangwon Min, “Energy Efficient Route Recovery Methods for Wireless Sensor Networks Using Hybrid Checkpointing,” ICCSA (2), Lecture Notes in Computer Science, Vol. 4706, pp. 593-601, Springer, 2007.<p>
							<br>
							<br>
							•[저서]•<p>
							- 라즈베리 파이로 구현하는 사물인터넷 프로젝트, 위키북스, 2015. 03<p>
							- 임베디드의 모든 것, 위키북스, 2014. 03<p>
							- 안드로이드 ADK와 아두이노, KEA, 2012. 11<p>
							- 언로킹 안드로이드, 프리렉, 2010. 01<p>
							- 안드로이드 내부구조의 이해, KEA, 2010. 12<p>
							- 리눅스 커널 in a nutshell, 프리렉, 2009. 01<p>
							- 액세스 2007, 영진닷컴, 2008. 06<p>
							<br>
							<br>
							•[수상]• <p>
							- LinuxOne 2004 Change Movement 최우수상, (주)리눅스원, 2005. 04<p>
							<br>
							<br>
							•[국제특허]•<p>
							- Method for Providing Playback Order of eBook and Add-on, PCT/KR2013/009003, 2014. 04<p>
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