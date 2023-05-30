<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import="vo.Subject"%>
<%@ page import="dao.SubjectDao"%>
<%
	//인코딩
	request.setCharacterEncoding("utf-8");

	//메시지
	String msg = "";

	//subjectNo 유효성검사
	if(request.getParameter("subjectNo") == null){
		response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp");
		System.out.println("Num 값 필요");
		return;
	}
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	//수정값 유효성검사
	if(request.getParameter("subjectName") == null
		||request.getParameter("subjectName").equals("")) {
		msg = URLEncoder.encode("내용을 모두 입력해주세요.","utf-8");
		response.sendRedirect(request.getContextPath() + "/subject/updateSubject.jsp?subjectNo=" + subjectNo + "&msg=" + msg);
		System.out.println("Name, time 값 필요");
		return;
	}
	
	String subjectName = request.getParameter("subjectName");
		System.out.println(subjectNo + "<--subjectNo");
		System.out.println(subjectName + "<--subjectName");

	SubjectDao dao = new SubjectDao();
	
	Subject subject = new Subject();
	subject.setSubjectNo(subjectNo);
	subject.setSubdjectName(subjectName);
	
	int row = dao.updateSubject(subject);
		System.out.println(row + "<--row");
		
	if(row == 1) {
		System.out.println("수정 성공");
		response.sendRedirect(request.getContextPath() + "/subject/selectSubjectOne.jsp?subjectNo=" + subjectNo);
	} else {
		System.out.println("수정 실패");
		response.sendRedirect(request.getContextPath() + "/subject/updateSubject.jsp?subjectNo=" + subjectNo);
	}
	
%>
