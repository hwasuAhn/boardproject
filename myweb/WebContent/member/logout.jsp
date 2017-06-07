<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//logout.jsp
	//세션변수 삭제
	session.removeAttribute("s_id");
	session.removeAttribute("s_passwd");
	session.removeAttribute("s_mlevel");
	
	//세션변수 모두 삭제
	//session.invalidate();
	
	response.sendRedirect("loginForm.jsp");
%>