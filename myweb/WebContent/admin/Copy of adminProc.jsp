<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../member/ssi.jsp" %>
<%@ include file="auth.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> adminProc.jsp </title>
</head>
<body>
	<%
		String adminid=request.getParameter("adminid").trim();
		String adminpw=request.getParameter("adminpw").trim();
		
		//member : ȸ�����̺��� �������� ����ص� �ǰ�
		//���������̺��� ���� �����ؼ� ����ص� �����ϴ�
		if(adminid.equals("admin") && adminpw.equals("1234"))
		{
			session.setAttribute("s_adminid", adminid);
			session.setAttribute("s_adminpw", adminpw);
			session.setAttribute("s_adminlevel", "A");  //A���
			response.sendRedirect("adminStart.jsp");
		}
		else if(adminid.equals("admin2") && adminpw.equals("1234"))
		{
			session.setAttribute("s_adminid", adminid);
			session.setAttribute("s_adminpw", adminpw);
			session.setAttribute("s_adminlevel", "B");  //B���
			response.sendRedirect("adminStart.jsp");
		}
		else
		{
	%>
		<script type="text/javascript">
			alert("��Ʈ��� ���̵�/��� ����ġ");
			location="adminLogin.jsp";
		</script>
	<%		
		}
	%>
</body>
</html>