<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>  
    
<jsp:include page="../bbsMain2.jsp"/>
	
<div id="content" align="center">
	<!-- noticeUpd.jsp -->
	<!-- ���� ���� -->
	<img src="../images/j_board_notice.gif"/><br/><br/>
	* �� ���� *<br/>
	<form name="myform" method="post" action="noticeUpdForm.jsp">
		<input type="hidden" name="noticeno" value="<%=request.getParameter("noticeno")%>"> 
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"> 
		<table border="0" cellpadding="2" cellspacing="2" class="table">
		<tr>
			<th class="tableth" colspan="2">���� �Ͻðڽ��ϱ�?</th>
		</tr>
		<tr>
			<td class="tabletd" colspan="2">
				<input type="button" value="Ȯ��" class="btn"  onclick="blankchk(this.form)">
				<input type="button" value="���" class="btn"  onclick="history.go(-1)">
			</td>
		</tr>
		</table>
	</form>
	
	<script type="text/javascript">
	
		function blankchk(frm) {
			frm.submit();
		}
	</script>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		