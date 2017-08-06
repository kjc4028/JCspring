<%@page import="spring.jc.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>



<script>

 platAlert =setInterval(function() {
	 overlapCk();
  }, 1000);
 

 
  
  
function overlapCk(){
   if(document.reg_frm.checkuse.value ==  "true"){
      
      $(function(){
         $('.overlapment').text('중복확인 완료');
      })   
   }else if(document.reg_frm.checkuse.value ==  "false"){
      $(function(){
         $('.overlapment').text('중복확인 필요');
      })   
      
   }
   
}

function fn_press_han(obj)
{
    //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}





function on(){

    
    var objEv = event.srcElement;
    var num ="{}[]()<>?_|~`!@#$%^&*-+\"'\\/ ";    //입력을 막을 특수문자 기재.
    event.returnValue = true;
     
    for (var i=0;i<objEv.value.length;i++)
    {
    if(-1 != num.indexOf(objEv.value.charAt(i)))
    event.returnValue = false;
    }
     
    if (!event.returnValue)
    {
     alert("특수문자는 입력하실 수 없습니다.");
     objEv.value="";
    }
    
   
   }





function checkID() {
	overlapCk();
   
   var id = document.reg_frm.id.value;
   
   if(document.reg_frm.id.value.length < 4) {
      alert("아이디는 4글자 이상이어야 합니다.");
      reg_frm.id.focus();
      return;
   }
   
   
   if (id == '') {
      
      alert('아이디를 입력하세요');
      document.reg_frm.checkuse.value = false;
      
      return;
   }else if(id !=''){
   
      
      var url = '${pageContext.request.contextPath}/member/IdOverlapCheck?id=' + id;
       window.open(url, '', 'width=300, height=300, left=0, top=0');
      
         
   }

}





function enableID() {
   document.reg_frm.checker.disabled = false;
}


function disableID() {
   document.reg_frm.checker.disabled = true;
}



function infoConfirm() {
   if(document.reg_frm.id.value.length == 0) {
      alert("아이디는 필수 사항입니다.");
      reg_frm.id.focus();
      return;
   }
   



   if(document.reg_frm.id.value.length < 4) {
      alert("아이디는 4글자 이상이어야 합니다.");
      reg_frm.id.focus();
      return;
   }
   
   
   
   if(document.reg_frm.id.value.length > 20) {
      alert("아이디는 20글자 이하이어야 합니다.");
      reg_frm.id.focus();
      return;
   }
   
   if(document.reg_frm.password.value.length == 0) {
      alert("비밀번호는 필수 사항입니다.");
      reg_frm.password.focus();
      return;
   }
   
   
   
   if(document.reg_frm.name.value.length == 0) {
      alert("이름은 필수 사항입니다.");
      reg_frm.name.focus();
      return;
   }
   
   if(document.reg_frm.id.value.length == 0) {
      alert("아이디는 필수 사항입니다.");
      reg_frm.id.focus();
      return;
   }
   
   if(document.reg_frm.checkuse.value == 'false') {
      alert("아이디를 중복확인 해주세요.");
      return;
   }
   
   document.reg_frm.submit();
}

</script>
</head>
<body>



<%@include file="../include/menubar.jsp"%>

	&nbsp; &nbsp;


	<div class="container">

		<div class="center-block" style="width: 600px; padding: 15px;">
			<div class="jumbotron"
				style="padding-top: 20px; width: 500px; left: auto;">
				<form method="post" action="${pageContext.request.contextPath}/member/join"
					name="reg_frm">
					<h3 style="text-align: center;">회원 가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름 "
							name="name" maxlength="20" style="ime-mode: active;"
							style="width: 100px;">
					</div>

					<div class="form-group">
						<input type="text" class="form-control"
							onkeyup="this.value=this.value.replace(/[^a-z0-9]/g,'')"
							onkeyup="on()" placeholder="아이디 (알파벳 소문자,숫자 조합) " name="id"
							maxlength="20" style="ime-mode: disabled;" style="width: 150px;">
						<input type="button" class="btn btn-primary form-control"
							id="idcheck" value="중복확인" onclick="checkID()"> <label
							class="overlapment"></label><input type="hidden" name="checkuse"
							value="false">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="password" maxlength="20" style="width: 150px;">
					</div>

					<div class="form-group">
						<input type="text" class="form-control"
							onkeyup="this.value=this.value.replace(/[^a-z0-9@.]/g,'')"
							placeholder="이메일" name="Email" maxlength="20"
							style="ime-mode: disabled;" style="width: 200px;">
						<!--크롬에서도 구현하기 위해서 onkeyup 위와 같이 작성 일반 익스플로러에서만 사용할 시에는 onkeyup을 on()로 해주면 된다.  -->
					</div>

					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="gender" autocomplete="off" value="남자" checked>남자
							</label> <label class="btn btn-primary"> <input type="radio"
								name="gender" autocomplete="off" value="여자">여자
							</label>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" placeholder="주소 "
								name="addr" maxlength="40" style="ime-mode: active;"
								style="width: 100px;">
						</div>

					</div>

					<input type="button" class="btn btn-primary form-control"
						value="회원가입" onclick="infoConfirm()">

				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>

	</div>
</body>
</html>