<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>과목 추가</title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div>
	<h1>과목 추가</h1>
<hr>
<form action="<%=request.getContextPath()%>/subject/insertSubjectAction.jsp" method="post">
	<table>
		<tr>
			<td>과목명</td>
			<td><input type="text" name="subjectName"></td>
		</tr>
		<tr>
			<td>시수</td>
			<td><input type="number" name="subjectTime" min="0"></td>
		</tr>
	</table>
	<button type="submit">추가</button>
</form>
</div>
</body>
</html>