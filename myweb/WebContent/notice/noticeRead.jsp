<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
   
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!-- noticeRead.jsp -->
	<!-- ���� ���� -->
	<img src="../images/j_board_notice.gif"/><br/><br/>
	<%
		int noticeno=Integer.parseInt(request.getParameter("noticeno").trim());
		dto=dao.read(noticeno);
		if(dto==null)
		{
			out.print("���� �Խñ� ����");
		}
		else
		{
			//<>&...�� Ư�����ڷ� ��ȯ
			String content=Utility.getConvertChar(dto.getContent());
			//���͸� <br>�±׷� ��ȯ
			content=Utility.getConvertBR(content);			
	%>
	<table border='1' width='600' cellspacing="0" class="table">
	<tr>
		<th class="tableth" height='21' colspan='2'><%=dto.getSubject()%></th>
	</tr>
	<tr>
	 	<td align='left' height='100' colspan='2'  class="tabletd">
	 	 <div style="width:575px; height:240px; overflow:auto; padding:10px; border:0; text-align:left;" id="scrollbar">	 
	 	 <%=content%>
	 	 </div></td>
	</tr>	
	
	
	</table>
	<%
		}
	%>
	<br/>
	<form method="post">
		<input type="image" src="../images/bt_list.gif" onclick="gourl(this.form, 'noticeList.jsp')">  <!-- ��� -->
		<%if(s_mlevel.equals("A")) {%>
		<input type="image" src="../images/bt_mod.gif" onclick="gourl(this.form, 'noticeUpd.jsp')"/>  <!-- ���� -->
		<input type="image" src="../images/bt_del.gif" onclick="gourl(this.form, 'noticeDel.jsp')"/>  <!-- ���� -->
		<%}%>
		<input type="hidden" name="noticeno" value="<%=dto.getNoticeno()%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
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
		