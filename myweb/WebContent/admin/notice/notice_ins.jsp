<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../notice/ssi.jsp" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> notice_ins.jsp </title>
</head>
<body>
	<div align="center">
	<%
		//����ڰ� �Է� ��û�� �� ��������
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		
		//dto ��ü�� ���
		dto.setSubject(subject);
		dto.setContent(content);
		
		int res=dao.insert(dto);
		if(res==0)
		{
			out.print("insert ����<br/>");
			out.print("<a href='javascript:history.back()'>�ٽýõ�</a>");
		}
		else
		{
			response.sendRedirect("notice_list.jsp");
		}	
	%>
	</div>
</body>
</html>