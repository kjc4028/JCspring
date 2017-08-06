<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>J&J shop</title>
</head>

<body>

<%@include file="../include/menubar.jsp"%>


	<div class="contaniner">
		<div class="row">
			<form name="f" method="post" action="${pageContext.request.contextPath}/board/updatebbs">
			
				<table style="width: 600px;" class="table table-striped"
					style="text-align: center; border:1px solid #dddddd "
					align="center">
					<thead>
						<tr>
					
							<th colspan="2"
								style="background-color: #eeeeeee; text-align: center;">게시판글쓰기양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type = "hidden" name ="num" value="${ccc.num}">
							<input type="text" name="writer" class="form-control"
								placeholder="이름" maxlength="5" value="<%=userID%>" readOnly></td>
						</tr>
						<tr>
							<td><input type="text" name="subject" class="form-control"
								placeholder="제목" value="${ccc.subject }"></td>
						</tr>
						<tr>
							<td><input type="text" name="email" class="form-control"
								placeholder="Email" value="${ccc.email }"></td>
						</tr>
						<tr>
							<td><textarea name="content" rows="10" cols="80"
									class="form-control" placeholder="내용" >${ccc.content}</textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="filename" class="form-control"
								placeholder="파일이름"></td>
						</tr>
						<tr>
							<td><input type="password" name="passwd"
								class="form-control" placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="수정" class="btn btn-primary pull-right"> <input
								type="reset" value="다시작성" class="btn btn-primary pull-right">
								<input type="button" value="목록보기"
								class="btn btn-primary pull-right"
								onclick="window.location='${pageContext.request.contextPath}/board/bbsAllList?page=1&perPageNum=10'"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

</body>
</html>