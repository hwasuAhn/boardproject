<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %> 
   
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- bbsRepProc.jsp -->
	<!-- ���� ���� -->
	* �亯���� *<br/>
	<%
		//1)����� �Է� ��û�� ���� ��������
		int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
		String wname=request.getParameter("wname").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String passwd=request.getParameter("passwd").trim();
		String ip=request.getRemoteHost();
		
		//2)dto�� �����ϱ�
		dto.setBbsno(bbsno);
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPasswd(passwd);
		dto.setIp(ip);
		
		int res=dao.reply(dto);
		if(res==0)
		{
			out.print("�亯���� ����!!<br/>");
			out.print("<a href='javascript:history.back()'>");
		}
		else
		{
			response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		