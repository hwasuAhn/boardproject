<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- noticeUpdProc.jsp -->
	<!-- ���� ���� -->
	<%	
		//����ڰ� �Է� ��û�� �� ��������
		int noticeno=Integer.parseInt(request.getParameter("noticeno").trim());
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		
		//dto ��ü�� ���
		dto.setNoticeno(noticeno);
		dto.setSubject(subject);
		dto.setContent(content);
		
		boolean flag=dao.update(dto);
		if(flag)
		{
			//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
	%>
	<script type="text/javascript">
		alert("���� ����");
		location="noticeList.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
		</script>
	<%
		}
		else
		{		
			out.print("���� ����<br/>");
			out.print("<a href='javascript:history.back()'>�ٽýõ�</a>");
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		