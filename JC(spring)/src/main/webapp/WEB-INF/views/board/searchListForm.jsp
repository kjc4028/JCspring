<%@page import="spring.jc.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="spring.jc.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function(){
	var word = "";
	$("#srbtn").click(function(){
		word = $("#search").val();
		
		location.href= "${pageContext.request.contextPath}/board/searchBBS?word="+encodeURI(encodeURIComponent(word));
	});
});

</script>
</head>
<body>
<%@include file="../include/menubar.jsp"%>


<div class="container">
		<div class="row">
			<b class="navbar-brand" style="text-align: center;">글 목 록</b>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">

	
				
				<thead>
					<%
          if(userID != null){
         %>
			<tr>
					<td align="right" colspan="7"><a href="${pageContext.request.contextPath}/board/contentWriteView"
						class="btn btn-primary pull-right">글쓰기</a></td>
				</tr>
				<%} %>
			<tr><td align="left" colspan="4"><input type="button" value="전체목록으로 돌아가기" onclick="location.href = '${pageContext.request.contextPath}/board/bbsAllList?page=1&perPageNum=10'" class="btn btn-primary pull right"></td>
			<td align="right" colspan="1" ><input type="text" id = "search"  name ="search"  class="form-control" style="width: 150px;" ></td>
			<td colspan="1" align="left"><input type="button" value="검색" id="srbtn" name="srbtn" 	class="btn btn-primary"></td></tr>
				<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					<th style="background-color: #eeeeee; text-align: center;">조회</th>
					<th style="background-color: #eeeeee; text-align: center;">파일</th>
				
				</tr>
</thead>

<%-- <% List<BoardDto> a = (List<BoardDto>)request.getAttribute("bbsList");  %>
		
		<%for(BoardDto r : a){ %>
				<tr>
					<td><%=r.getNum() %></td>
					<td><%=r.getWriter() %></td>
					<td><%=r.getSubject() %></td>
					<td><%=r.getContent() %></td>
				
					
					
					</tr>
					<%} %> --%>
		
		<c:forEach items="${bbsList}" var="a" begin="0" end="${ bbsList.size()}" step="1">
		<tr>
					<td>${a.num }</td>
					<td align="left"><c:forEach begin="0" end="${a.re_step}">&nbsp;&nbsp;&nbsp;</c:forEach>
					<c:if test="${a.re_step > 0 }"><img src="${pageContext.request.contextPath}/resources/images/re.gif"></c:if>
					<a href="${pageContext.request.contextPath}/board/bbsContent?bbsNum=${a.num }">${a.subject }</a>
					<c:if test="${a.readcount >5 }"><img src="${pageContext.request.contextPath}/resources/images/hot.gif"></c:if>
					</td>
					<td>${a.writer }</td>
					<td>${a.reg_date }</td>
					<td>${a.readcount }</td>
					
					<td>
					<c:if test="${a.filesize > 0 }">
					<img src="${pageContext.request.contextPath}/resources/images/folder.gif">
					</c:if>
					<c:if test="${a.filesize == 0 }">
				<img src="${pageContext.request.contextPath}/resources/images/level.gif">
					</c:if>
						</td>
						
					</tr>
		</c:forEach>
			
		

			</table>
			
		
		</div>
		
	
			<div align="center">
		
		
		<c:if test="${pageMaker.prev }">
		<a href="${pageContext.request.contextPath}/board/bbsAllList?page=${pageMaker.startPage-1 }" class="btn btn-primary">&laquo;</a>
		</c:if>
			
		
		
<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">	
		
								
		<c:if test="${pageMaker.cri.page == idx }" >
		<a href="${pageContext.request.contextPath}/board/bbsAllList?page=${idx }&perPageNum=10" class="btn btn-primary active" >[${idx }]
			</a>
</c:if>
<c:if test="${pageMaker.cri.page != idx }" >
			<a href="${pageContext.request.contextPath}/board/bbsAllList?page=${idx }&perPageNum=10" class="btn btn-primary">${idx }</a>
			</c:if>
			</c:forEach>
		
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			<a href="${pageContext.request.contextPath}/board/bbsAllList?page=${pageMaker.endPage+1 }&perPageNum=10" class="btn btn-primary">&raquo;</a>
	</c:if>
		</div>
		
		</div>



</body>
</html>