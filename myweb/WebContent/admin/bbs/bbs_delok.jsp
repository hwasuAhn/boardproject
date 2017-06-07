<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../bbs/ssi.jsp" %>
<%
		int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
		
		
		dto.setBbsno(bbsno);
		
	 	
		int res=dao.admindelete(dto);		 
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
		location="bbs_list.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("bbs_list.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>