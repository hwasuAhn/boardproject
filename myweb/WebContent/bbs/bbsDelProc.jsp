<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- bbsDelProc.jsp -->
	<!-- 본문 시작 -->
	<%
		int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
		String passwd=request.getParameter("passwd").trim();
		
		dto.setBbsno(bbsno);
		dto.setPasswd(passwd);
	 	
		int res=dao.delete(dto);		
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
	%>
	<script type="text/javascript">
		alert("해당글이 삭제되었습니다");
		location="bbsList.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		