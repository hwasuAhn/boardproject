<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>  
    
<jsp:include page="../bbsMain2.jsp"/>
	
<div id="content" align="center">
	<!-- bbsUpd.jsp -->
	<!-- ���� ���� -->
	<img src="../images/j_board_reply.gif"/><br/><br/>
	* �� ���� *<br/>
	<form name="myform" method="post" action="bbsUpdForm.jsp">
		<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>"> 
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"> 
		<table border="0" cellpadding="2" cellspacing="2" class="table">
		<tr>
			<th class="tableth">��й�ȣ</th>
			<td class="tabletd"><input type="password" name="passwd" maxlength="12"></td>
		</tr>
		<tr>
			<td class="tabletd" colspan="2">
				<input type="button" value="Ȯ��" class="btn" onclick="blankchk(this.form)">
				<input type="button" value="���" class="btn" onclick="history.go(-1)">
			</td>
		</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		//onload=document.myform.passwd.focus();		
	
		function blankchk(frm) {
			var passwd=frm.passwd.value;
			passwd=passwd.replace(/^\s+|\s+$/g,"");  //��������
			
			if(passwd.length==0)
			{
				alert("��й�ȣ�� �Է��ϼ���");			
				frm.passwd.focus();  //��й�ȣ�� Ŀ�� ����
				return;
			}			
			frm.submit();
		}
	</script>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		