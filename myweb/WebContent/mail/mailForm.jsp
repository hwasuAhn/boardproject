<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:include page="../bbsMain3.jsp"/>
	
<div id="content" align="center">
	<!-- mailForm.jsp -->
	<!-- ���� ���� -->
	<img src="../images/j_send_mail.gif"/><br/><br/>
	<form name='mailForm' method='post' action="mailProc.jsp">
	<table border="0" cellpadding="2" cellspacing="2" class="table" align="center">
	<tr>
	  <th class="tableth">�޴� ���</th>
	  <td class="tabletd"><input type="text" name="to" size="61" value='webmaster@rogbatoni.cafe24.com'></td>
	</tr><tr>
	  <th class="tableth">������ ���</th>
	  <td class="tabletd"><input type="text" name="from" size="61" value=''></td>
	</tr><tr>
	  <th class="tableth">�� ��</th>
	  <td class="tabletd"><input type="text" name="subject" size="61" value=""></td>
	</tr>
	<tr>
	  <th class="tableth">���� ����</th>
	  <td class="tabletd"><textarea name="msgText" rows="15" cols="60"></textarea></td>
	</tr>
	</table>
	<br/>
	<div  align="center">
	    <input type="submit" value="������" class="btn">
	    <input type="button" value="���" class="btn" onclick="javascript:history.back()">
	</div>
	</form>	
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		