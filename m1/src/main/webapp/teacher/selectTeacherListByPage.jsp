<%@page import="vo.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.TeacherDao"%>
<%@ page import="java.util.*"%>
<%
	//클래스의 객체 생성
	TeacherDao dao = new TeacherDao();
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
		System.out.println(currentPage + "<-currentPage");
	int rowPerPage = 5;
	int stratRow = (currentPage - 1) * rowPerPage;

	int totalRow = dao.totalCnt();
	int lastPage = totalRow / rowPerPage;
	if(totalRow % rowPerPage != 0) {
		lastPage = lastPage + 1;
	}
	
	//클래스의 객체 생성
	ArrayList<HashMap<String, Object>> selctList = dao.selectTeacherListByPage(stratRow, rowPerPage);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사리스트</title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<style>
	.page-item .page-link {
	  color: #000; 
	  background-color: #fff;
	  border: 1px solid #ccc; 
	  border-radius: 50%;
	}
	.page-item.active .page-link {
	 z-index: 1;
	 color: #000;
	 background-color: #FAECC5;
	 border-color: #ccc;
	 border-radius: 70%;
	 
	}
	.page-link:focus, .page-item .page-link:hover { 
	  color: #000;
	  background-color: #FFE08C; 
	  border-color: #ccc;
	  border-radius: 50%;
	  
	}
	
</style>
</head>
<body class="container-fluid" style="text-align: center;">
<div>
<br>
<!-- mainmenu -->
	<div>
      <jsp:include page="/mainmenu.jsp"></jsp:include>
	</div>
<h1>강사리스트</h1>
<br>
	<table class="table table-bordered">
		<tr class="table-warning">
			<td style="width: 10%">No.</td>
			<td style="width: 30%">강사아이디</td>
			<td style="width: 30%">강사명</td>
			<td>담당과목</td>
		</tr>
	<%
		for(HashMap<String, Object> map : selctList) {
	%>
		<tr>
			<td><%=map.get("강사번호")%></td>
			<td><%=map.get("강사아이디")%></td>
			<td><%=map.get("이름")%></td>
			<td><%=map.get("과목명")%></td>
		</tr>
	<%
		}
	%>
	</table>
	
<!-- 페이징 -->
	<div>
	<ul class="pagination justify-content-center">
	<%//변수
		int pageParNo = 2;
		int minPageNo = ((currentPage - 1) / pageParNo) * pageParNo + 1; //1~10 / 11 ~ 20
		int maxPageNo = minPageNo + (pageParNo - 1);//10, 20, 30 -- 
		if(maxPageNo > lastPage) {
			maxPageNo = lastPage;
		}
	%>
	<%//이전
		if(minPageNo > 1) {
	%>	
		<li class="page-item">
		<a href="<%=request.getContextPath()%>/teacher/selectTeacherListByPage.jsp?currentPage=<%=minPageNo-pageParNo%>" class="page-link">
		이전</a>
		</li>&nbsp;
	<%
	} else if(minPageNo <= 1) {// 이전 비활성화
	%>
	<li class="page-item disabled"> <a class="page-link">이전</a> </li>&nbsp;
	<%
	}
	%>

	<%//숫자
		for(int i = minPageNo; i<=maxPageNo; i++){
		if(i == currentPage) {
	%>	
		<li class="page-item active">
		<a class="page-link"><%=i%></a>
		</li>&nbsp;
	<%	
		}else{
	%>	
		<li class="page-item">
			<a href="<%=request.getContextPath()%>/teacher/selectTeacherListByPage.jsp?currentPage=<%=i%>" class="page-link">
			<%=i%></a>
		</li>&nbsp;
	<%
			}
		}
	%>
	
	<%//다음
		if(maxPageNo != lastPage) {
	%>	
		<li class="page-item">
		<a href="<%=request.getContextPath()%>/teacher/selectTeacherListByPage.jsp?currentPage=<%=minPageNo + pageParNo%>" class="page-link">
		다음</a>
		</li>
	<%	
		} else if(maxPageNo == lastPage){// 다음 비활성화
			%>
			<li class="page-item disabled"> <a class="page-link">다음</a> </li>
	<%
		}
	%>
	</ul>
	</div>
</div>
</body>
</html>