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
	1)���� ���� �ð� : <%=session.getMaxInactiveInterval()/60 %>��
	<hr/>
	<%
		//���� ���� �ð� ����(5��)
		session.setMaxInactiveInterval(300);
	%>
	2)���� ���� �ð� ���� : <%=session.getMaxInactiveInterval()/60 %>��
	<hr/>
	<%
		//���Ǻ��� ����
		session.setAttribute("sid", "user");  //("������", "��")
		session.setAttribute("spw", "1234");
	%>
	3)���Ǻ���<br/>
	sid : <%=(String)session.getAttribute("sid") %><br/>
	spw : <%=(String)session.getAttribute("spw") %><br/>
	<hr/>
	4)���� �ӽþ��̵� : <%=session.getId() %>
	<hr/>
</body>
</html>