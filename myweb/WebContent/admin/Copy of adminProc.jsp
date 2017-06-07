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
		
		//member : 회원테이블을 공동으로 사용해도 되고
		//관리자테이블을 별도 생성해서 사용해도 무방하다
		if(adminid.equals("admin") && adminpw.equals("1234"))
		{
			session.setAttribute("s_adminid", adminid);
			session.setAttribute("s_adminpw", adminpw);
			session.setAttribute("s_adminlevel", "A");  //A등급
			response.sendRedirect("adminStart.jsp");
		}
		else if(adminid.equals("admin2") && adminpw.equals("1234"))
		{
			session.setAttribute("s_adminid", adminid);
			session.setAttribute("s_adminpw", adminpw);
			session.setAttribute("s_adminlevel", "B");  //B등급
			response.sendRedirect("adminStart.jsp");
		}
		else
		{
	%>
		<script type="text/javascript">
			alert("인트라넷 아이디/비번 불일치");
			location="adminLogin.jsp";
		</script>
	<%		
		}
	%>
</body>
</html>