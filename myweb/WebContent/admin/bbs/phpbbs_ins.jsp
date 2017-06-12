<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../bbs/ssi.jsp" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> bbs_ins.jsp </title>
</head>
<body>
	<div align="center">
	<%
		//사용자가 입력 요청한 값 가져오기
		String writer=request.getParameter("writer").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String email=request.getParameter("email").trim();
		
		//입력 요청한 사용자PC의 IP
		String ip=request.getRemoteHost();
		
		//dto 객체에 담기
		phpbbsDto.setWriter(writer);
		phpbbsDto.setSubject(subject);
		phpbbsDto.setContent(content);
		phpbbsDto.setEmail(email);
		phpbbsDto.setIp(ip);
		
		int res=dao.phpinsert(phpbbsDto);
		if(res==0)
		{
			out.print("insert 실패<br/>");
			out.print("<a href='javascript:history.back()'>다시시도</a>");
		}
		else
		{
			response.sendRedirect("phpbbs_list.jsp");
		}	
	%>
	</div>
</body>
</html>