<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//adminLogout.jsp
	session.invalidate();  //세션값 모두 삭제
	response.sendRedirect("adminLogin.jsp");
%>