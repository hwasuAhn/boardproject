<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- memberDelProc.jsp -->
	<!-- ���� ���� -->
	<%
		String s_id=request.getParameter("s_id").trim();
		String s_passwd=request.getParameter("s_passwd").trim();
		
		dto.setId(s_id);
		dto.setPasswd(s_passwd);
	 	
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
			Cookie cookie=null;
			cookie=new Cookie("c_id", "");
			response.addCookie(cookie);
			
			session.invalidate();
	%>
	<script type="text/javascript">
		alert("ȸ�� Ż�� �Ͽ����ϴ�");
		location="loginForm.jsp";
	</script>
	<%
		//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		