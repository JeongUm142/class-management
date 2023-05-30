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
<div class ="container-fluid" style="text-align: center;">
<br>
<!-- mainmenu -->
	<div>
      <jsp:include page="/mainmenu.jsp"></jsp:include>
	</div>
<h1>과목 정보</h1>
<br>
	<table class="table table-bordered">
		<tr>
			<td class="table-warning">No.</td>
			<td><%=subject.getSubjectNo()%></td>
		</tr>
		<tr>
			<td class="table-warning">과목명</td>
			<td><%=subject.getSubdjectName()%></td>
		</tr>
		<tr>
			<td class="table-warning">시수</td>
			<td><%=subject.getSubjectTime()%></td>
		</tr>
		<tr>
			<td class="table-warning">생성일</td>
			<td><%=subject.getCreatedate()%></td>
		</tr>
		<tr>
			<td class="table-warning">수정일</td>
			<td><%=subject.getUpdatedate()%></td>
		</tr>
	</table>
	<a href="<%=request.getContextPath()%>/subject/updateSubject.jsp?subjectNo=<%=subjectNo%>" class="btn btn-sm btn-outline-dark">수정</a>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()%>/subject/deleteSubject.jsp?subjectNo=<%=subjectNo%>" class="btn btn-sm btn-outline-dark">삭제</a>
</div>
</body>
</html>