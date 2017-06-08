<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">

	<!-- ���� ���� -->
	<script type="text/javascript">
		function memberReg() {
			location.href="agreement.do";
		}
		
		function loginCheck() {
		    //document-HTML ���� ��ü
		    var f=document.login;
		    var id=f.id.value;
			id=id.replace(/^\s+|\s+$/g,"");
		    var passwd=f.passwd.value;
			passwd=passwd.replace(/^\s+|\s+$/g,"");
		    
		    if(f.id.value=="")
		    {
		        alert("���̵� �Է����ּ���");  //���â ���
		        f.id.focus();  //Ŀ�� ����
		        return;  //ó�� ����
		    } 

		    if(f.id.value.length<4) 
		    {
		        alert("���̵�� 4���̻� �Է����ּ���");
		        f.id.focus();               
		        return;                       
		    }

		    if(f.passwd.value=="") 
		    {
		        alert("��й�ȣ�� �Է����ּ���");
		        f.passwd.focus();
		        return;
		    }

		    if (f.passwd.value.length<4)
		    {
		        alert("��й�ȣ�� 4���̻� �Է����ּ���");
		        f.passwd.focus();
		        return;
		    }

		     f.submit(); //JavaScript�� ������ ������ ���� 
		}
	</script>
	<c:if test="${empty sessionScope.s_id2 }">
	<img src="../images/j_login_mvc.gif"><br/><br/><br/>
	<form name="login"  method="post"  action="/myweb/mvc2member/loginPro.do">    
     <table align="center" border="0" cellspacing="0" cellpadding="0" width="600" height="80">
       <tr> 
         <td align="right" valign="middle" width="190px" height="20">���̵�</td>
         <td align="left" valign="middle">
             &nbsp;<input type="text" name="id" value="${c_id }" style="width:160px" tabindex="1"/>
         </td>
         <td rowspan="2" width="230px" align="left">
         	<a href="javascript:loginCheck()" tabindex="3">
         	<img src="../images/bt_login.gif"  /></a>
         </td>
       </tr>
       <tr> 
         <td align="right" valign="middle" height="20">��й�ȣ</td>
         <td align="left" valign="middle">
         	&nbsp;<input type="password" name="passwd" style="width:160px" tabindex="2"> 
         </td>
       </tr>
       <tr>
          	<td>&nbsp;</td>
          	<td valign="middle" align="left" colspan="2">          		
          		<input type="checkbox" name="c_id"  value="SAVE" tabindex="4" <c:if test="${c_id!='' }">checked</c:if>>ID ����
          		&nbsp;&nbsp;|&nbsp;&nbsp;
          		<a href="javascript:memberReg()"><strong>ȸ������</strong></a>
          	</td>
       </tr>
       </table>				    
	</form>
	</c:if>
	
	<c:if test="${memid != 'guest'}">
	<img src="../images/j_mypage_mvc.gif"/><br/><br/><br/>
	<table width="100" cellpadding="0" align="center" border="0">
	<tr>
		<td>
		<strong>${sessionScope.memid }</strong>��
		</td>
	
		<td>
		<form method="post" action="/myweb/mvc2member/logout.do">
			<input type="submit" value="�α׾ƿ�" class="btn">
		</form>
		</td>
	</tr>
	<tr>
		<td height="10" colspan="2"></td>
	</tr>
	<tr>
		<td>
		<form method="post" action="/myweb/mvc2member/modify.do">
			<input type="hidden" name="id" value="${sessionScope.memid }">
			<input type="submit" value="ȸ����������" class="btn">
		</form>
		</td>
		<td>
		<form method="post" action="/myweb/mvc2member/withdrawForm.do">
			<input type="hidden" name="id" value="${sessionScope.memid }">
			<input type="submit" value="ȸ��Ż��" class="btn">
		</form>
		</td>
	</tr>
	</table>
	</c:if>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		