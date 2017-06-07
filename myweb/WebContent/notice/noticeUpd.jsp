<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>  
    
<jsp:include page="../bbsMain2.jsp"/>
	
<div id="content" align="center">
	<!-- noticeUpd.jsp -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_notice.gif"/><br/><br/>
	* 글 수정 *<br/>
	<form name="myform" method="post" action="noticeUpdForm.jsp">
		<input type="hidden" name="noticeno" value="<%=request.getParameter("noticeno")%>"> 
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"> 
		<table border="0" cellpadding="2" cellspacing="2" class="table">
		<tr>
			<th class="tableth" colspan="2">수정 하시겠습니까?</th>
		</tr>
		<tr>
			<td class="tabletd" colspan="2">
				<input type="button" value="확인" class="btn"  onclick="blankchk(this.form)">
				<input type="button" value="취소" class="btn"  onclick="history.go(-1)">
			</td>
		</tr>
		</table>
	</form>
	
	<script type="text/javascript">
	
		function blankchk(frm) {
			frm.submit();
		}
	</script>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		