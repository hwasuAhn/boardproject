<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//auth.jsp ������ ������ �α��� ���� Ȯ��
	String s_adminid="";
	String s_adminpw="";
	if(session.getAttribute("s_adminid")!=null)
	{
		s_adminid=(String)session.getAttribute("s_adminid");
		s_adminpw=(String)session.getAttribute("s_adminpw");
	}
	else
	{
		s_adminid="guest";
		s_adminpw="guest";
	}
	
	//�α��� ���� �ʾҴٸ� �α��� �� �� �ִ� �������� �̵� 
	if(s_adminid.equals("guest"))
	{
		response.sendRedirect("adminLogin.jsp");
	}
%>