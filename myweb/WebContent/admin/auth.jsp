<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//auth.jsp 관리자 페이지 로그인 상태 확인
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
	
	//로그인 하지 않았다면 로그인 할 수 있는 페이지로 이동 
	if(s_adminid.equals("guest"))
	{
		response.sendRedirect("adminLogin.jsp");
	}
%>