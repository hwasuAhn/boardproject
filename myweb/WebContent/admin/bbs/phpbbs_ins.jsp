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
		//����ڰ� �Է� ��û�� �� ��������
		String writer=request.getParameter("writer").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String email=request.getParameter("email").trim();
		
		//�Է� ��û�� �����PC�� IP
		String ip=request.getRemoteHost();
		
		//dto ��ü�� ���
		phpbbsDto.setWriter(writer);
		phpbbsDto.setSubject(subject);
		phpbbsDto.setContent(content);
		phpbbsDto.setEmail(email);
		phpbbsDto.setIp(ip);
		
		int res=dao.phpinsert(phpbbsDto);
		if(res==0)
		{
			out.print("insert ����<br/>");
			out.print("<a href='javascript:history.back()'>�ٽýõ�</a>");
		}
		else
		{
			response.sendRedirect("phpbbs_list.jsp");
		}	
	%>
	</div>
</body>
</html>