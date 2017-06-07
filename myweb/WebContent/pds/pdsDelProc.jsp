<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- pdsDelProc.jsp -->
	<!-- 본문 시작 -->
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
		alert("비밀번호가 일치하지 않습니다");
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
		location="pdsList.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("pdsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		