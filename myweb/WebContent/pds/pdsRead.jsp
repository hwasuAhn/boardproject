<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
	<img src="../images/j_board_attach.gif"/><br/><br/>
	<%
		String root=request.getContextPath();  //������Ʈ��(myweb)
		int pdsno=Integer.parseInt(request.getParameter("pdsno").trim());
		
		dto=mgr.read(pdsno); 
		if(dto==null)
		{
			out.print("���� �Խñ� ����");
		}
		else
		{
			//<>&...�� Ư�����ڷ� ��ȯ
			String content=Utility.getConvertChar(dto.getSubject());
			//���͸� <br>�±׷� ��ȯ
			content=Utility.getConvertBR(content);			
	%>
	<table border='1' width='600' cellspacing="0" class="table">
	<tr>
	 	<th class="tableth" height='21' colspan='4'><%=dto.getSubject()%></th>
	</tr>
	<tr>
		<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">�ۼ���</td>
	 	<td class="tabletd" align='left'><%=dto.getWname()%></td>
	 	<td align='left'  height='25' class="tabletd" width="70" bgcolor="#ecedf3">��ȸ��</td>
	 	<td class="tabletd" align='left'><%=dto.getReadcnt()%></td>
	</tr>
	
	<tr>
	 	<td align='left' height='100' colspan='4'  class="tabletd">
	 	 <div style="width:575px; height:240px; overflow:auto; padding:10px; border:0; text-align:left;" id="scrollbar">	 	
	 	<%=content%><br/><br/><br/><br/>
	 	<a href="<%=root %>/storage/<%=dto.getFilename() %>">			
		<img src="<%=root%>/storage/<%=dto.getFilename()%>" >
		<br/><br/>
		</a>
		
	 	</div></td>
	</tr>
	<tr>
		<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">���ϸ�</td>
		<td class="tabletd" align='left'><a href="<%=root %>/storage/<%=dto.getFilename() %>"><%=dto.getFilename() %></a></td>
		<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">����ũ��</td>
		<td class="tabletd" align='left'><%=dto.getFilesize()/1024 %>&nbsp;KByte</td>
	</tr>	
	</table>
	<%
		}
	%>
	<br/>
	<form method="post">
		<input type="image" src="../images/bt_list.gif" onclick="gourl(this.form, 'pdsList.jsp')">  <!-- ��� -->
		<input type="image" src="../images/bt_mod.gif" onclick="gourl(this.form, 'pdsUpd.jsp')"/>  <!-- ���� -->
		<input type="image" src="../images/bt_del.gif" onclick="gourl(this.form, 'pdsDel.jsp')"/>  <!-- ���� -->
		<input type="hidden" name="pdsno" value="<%=dto.getPdsno()%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<input type="hidden" name="filename" value="<%=dto.getFilename() %>">
	</form>
	<script type="text/javascript">
		function gourl(frm, file) {
			frm.action=file;
			frm.submit();
		}
	</script>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		