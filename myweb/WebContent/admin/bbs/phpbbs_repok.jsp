<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../bbs/ssi.jsp" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> bbs_repok.jsp </title>
</head>
<body>
	<div align="center">
	* �亯���� *<br/>
	<%
		//1)����� �Է� ��û�� ���� ��������
		int num=Integer.parseInt(request.getParameter("num").trim());
		String writer=request.getParameter("writer").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String email=request.getParameter("email").trim();
		String ip=request.getRemoteHost();
		
		//2)dto�� �����ϱ�
		phpbbsDto.setNum(num);
		phpbbsDto.setWriter(writer);
		phpbbsDto.setSubject(subject);
		phpbbsDto.setContent(content);
		phpbbsDto.setEmail(email);
		phpbbsDto.setIp(ip);
		
		int res=dao.phpreply(phpbbsDto);
		if(res==0)
		{
			out.print("�亯���� ����!!<br/>");
			out.print("<a href='javascript:history.back()'>");
		}
		else
		{
			response.sendRedirect("phpbbs_list.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	</div>
</body>
</html>