<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../notice/ssi.jsp" %>
<%
		int noticeno=Integer.parseInt(request.getParameter("noticeno").trim());
		
		dto.setNoticeno(noticeno);
		
		int res=dao.delete(dto);		
		if(res==0)
		{
	%>
	<script type="text/javascript">
		alert("���� ����");
		history.back();
	</script>
	<%
		}
		else
		{			
	%>
	<script type="text/javascript">
		alert("�ش���� �����Ǿ����ϴ�");
		location="notice_list.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>