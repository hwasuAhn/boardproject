<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- pdsDelProc.jsp -->
	<!-- ���� ���� -->
	<%
		int pdsno=Integer.parseInt(request.getParameter("pdsno").trim());
		String passwd=request.getParameter("passwd").trim();
		
		dto.setPdsno(pdsno);
		dto.setPasswd(passwd);
	 	 
		int res=mgr.delete(dto);		
		if(res==0)
		{
	%>
	<script type="text/javascript">
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
		history.back();
	</script>
	<%
		}
		else
		{		
			//out.print(upDir+"<br/>");
			//out.print(request.getParameter("filename").trim());
			String filename=request.getParameter("filename").trim();
			UploadManager.deleteFile(upDir, filename);
	%>
	<script type="text/javascript">
		alert("�ش���� �����Ǿ����ϴ�");
		location="pdsList.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("pdsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		