<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//logout.jsp
	//���Ǻ��� ����
	session.removeAttribute("s_id");
	session.removeAttribute("s_passwd");
	session.removeAttribute("s_mlevel");
	
	//���Ǻ��� ��� ����
	//session.invalidate();
	
	response.sendRedirect("loginForm.jsp");
%>