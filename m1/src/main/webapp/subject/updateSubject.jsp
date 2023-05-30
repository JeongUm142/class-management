<%@page import="vo.Subject"%>
<%@page import="dao.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>과목 수정</title>
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
<h1>과목 수정</h1>
<br>
	<!-- 메시지 -->
	<%
		if(request.getParameter("msg") != null) {
	%>
		<div style="font-size: 20px; color: #F15F5F; text-align: center;"><%=request.getParameter("msg")%></div><br>
	<%
		}
	%>
<form action="<%=request.getContextPath()%>/subject/updateSubjectAction.jsp" method="post">
<input type="hidden" name = "subjectNo" value="<%=subject.getSubjectNo()%>">
	<table class="table table-bordered">
		<tr>
			<td class="table-warning">No.</td>
			<td><%=subject.getSubjectNo()%></td>
		</tr>
		<tr>
			<td class="table-warning">과목명</td>
			<td><input type="text" name ="subjectName"></td>
		</tr>
		<tr>
			<td class="table-warning">시수</td>
			<td><input type="text" name ="subjectTime"></td>
		</tr>
		<tr>
			<td class="table-warning">생성일</td>
			<td><%=subject.getCreatedate()%></td>
		</tr>
	</table>	
	<button type="submit" class="btn btn-sm btn-outline-dark">수정</button>&nbsp;&nbsp;
	<a href="<%=request.getContextPath()%>/subject/selectSubjectOne.jsp?subjectNo=<%=subjectNo%>" class="btn btn-sm btn-outline-dark">뒤로가기</a>
</form>
</div>
</body>
</html>