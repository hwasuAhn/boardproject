<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!-- bbsForm.jsp -->
	<!-- ���� ���� -->	
	<!--�Խ��� ����� -->
	<img src="../images/j_board_reply.gif"/><br/><br/>
	<form method="post" action="bbsIns.jsp">
		<table width="600" border="1" cellspacing="1" class="table" >
		<tr>
			<th width="80" height="30" class="tableth">�ۼ���</th>
			<td align="left" class="tabletd"><input type="text" name="wname" value="" size="20" maxlength="20"></td>
		</tr>
		<tr>
			<th height="30" class="tableth">����</th>
			<td align="left" class="tabletd"><input type="text" name="subject" size="50" value=""></td>
		</tr>
		<tr>
			<th class="tableth">����</th>
			<td align="left" class="tabletd"><textarea name="content" rows="10" cols="70"></textarea></td>
		</tr>
		<tr>
			<th height="30" class="tableth">��й�ȣ</th>
			<td align="left" class="tabletd"><input type="password" name="passwd" value="" maxlength="10" size="20"></td>
		</tr>
		</table>
		<br/>
		<table border="0" cellpadding="0" cellspacing="0" style="width:600px; margin-top:10px;">
		<tr>
			<td align="left" width="20" >
        	<a href='bbsList.jsp'><img src='../images/bt_list.gif' border='0'></a>
			</td>
			<td style='text-align:center;'>			
			  <input type="submit" value="�߰�" class="btn">
			  <input type="reset" value="���" class="btn">
			</td>
		</tr>
		</table>	
	</form>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		