<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<div style="text-align: center; line-height:50%">
	<a href="<%=request.getContextPath()%>/subject/selectSubjectListByPage.jsp" class="btn btn-warning">과목리스트</a>
	&nbsp;	&nbsp;	&nbsp;
	<a href="<%=request.getContextPath()%>/teacher/selectTeacherListByPage.jsp" class="btn btn-warning">강사리스트</a>

</div>
	<br>
