<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!-- bbsUpdForm.jsp -->
	<!-- ���� ���� -->	
	<img src="../images/j_board_reply.gif"/><br/><br/>
	<%
		int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
		String passwd=request.getParameter("passwd").trim();
		dto.setBbsno(bbsno);
		dto.setPasswd(passwd);
		
		dto=dao.updateform(dto);
		if(dto==null)
		{
	%>
	<script type="text/javascript">
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�")
		history.back();
	</script>
    <%
    	}
		else
		{
	%>
	<form method="post" action="bbsUpdProc.jsp">
	<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<table width="600" border="1" cellspacing="1" class="table" >
		<tr>
			<th width="80" height="30" class="tableth">�ۼ���</th>
			<td align="left" class="tabletd"><input type="text" name="wname" value="<%=dto.getWname()%>" size="20" maxlength="20"></td>
		</tr>
		<tr>
			<th height="30" class="tableth">����</th>
			<td align="left" class="tabletd"><input type="text" name="subject" size="50" value="<%=dto.getSubject()%>"></td>
		</tr>
		<tr>
			<th class="tableth">����</th>
			<td align="left" class="tabletd"><textarea name="content" rows="10" cols="70"><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
			<th height="30" class="tableth">��й�ȣ</th>
			<td align="left" class="tabletd"><input type="password" name="passwd" value="<%=dto.getPasswd()%>"  maxlength="10" size="20"></td>
		</tr>
		</table>
		<br/>
		<table border="0" cellpadding="0" cellspacing="0" style="width:600px; margin-top:10px;">
		<tr>
			<td align="left" width="20" >
			<a href="bbsList.jsp?nowPage=<%=request.getParameter("nowPage")%>"><img src="../images/bt_list.gif"/></a>
			</td>
			<td style='text-align:center;'>	
			  <input type="submit" value="����" class="btn">
			  <input type="reset" value="���" class="btn">
			</td>
		</tr>
		</table>			
	</form>
	<%		 
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		