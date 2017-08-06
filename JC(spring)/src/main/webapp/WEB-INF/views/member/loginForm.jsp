<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">

function loginConfirm() {
   if(document.lg_frm.id.value.length == 0) {
      alert("아이디는 필수 사항입니다.");
      lg_frm.id.focus();
      return;
   }
   
   if(document.lg_frm.password.value.length == 0) {
      alert("비밀번호는 필수 사항입니다.");
      lg_frm.password.focus();
      return;
   }

   document.lg_frm.submit();

}

function searchID(){
   var url = '${pageContext.request.contextPath}/member/searchID';
    window.open(url, '', 'width=300, height=150, left=0, top=0');
}

function searchPW(){
   var url = '${pageContext.request.contextPath}/member/searchPW';
    window.open(url, '', 'width=300, height=150, left=0, top=0');
}

</script>
<style>
table {
	
	text-align: center;
	position: relative;
	left: 100px;
	top: 100px;
}



#title {
	text-align: center;
	background-color: orange;
}
</style>

</head>
<body>


	<%@include file="../include/menubar.jsp"%>




	&nbsp;
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="${pageContext.request.contextPath}/member/login"
					name="lg_frm">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id" maxlength="20">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="password" maxlength="20">
					</div>

					<div>
						<input type="button" class="btn btn-primary form-control"
							value="로그인" onclick="loginConfirm()">
					</div>
					<br>

					<div>
						<input type="button" class="btn btn-primary form-control"
							value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/joinView';">
					</div>
					<br>

					<div class="col-sm-6">
						<input type="button" class="btn btn-primary form-control"
							value="ID찾기" onclick="searchID()">
					</div>

					<div class="col-sm-6 ">
						<input type="button" class="btn btn-primary form-control"
							value="PW찾기" onclick="searchPW()">
					</div>
					<br>
					<br>
					<br>

				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
		</div>


	

</body>
</html>