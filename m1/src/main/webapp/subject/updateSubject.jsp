<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과목 수정</title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class ="container-fluid">
<br>
<h1>과목리스트</h1>
<hr>
	<table class="table table-bordered">
		<tr>
			<td>No.</td>
			<td><input type="text" name = "subjectNo"readonly="readonly"></td>
		</tr>
		<tr>
			<td>과목명</td>
			<td><input type="text" name ="subjectName"></td>
		</tr>
		<tr>
			<td>시수</td>
			<td><input type="text" name ="subjectTime"></td>
		</tr>
		<tr>
			<td>생성일</td>
			<td><input type="text" name ="createdate" readonly="readonly"></td>
		</tr>
	</table>	

</div>
</body>
</html>