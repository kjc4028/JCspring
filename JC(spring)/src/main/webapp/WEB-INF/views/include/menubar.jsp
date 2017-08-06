<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
 <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/custom.css'/>" >
<link rel="stylesheet" href="<c:url value='/resources/css/*'/>" >
<script src="<c:url value ='/resources/js/bootstrap.js' />" ></script>
    <title> title here</title>
</head>
<body>
  <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script> 
$(document).ready(function(){
    $("#bbb").click(function(){
        $("#b").animate({
            height: 'toggle'
        });
      

    });
});
</script> 
  <% String userID = null;
if(session.getAttribute("userID") != null){
   userID = (String)session.getAttribute("userID");
}

%>
<div class="jbMenu">
	<nav class="navbar navbar-default">

	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expended="false">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="${pageContext.request.contextPath}/">JC Community</a>
	</div>
	
	
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li ><a href="${pageContext.request.contextPath}/">메인</a></li>
			<li ><a href="${pageContext.request.contextPath}/board/bbsAllList?page=1&perPageNum=10">게시판</a></li>
			
			
			</ul>
		
			
			
		<ul class="nav navbar-nav navbar-right">
			
				
					
					<li><a href="${pageContext.request.contextPath}/member/listAll">회원 목록</a></li>
					
			<li id="bbb"><a href="#" >메뉴</a>
			<ul id = "b"class="dropdown-menu">
			<%if(userID == null){ %>
			<li><a href="${pageContext.request.contextPath}/member/loginForm">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/member/joinView">회원가입</a></li>
						<%} %>
					<%if(userID != null){ %>
					<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					<%} %>
					
			</ul>
			</li>
				</ul>
			
				
	<%if(userID != null){ %>
	<ul class="nav navbar-nav navbar-right">
				<li><a href="mypage.member?id=<%=userID%>"><%=userID %> 님 접속중</a></li>
						</ul>
						<%} %>	
						
		</div>
		</nav>
		</div>
		
		
</body>
</html>