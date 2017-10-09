
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/custom.css'/>" >
<link rel="stylesheet" href="<c:url value='/resources/css/*'/>" >
<script src="<c:url value ='/resources/js/bootstrap.js' />" ></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var abc = {
			a : "a1",
			b : "b1",
			c : "c1"
	};
	
	var tt = ["a","b","c"];
	
	$("#testBtn").click(function(e){
		$("#ptext").text(tt[2]);
		$("#testBtn").text("loding...");
		$("div.d1").find("p").css("background-color","red");
		$("#div1").text($("form").serialize());	
		var str = $("form").serialize();
		$("#div3").text(str.split("&"));
		
		var a1 = { one : "100",
				   two : "200"		    
		};
		
		var a2 = { one : "100",
				   two : "300"		    
		};
		$.extend(true,a1,a2);
	$("#div4").append(a1.two);
		
	});
	
	$('#tb1 input[type=button]').click(function(e){
		var id = "#"+e.target.getAttribute('id');
		var id1 = $(id).attr('data-num');
		/* alert(id1);
		$("#div4").append("hi1");
		$("#div3").html("<p>hi2</p>");
		
		var q = $("#tb1").clone();
		q.appendTo("#div4"); */
		
		var asd = "<tr><td><input type=text value=a></td><td><input type=text value=a></td><td><input type=text value=a></td><td><input id=cancel type=button value=취소><input id=save type=button value=저장></td></tr>"; 
		 document.getElementById('q'+id1).innerHTML=asd;
		
	 	/* var gg = $("#tb3").css("display","block");  */
			
	
		 $("#save").click(function(){
			 	alert("save!!");
			 });
		
		 $("#cancel").click(function(){
			 	alert("cancel!!");
			 });
		
	});
	
	
	$("#edit").click(function(){
		
		var tt = $("#edit").attr('data-num');
		alert(tt);
		
		
		
	});
	
	$("#iibtn").click(function(){
		$.ajax({
			type:"GET",
			url: "${pageContext.request.contextPath}/board/jong",
			success: function(data){
				$("#ii").html(data);
			}
			});
	});
	

	
	/* end script */
});
	


</script>
	<title>Home</title>


</head>





<body>
<%@include file="include/menubar.jsp"%>



		
<h1>
 메인 페이지 입니다.
</h1>
<form>
<input type="text" name="a">
<input type="text" name="b">
<input type="text" name="c">
</form>

<div class = "d1" id="div1">
<p>s</p>
</div>

<div class = "d2" id = "div2">
<button id="testBtn">testButton</button>
<p id="ptext"></p>
<a href="${pageContext.request.contextPath}/board/fileForm">파일 첨부 테스트</a>
</div>

<div id="div3"></div>
<div id="div4"></div>


<div>
태그 test 영역 <br>
<c:set value="jcvalue" var="jcset"/>
<c:import url="board/bbsList.jsp"></c:import>
<br>
<c:forEach var="q" begin="1" end="10">
<c:out value="${q}"></c:out>
</c:forEach>
<br>
${(9321/10000)*100 } %
<br>
<fmt:formatNumber value="${(9321/10000)*100 }" pattern="##.###"/>%
<br>
<c:if test="${'jcvalue' eq jcset }">
eq
</c:if>
<c:if test="${'jcvalue' ne jcset  }">
no eq
</c:if>
<c:out value="${jcset}"></c:out>
</div>
<br>

<table id="tb1"border="1">
<tr>
<td>a</td> <td>b</td> <td>c</td> <td>button</td>
</tr>
<tr id="q123">
<td>val.a</td> <td>val.b</td> <td>val.c</td> <td><input type="button" value="수정" id="edit1" name="edit" data-num="123"></td>
</tr>
<tr id="q456">
<td>val.a</td> <td>val.b</td> <td>val.c</td> <td><input type="button" value="수정" id="edit2" name="edit" data-num="456"></td>
</tr>
</table>


<table id="tb3" border="1" style="display: none" >
<tr>
<td><input type="text" value="val.a"></td> <td><input type="text" value="val.b"></td> <td><input type="text" value="val.c"></td> <td><input type="button" value="취소"><input type="button" value="저장"></td>
</tr>
</table>
<button onclick="location.href='${pageContext.request.contextPath}/board/jong'">jong</button>
<button id="iibtn">jong2</button>
<p id="ii"></p>
</body>
</html>
