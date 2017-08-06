<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

$(document).ready(function(){

	$("#test").click(function(){
	var name = document.getElementById("name").value;
	var emailget = document.getElementById("Email").value+".";
	var email = emailget.replace(/\./gi,"%2E");

		$.getJSON("${pageContext.request.contextPath}/testjc/searchID/"+name+"/"+email,function(data){
		
			var str = "";
			console.log(data.length);
			$(data).each(
				function(){
					str += this.userID;
					});
			
				$("#ss").text("찾은 아이디는 [ " +str+" ]입니다.");
		
		 });
  	});
});
</script>
</head>
<body>

<%String contextpath = request.getContextPath(); %>

<form id = "fm" action="${pageContext.request.contextPath}/member/idRS">

이름:<input type = "text" name = "name" id="name" ><br>
이메일:<input type = "text" name = "Email" id = "Email"><br>

</form>
<input type = "button" value="아이디 찾기" id="test" >
<p id="ss">

</p>



</body>
</html>