<%@page import="dao.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	//인코딩
	request.setCharacterEncoding("utf-8");

	//메시지
	String msg = "";
	
	//유효성검사
	if(request.getParameter("subjectNo") == null){
		System.out.println("Num값 필요");
		response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp");
		return;
	}
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
		System.out.println(subjectNo+"<--subjectNo");

	if(request.getParameter("subjectNameRE") == null
		||request.getParameter("subjectNameRE").equals("")){
		System.out.println("확인값 필요");
		msg = URLEncoder.encode("과정명을 다시 입력해주세요.","utf-8");
		response.sendRedirect(request.getContextPath() + "/subject/deleteSubject.jsp?subjectNo=" + subjectNo + "&msg=" + msg);
		return;
	}
	
	String subjectName = request.getParameter("subjectName");
	String subjectNameRE = request.getParameter("subjectNameRE");
		System.out.println(subjectName + "<--subjectName");
		System.out.println(subjectNameRE + "<--subjectNameRE");
	
		
	if(!subjectName.equals(subjectNameRE)){
		msg = URLEncoder.encode("과목명을 확인해주세요.","utf-8");
		response.sendRedirect(request.getContextPath() + "/subject/deleteSubject.jsp?subjectNo=" + subjectNo + "&msg=" + msg);
		return;
	}
	
	SubjectDao dao = new SubjectDao();
	
	int row = dao.deleteSubejct(subjectNo);
	
	if(row == 1) {
		System.out.println("수정 성공");
		response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp?subjectNo=" + subjectNo);
	} else {
		System.out.println("수정 실패");
		response.sendRedirect(request.getContextPath() + "/subject/deleteSubject.jsp?subjectNo=" + subjectNo);
	}
%>