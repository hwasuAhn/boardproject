<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- bbsIns.jsp -->
	<!-- ���� ���� -->
	<%
		//����ڰ� �Է� ��û�� �� ��������
		String wname=request.getParameter("wname").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String passwd=request.getParameter("passwd").trim();
		
		//�Է� ��û�� �����PC�� IP
		String ip=request.getRemoteHost();
		
		//dto ��ü�� ���
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPasswd(passwd);
		dto.setIp(ip);
		
		int res=dao.insert(dto);
		if(res==0)
		{
			out.print("insert ����<br/>");
			out.print("<a href='javascript:history.back()'>�ٽýõ�</a>");
		}
		else
		{
			response.sendRedirect("bbsList.jsp");
		}	
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		