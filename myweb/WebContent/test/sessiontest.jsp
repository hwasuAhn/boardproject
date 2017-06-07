<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> sessiontest.jsp </title>
</head>
<body>
	* session *<br/>
	1)세션 유지 시간 : <%=session.getMaxInactiveInterval()/60 %>분
	<hr/>
	<%
		//세션 유지 시간 변경(5분)
		session.setMaxInactiveInterval(300);
	%>
	2)세션 유지 시간 변경 : <%=session.getMaxInactiveInterval()/60 %>분
	<hr/>
	<%
		//세션변수 선언
		session.setAttribute("sid", "user");  //("변수명", "값")
		session.setAttribute("spw", "1234");
	%>
	3)세션변수<br/>
	sid : <%=(String)session.getAttribute("sid") %><br/>
	spw : <%=(String)session.getAttribute("spw") %><br/>
	<hr/>
	4)세션 임시아이디 : <%=session.getId() %>
	<hr/>
</body>
</html>