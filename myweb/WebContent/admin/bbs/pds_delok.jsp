<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../pds/ssi.jsp" %>
<%
		int pdsno=Integer.parseInt(request.getParameter("pdsno").trim());
		
		dto.setPdsno(pdsno);
	 	 
		int res=mgr.admindelete(dto);	
		if(res==0)
		{
	%>
	<script type="text/javascript">
		alert("삭제 실패");
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
		alert("해당글이 삭제되었습니다");
		location="pds_list.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("pdsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>