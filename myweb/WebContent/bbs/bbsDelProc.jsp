<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- bbsDelProc.jsp -->
	<!-- ���� ���� -->
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
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
		history.back();
	</script>
	<%
		}
		else
		{			
	%>
	<script type="text/javascript">
		alert("�ش���� �����Ǿ����ϴ�");
		location="bbsList.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		