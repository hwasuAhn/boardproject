<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- noticeIns.jsp -->
	<!-- ���� ���� -->
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
			response.sendRedirect("noticeList.jsp");
		}	
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		