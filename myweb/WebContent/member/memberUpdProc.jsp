<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- memberUpdProc.jsp -->
	<!-- ���� ���� -->
	<%	
		//����ڰ� �Է� ��û�� �� ��������		
		//String s_id=request.getParameter("s_id").trim();
		String passwd=request.getParameter("passwd").trim();
		String mname=request.getParameter("mname").trim();
		String tel=request.getParameter("tel").trim();
		String email=request.getParameter("email").trim();
		String zipcode=request.getParameter("zipcode").trim();
		String address1=request.getParameter("address1").trim();
		String address2=request.getParameter("address2").trim();
		String job=request.getParameter("job").trim();
		
		dto.setId((String)session.getAttribute("s_id"));
		dto.setPasswd(passwd);
		dto.setMname(mname);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setZipcode(zipcode);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setJob(job);
		
		int res=mgr.updateproc(dto); 
		if(res==1)
		{
			//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
	%>
	<script type="text/javascript">
		alert("���� ����");
		location="loginForm.jsp";
		</script>
	<%
		}
		else
		{		
			out.print("update ����<br/>");
			out.print("<a href='javascript:history.back()'>�ٽýõ�</a>");
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		