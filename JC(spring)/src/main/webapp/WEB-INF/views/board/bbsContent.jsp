<%@page import="spring.jc.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="spring.jc.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 #modwindow {
width: 300px;
height: 100px;
position: absolute;
top: 50%;
left: 50%;
margin-left: -150%;
margin-top: -50%;
padding: 10px;
z-index: 1000;
}  
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body>

<%@include file="../include/menubar.jsp"%>

<c:set var="cb" value="${bCon}"/>
	<div class="container">
			 <div class="row">
		<b>글내용 보기</b>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">글번호</th>
				<td align="center">${cb.num}</td>
				<th style="background-color: #eeeeee; text-align: center;">조회수</th>
				<td align="center">${cb.readcount}</td>
			</tr>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">작성자</th>
				<td align="center">${cb.writer}</td>
				<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				<td align="center">${cb.reg_date}</td>
			</tr>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">글제목</th>
				<td colspan="3" align="center">${cb.subject}</td>
			</tr>
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">글내용</th>
				<td colspan="3" align="center">${cb.content}</td>
			</tr>
			
			<c:if test="${cb.filesize > 0 }">
			<tr>
				<th style="background-color: #eeeeee; text-align: center;">파일명</th>
				<td colspan="3" align="center">${cd.filename}</td>
			</tr>	
			</c:if>
			
			<tr>
				<td colspan="4" align="right">
						<%BoardDto ii = (BoardDto)request.getAttribute("bCon");
						String writer = ii.getWriter();
          if(userID != null){
        	  if(userID.equals(writer)){
        	  
          
          %>
					<input id="reWrite"type="button" value="답글달기" class="btn btn-primary pull-right">					
					<input id = "updatebtn"type="button" value="글수정" class="btn btn-primary pull-right" >
					<input id="deletebtn" type="button" value="글삭제" class="btn btn-primary pull-right">
					<input type="button" value="글목록" class="btn btn-primary pull-right"onclick="window.location='${pageContext.request.contextPath}/board/bbsAllList?page=1&perPageNum=10'">
				<%}else if(!userID.equals(writer)){
					%>
					<input type="button" value="글목록" class="btn btn-primary pull-right"onclick="window.location='${pageContext.request.contextPath}/board/bbsAllList?page=1&perPageNum=10'">
					<input id="reWrite"type="button" value="답글달기" class="btn btn-primary pull-right">					
				<% }%>
				
			<% }else{%>
				<input type="button" value="글목록" class="btn btn-primary pull-right" onclick="window.location='${pageContext.request.contextPath}/board/bbsAllList?page=1&perPageNum=10'">
			<% }%>
			</td>
			</tr>
		</table>
	</div>
	</div>
	<%if(userID !=null){ %>
	<div align="center">
	<form>
		<div><input type="hidden" name = "replyer" id = "replyer" value="<%=userID %>" ></div>
		<div><span style="background-color: #eeeeee; text-align: center;">댓글 입력</span> <input type="text" name = "replytext" id = "replytext"  style="width: 800px;"><input type="button" name = "rebtn" value="댓글등록" id = "rebtn" class="btn-primary" ></div>
		</form>
	</div>
	<%}else{ %>
	<div align="center">
		<div><span style="background-color: #eeeeee; text-align: center;">댓글을 입력하시려면 로그인 해주시기 바랍니다.</span></div>
		
	</div>
	<%} %>
	<br>
	<div class = "container" >
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	<tr ><td colspan="2">댓글 목록 창</td></tr>
	<tr align="left"><td style="background-color: #eeeeee; text-align: center; width : 300px;">아이디</td><td style="text-align: center;">내용</td></tr>
	</table>
	
	<table class="table table-striped" id = "replies" style="text-align: center; border: 1px solid #dddddd">
	
	</table>
	
	<div id="pagination">

	</div>

	</div>

<c:set var ="ui" value="${userID}" />

<script>

 /* function replyList(){
	$(document).ready(function(){
	var bno = ${cb.num};

	$.getJSON("${pageContext.request.contextPath}/replies/all/"+bno, function(data){
		var str = "";
		$(data).each(
		function(){
			str += "<tr><td style='width : 300px; background-color:  #eeeeee;'>"+this.replyer +"</td><td>"+this.replytext+"</td></tr><br>";
		});
		$("#replies").html(str);
	});
	});
	};  */
	
	var printData =  function(data){
		var str = "";
		var ui = "${ui}";
		
	
		$(data).each(
		function(){
			var wui = this.replyer;
		if(ui==wui){
			str += "<tr><td style='width : 300px; background-color:  #eeeeee;'>"+this.replyer +"</td><td>"+this.replytext+"</td><td><button id='remod' data-rno='"+this.rno+"'>삭제</button></td></tr><br>";

		}else if(ui!=wui){
			str += "<tr><td style='width : 300px; background-color:  #eeeeee;'>"+this.replyer +"</td><td>"+this.replytext+"</td><td></td></tr><br>";

		}
			
		});
		$("#replies").html(str);

	}
	
	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<button><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></button>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<button "+strClass+" ><a href='"+i+"'>" + i + "</a></button>&nbsp;";
		}

		if (pageMaker.next) {
			str += "<button><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></button>";
		}

		target.html(str);
	};
	
	var bno = ${cb.num};
	var replyPage = 1;
	
	function getPage(pageInfo){
		
		$.getJSON(pageInfo,function(data){
		
			printData(data.list);
			printPaging(data.pageMaker, $("#pagination"));
		});
	}
	
	
	
		
	
		
		$(document).ready(function(){
			var bno = ${cb.num};
			var replyPage = 1;
			
			getPage("${pageContext.request.contextPath}/replies/all/"+bno+"/"+replyPage );
			
			
			$("#pagination").on("click", "button a", function(event){
				
				event.preventDefault();
				
				replyPage = $(this).attr("href");
				
				getPage("${pageContext.request.contextPath}/replies/all/"+bno+"/"+replyPage);
				
			});
			
			$("#rebtn").click(function(){
				var bno = ${cb.num};
				var replyer = $("#replyer").val();
				var replytext = $("#replytext").val();
				console.log("등록성공");
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/replies',
					headers:{
						"Content-Type":"application/json",
						"x-HTTP-Method-Override" : "POST"
					},
					dataType:'text',
					data:JSON.stringify({
						bno:bno,
						replyer:replyer,
						replytext:replytext
					}),
					success:function(result){
						if(result == 'SUCCESS'){
							
							alert('등록되었습니다.');
							replyPage = 1;
							getPage("${pageContext.request.contextPath}/replies/all/"+bno+"/"+replyPage );
							
						}
						
					}
					
				});
				
			});
			
		});
	
		$(document).ready(function(){
			var bno = ${cb.num};
			var replyPage = 1;
			
		$("#replies").on("click","#remod",function(){
			var rno = $(this).attr("data-rno");
			console.log("삭제실행"+rno);
			$.ajax({
				type:'delete',
				url:'${pageContext.request.contextPath}/replies/'+rno,
				headers:{
					"Content-Type":"application/json",
					"x-HTTP-Method-Override" : "DELETE"
				},
				dataType:'text',
				success:function(result){
					if(result == 'SUCCESS'){
						
						alert('삭제되었습니다.');
						replyPage = 1;
						getPage("${pageContext.request.contextPath}/replies/all/"+bno+"/"+replyPage );
						
					}
					
				}
				
			});
		});
		});
	
		
		
		
/* $(document).ready(function(){
	replyList();
	$("#rebtn").click(function(){
		var bno = ${cb.num};
		var replyer = $("#replyer").val();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/replies',
			headers:{
				"Content-Type":"application/json",
				"x-HTTP-Method-Override" : "POST"
			},
			dataType:'text',
			data:JSON.stringify({
				bno:bno,
				replyer:replyer,
				replytext:replytext
			}),
			success:function(result){
				if(result == 'SUCCESS'){
					
					alert('등록되었습니다.');
					replyList();
				}
				
			}
			
		});
		
	});

}); */

</script>



<script>
$(document).ready(function(){

	
	$("#deletebtn").click(function(){
		location.href="${pageContext.request.contextPath}/board/deletebbs?num=${cb.num}";
	})
	
	$("#updatebtn").click(function(){
		location.href="${pageContext.request.contextPath}/board/updatebbsView?num=${cb.num}";
	})
	
	$("#reWrite").click(function(){
		location.href="${pageContext.request.contextPath}/board/replybbsView?num=${cb.num}";
	})
	
});
</script>

</body>
</html>