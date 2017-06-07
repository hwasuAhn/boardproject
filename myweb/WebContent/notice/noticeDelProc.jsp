<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- noticeDelProc.jsp -->
	<!-- 본문 시작 -->
	<%
		int noticeno=Integer.parseInt(request.getParameter("noticeno").trim());
		
		dto.setNoticeno(noticeno);
		
		int res=dao.delete(dto);		
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
	%>
	<script type="text/javascript">
		alert("해당글이 삭제되었습니다");
		location="noticeList.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		