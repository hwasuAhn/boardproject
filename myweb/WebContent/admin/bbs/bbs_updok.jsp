<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../bbs/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> bbs_updok.jsp </title>
</head>
<body>
	<div align="center">
	<%	
		//����ڰ� �Է� ��û�� �� ��������
		int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
		String wname=request.getParameter("wname").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String passwd=request.getParameter("passwd").trim();
		String ip=request.getRemoteHost();
		
		//dto ��ü�� ���
		dto.setBbsno(bbsno);
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPasswd(passwd);
		dto.setIp(ip);
		
		boolean flag=dao.update(dto);
		if(flag)
		{
			//response.sendRedirect("bbs_list.jsp?nowPage="+request.getParameter("nowPage"));
	%>
	<script type="text/javascript">
		alert("���� ����");
		location="bbs_list.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
		</script>
	<%
		}
		else
		{		
			out.print("update ����<br/>");
			out.print("<a href='javascript:history.back()'>�ٽýõ�</a>");
		}
	%>
	</div>
</body>
</html>