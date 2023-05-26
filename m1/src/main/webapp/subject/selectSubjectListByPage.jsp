<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="dao.SubjectDao"%>
<%@page import="vo.*"%>

<% 
	SubjectDao dao = new SubjectDao();
	
	//페이징
	int currentPage = 1; // 1p - 1~10, 2p - 11~20, 3p - 21~30
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
		System.out.println(currentPage + "<-currentPage");
		
	int rowPerPage = 2;
	int startRow = (currentPage - 1) * rowPerPage;
	
	int totalRow = dao.selcetSubjectCnt();
	
	//마지막페이지
	int lastPage = totalRow / rowPerPage;
	if(totalRow % rowPerPage != 0) {
		lastPage = lastPage + 1;
	}
		System.out.println(rowPerPage);

	//ArrayList<Subject>로 반환되는 dao에 있는 selectSubjectListByPage를 가져와서 list에 저장
	ArrayList<Subject> list = dao.selectSubjectListByPage(startRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>selectSubjectListByPage</title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<style>
	.page-link {
	  color: #000; 
	  background-color: #fff;
	  border: 1px solid #ccc; 
	}
	.page-item.active .page-link {
	 z-index: 1;
	 color: #000;
	 background-color: #FAECC5;
	 border-color: #ccc;
	 
	}
	.page-link:focus, .page-link:hover { 
	  color: #000;
	  background-color: #FFE08C; 
	  border-color: #ccc;
	}
	.colorB {
		color: #000;
	}
	
	.colorG {
		color: #747474;
	}
</style>
</head>
<body>
<div class ="container-fluid" style="text-align: center;">
<br>
<h1>과목리스트</h1>
<br>
	<table class="table table-bordered">
		<tr class="table-warning">
			<td style="width: 10%">No.</td>
			<td style="width: 30%">과목명</td>
			<td style="width: 30%">시수</td>
			<td>생성일</td>
		</tr>
		<%
			for(Subject s : list) {
		%>
		<tr>
			<td><%=s.getSubjectNo()%></td>
			<td><a href="<%=request.getContextPath()%>/subject/selectSubjectOne.jsp?subjectNo=<%=s.getSubjectNo()%>"><%=s.getSubdjectName()%></a></td>
			<td><%=s.getSubjectTime()%></td>
			<td><%=s.getCreatedate().substring(0,11)%></td>
		</tr>
		<%
			}
		%>
	</table>
	<div style="text-align: right;"> 
	<a href="<%=request.getContextPath()%>/subject/insertSubject.jsp" class="btn btn-sm btn-outline-dark">추가</a>
	</div>
<!-- 페이징 -->
	<div>
	<ul class="pagination justify-content-center" style="margin:20px 0">
<%
	int pagePerNo = 2;
	int minPageNo = ((currentPage - 1)/pagePerNo) * pagePerNo + 1; // 1~9 / 10 = 0
	int maxPageNo = minPageNo + (pagePerNo - 1);
	if(maxPageNo > lastPage) {
		maxPageNo = lastPage;
	}
%>
<%
	if(minPageNo > 1){
%>
	<li class="page-item">
	<a href="<%=request.getContextPath()%>/subject/selectSubjectListByPage.jsp?currentPage=<%=minPageNo - pagePerNo%>"  class="page-link colorG">
	Previous</a>
	</li>
<%
	}
%>
<%
	for(int i = minPageNo; i<=maxPageNo; i++){
		if(i == currentPage) { // 선택됐을 경우
%>	
			<li class="page-item active">
			<a class="page-link"><%=i%></a>
			</li>
<%
		}
		else { // 선택되지 않았을 경우
%>	
			<li class="page-item">
			<a href="<%=request.getContextPath()%>/subject/selectSubjectListByPage.jsp?currentPage=<%=i%>" class="page-link colorB">
			<%=i%></a>
			</li>
<%
		}
	}
%>	
<%
	if(maxPageNo != lastPage){
%>
	<li class="page-item">
	<a href="<%=request.getContextPath()%>/subject/selectSubjectListByPage.jsp?currentPage=<%=minPageNo + pagePerNo%>" class="page-link colorG">
	Next</a>
	</li>
<%
	}
%>
</ul>
</div>
</div>
</body>
</html>