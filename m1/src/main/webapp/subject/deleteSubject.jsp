<%@page import="vo.Subject"%>
<%@page import="dao.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(request.getParameter("subjectNo") == null){
		System.out.println("Num값 필요");
		response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp");
		return;
	}

	SubjectDao dao = new SubjectDao();

	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	//subjectNo 값 사용을 위해 subjectNo가 있는 클래스 호출
	Subject s = dao.selectSubjectOne(subjectNo);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과목 삭제</title>
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
<h1>과목 삭제</h1>
<br>
<!-- 메시지 -->
<%
	if(request.getParameter("msg") != null) {
%>
	<div style="font-size: 20px; color: #F15F5F; text-align: center;"><%=request.getParameter("msg")%></div><br>
<%
	}
%>
	<form action="<%=request.getContextPath()%>/subject/deleteSubjectAction.jsp">
	<input type="hidden" name=subjectNo value = <%=s.getSubjectNo()%>>
	<input type="hidden" name=subjectName value = <%=s.getSubdjectName()%>>
		<table class="table table-bordered">
			<tr>
				<td class="table-warning">No.</td>
				<td><%=s.getSubjectNo()%></td>
			</tr>
			<tr>
				<td class="table-warning">과목명</td>
				<td><%=s.getSubdjectName()%></td>
			</tr>
			<tr>
				<td class="table-warning">시수</td>
				<td><%=s.getSubjectTime()%></td>
			</tr>
			<tr>
				<td class="table-warning">생성일</td>
				<td><%=s.getCreatedate()%></td>
			</tr>
			<tr>
				<td class="table-warning">수정일</td>
				<td><%=s.getUpdatedate()%></td>
			</tr>
			<tr>
				<td class="table-warning">과목명 확인</td>
				<td><input type="text" name="subjectNameRE"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-sm btn-outline-dark">삭제</button>&nbsp;&nbsp;
		<a href="<%=request.getContextPath()%>/subject/selectSubjectOne.jsp?subjectNo=<%=subjectNo%>" class="btn btn-sm btn-outline-dark">뒤로가기</a>
	</form>
</div>
</body>
</html>