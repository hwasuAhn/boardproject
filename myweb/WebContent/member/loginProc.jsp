<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>    

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- loginProc.jsp -->
	<!-- ���� ���� -->
	<%	
		String id=request.getParameter("id").trim();
		String passwd=request.getParameter("passwd").trim();
		dto.setId(id);
		dto.setPasswd(passwd);
		dto=mgr.loginproc(dto);
		if(dto!=null)
		{
			//�α��� ������ ������
			//session �����ð� 10�� ����
			session.setMaxInactiveInterval(600);
			//session���� ����
			session.setAttribute("s_id", id);  //���̵�
			session.setAttribute("s_passwd", passwd);  //���
			session.setAttribute("s_mlevel", dto.getMlevel());  //ȸ�����
			
			//���̵� ��Ű����-----------------------------
			String c_id=request.getParameter("c_id");
			//Checkbox�� üũ�� �ϸ� SAVE, ���ϸ� ��
			if(c_id==null)
			{
				c_id="";
			}
			
			Cookie cookie=null;
			if(c_id.equals("SAVE"))
			{
				//Checkbox�� ������ ��Ű�� ������ ���
				cookie=new Cookie("c_id", id);
				cookie.setMaxAge(60*60*24*31);  //1�޵��� ��Ű����
			}
			else
			{
				//Checkbox�� ���������ʾ� ��Ű�� �������� ���� ���
				cookie=new Cookie("c_id", "");
				cookie.setMaxAge(0);  //0second
			}
			
			response.addCookie(cookie);  //�����PC�� ��Ű�� ����
			//----------------------------------------------		
			response.sendRedirect("../index.jsp");
		}
		else
		{
	%>
	<script type="text/javascript">
		alert("���̵�� ��й�ȣ�� Ȯ�����ּ���");
		location="loginForm.jsp";
	</script>
	<%
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		