<%@page import="vo.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.SubjectDao"%>
<%	
	if(request.getParameter("subjectNo") == null){
		System.out.println("Num값 필요");
		response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp");
		return;
	}

	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	SubjectDao dao = new SubjectDao();

	Subject subject = dao.selectSubjectOne(subjectNo);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>과목 상세 정보</title>
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
			<td><%=subject.getSubjectNo()%></td>
		</tr>
		<tr>
			<td>과목명</td>
			<td><%=subject.getSubdjectName()%></td>
		</tr>
		<tr>
			<td>시수</td>
			<td><%=subject.getSubjectTime()%></td>
		</tr>
		<tr>
			<td>생성일</td>
			<td><%=subject.getCreatedate()%></td>
		</tr>
		<tr>
			<td>수정일</td>
			<td><%=subject.getUpdatedate()%></td>
		</tr>
	</table>
	<a href="<%=request.getContextPath()%>/subject/updateSubject.jsp">수정</a>
	<a href="">삭제</a>
</div>
</body>
</html>