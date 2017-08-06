<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>


$(document).ready(function(){
	

$("#test").click(function(){
	var name = document.getElementById("name").value;
	var email = document.getElementById("Email").value;
	var id = document.getElementById("id").value;
	
$.getJSON("${pageContext.request.contextPath}/testjc/searchPW/"+name+","+email+","+id,function(data){
		
		var str = "";
		console.log(data.length);
		$(data).each(
				function(){
					str += this.userPW;
				}		
				);
			
				
				$("#ss").text("찾은 비밀번호는 [ " +str+" ]입니다.");
		
	});
	
	
	
	
});
});

</script>
</head>
<body>

<%String contextpath = request.getContextPath(); %>

<form action="">

아이디 : <input type = "text" name = "id" id ="id"><br>
이름:<input type = "text" name = "name" id="name"><br>
이메일:<input type = "text" name = "Email" id="Email"><br>
<input type = "button" value="비밀번호 찾기" id="test">
</form>
<label id ="ss">
</label>


</body>
</html>