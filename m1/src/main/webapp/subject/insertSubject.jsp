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
<div class ="container-fluid" style="text-align: center;">
<br>
<!-- mainmenu -->
	<div>
      <jsp:include page="/mainmenu.jsp"></jsp:include>
	</div>
<h1>과목 추가</h1>
<br>
<form action="<%=request.getContextPath()%>/subject/insertSubjectAction.jsp" method="post">
	<table class="table table-bordered">
		<tr>
			<td class="table-warning">과목명</td>
			<td><input type="text" name="subjectName"></td>
		</tr>
		<tr>
			<td class="table-warning">시수</td>
			<td><input type="number" name="subjectTime" min="0"></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-sm btn-outline-dark">추가</button>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()%>/subject/selectSubjectListByPage.jsp" class="btn btn-sm btn-outline-dark">뒤로가기</a>
</form>
</div>
</body>
</html>