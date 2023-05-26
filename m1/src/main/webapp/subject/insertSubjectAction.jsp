<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.SubjectDao"%>
<%@page import="vo.*"%>
<%
	//유효성검사
	if(request.getParameter("subjectName") == null
		|| request.getParameter("subjectTime") == null
		|| request.getParameter("subjectName").equals(" ")
		|| request.getParameter("subjectTime").equals(" ")) {
		System.out.println("추가 값 확인필요");
		response.sendRedirect(request.getContextPath() + "/subject/insertSubject.jsp");
		return;
	}
	
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
		System.out.println(subjectName + "<-subjectName");
		System.out.println(subjectTime + "<-subjectTime");
		
	//쿼리 받아오기
	SubjectDao dao = new SubjectDao();
	
	Subject subject = new Subject();
	subject.setSubdjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	//row값에 과목추가 
	int row = dao.insertSubject(subject);
	
	if(row==1){//추가성공
		System.out.println("과목추가성공");
		response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp");
	
	} else {
		System.out.println("과목추가실패");
		response.sendRedirect(request.getContextPath() + "/subject/insertSubject.jsp");
	}
	
%>
