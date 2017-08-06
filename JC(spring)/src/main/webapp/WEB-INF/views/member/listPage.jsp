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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
	})
	
	function delete2(){
	if(confirm("정말 탈퇴시키시겠습니까?")){
		document.memberFrm.submit();
	}else{
		return false;
	}
}
	
</script>
</head>
<body>
<%@include file="../include/menubar.jsp"%>
<div id="tt" class="category-list">
		<form action="${pageContext.request.contextPath}/member/memberOut" id="memberFrm" name="memberFrm"
		method="post">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" >
				<thead>
				<tr>
					<th id="title" style="background-color: #eeeeee; text-align: center;"><input type="checkbox" id = "allCheck"name="allCheck"></th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">이름</th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">아이디</th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">비밀번호</th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">이메일</th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">성별</th>
					<th id="title" style="background-color: #eeeeee; text-align: center;">주소</th>
				</tr>
</thead>

<% List<MemberDto> a = (List<MemberDto>)request.getAttribute("list");  %>
		
		<%for(MemberDto r : a){ %>
				<tr>
					<td><input type="checkbox" name="rowcheck" id="rowcheck" value="<%=r.getUserID() %>"></td>
					<td><%=r.getUserName() %></td>
					<td><%=r.getUserID() %></td>
					<td><%=r.getUserPW() %></td>
					<td><%=r.getUserEmail() %></td>
					<td><%=r.getUserGender() %></td>
					<td><%=r.getAddr() %></td>
					
					
					</tr>
					<%} %>
		
		
			
		

			</table>
						<input type="button" class="btn btn-primary" value="탈퇴시키기" onclick="delete2()">
		
	</form>
		</div>
		


</body>
</html>