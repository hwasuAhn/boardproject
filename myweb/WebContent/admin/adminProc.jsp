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
			//로그인 성공을 했으면
			//session 유지시간 10분 설정
			session.setMaxInactiveInterval(600);
			//session변수 선언
			session.setAttribute("s_adminid", adminid);  //아이디
			session.setAttribute("s_adminpd", adminpw);  //비번
			session.setAttribute("s_adminlevel", dto.getMlevel());  //회원등급
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