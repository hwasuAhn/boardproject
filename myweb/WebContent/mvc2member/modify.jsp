<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../bbsMain2.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
	<img src="../images/j_mypage_mvc.gif"/><br/><br/><br/>
	* ȸ������ ���� *<br/>
	<form name="myform" method="post" action="/myweb/mvc2member/modifyForm.do">
		<input type="hidden" name="id" value="${requestScope.id }">
		<table border="0" cellpadding="2" cellspacing="2" class="table">
		<tr>
			<th class="tableth">��й�ȣ</th>
			<td align="left" class="tabletd"><input type="password" name="passwd" maxlength="12"></td>
		</tr>
		<tr>
			<td colspan="2" class="tabletd">
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
		