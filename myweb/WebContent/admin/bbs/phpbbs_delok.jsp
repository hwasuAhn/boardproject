<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../bbs/ssi.jsp" %>
<%
		int num=Integer.parseInt(request.getParameter("num").trim());
		
		phpbbsDto.setNum(num);
		
		int res=dao.phpadmindelete(phpbbsDto);		 
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
		location="phpbbs_list.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
	</script>
	<%		
		//response.sendRedirect("bbs_list.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>