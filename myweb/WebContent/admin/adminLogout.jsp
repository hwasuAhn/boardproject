<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//adminLogout.jsp
	session.invalidate();  //���ǰ� ��� ����
	response.sendRedirect("adminLogin.jsp");
%>