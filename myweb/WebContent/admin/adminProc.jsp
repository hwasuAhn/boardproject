<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../member/ssi.jsp" %>
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
		dto.setId(adminid);
		dto.setPasswd(adminpw);
		dto=mgr.adminloginproc(dto); 
		if(dto!=null)
		{
			//�α��� ������ ������
			//session �����ð� 10�� ����
			session.setMaxInactiveInterval(600);
			//session���� ����
			session.setAttribute("s_adminid", adminid);  //���̵�
			session.setAttribute("s_adminpd", adminpw);  //���
			session.setAttribute("s_adminlevel", dto.getMlevel());  //ȸ�����
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