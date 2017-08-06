<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>아이디 중복 알림 창</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
function re(){
	window.opener.reg_frm.checkuse.value = 'false';
	window.opener.reg_frm.id.value = "";
	window.opener.reg_frm.id.focus();
	window.open('about:blank','_parent').parent.close();
	
}


</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<%@include file="../include/menubar.jsp"%>


<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
			
					<h5 style="text-align: center;">[<%=request.getParameter("id")%>]아이디는 <br>
이미 사용중인 아이디입니다.</h5>
					<br>
					<div class="form-group">
						
				<input type="button" class="btn btn-primary form-control"
						value="다시 입력하기" onclick="re()">
					</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
</body>
</html>