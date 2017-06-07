<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>  
    
<jsp:include page="../bbsMain2.jsp"/>
	
<div id="content" align="center">
	<!-- bbsUpd.jsp -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_reply.gif"/><br/><br/>
	* 글 수정 *<br/>
	<form name="myform" method="post" action="bbsUpdForm.jsp">
		<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>"> 
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"> 
		<table border="0" cellpadding="2" cellspacing="2" class="table">
		<tr>
			<th class="tableth">비밀번호</th>
			<td class="tabletd"><input type="password" name="passwd" maxlength="12"></td>
		</tr>
		<tr>
			<td class="tabletd" colspan="2">
				<input type="button" value="확인" class="btn" onclick="blankchk(this.form)">
				<input type="button" value="취소" class="btn" onclick="history.go(-1)">
			</td>
		</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		//onload=document.myform.passwd.focus();		
	
		function blankchk(frm) {
			var passwd=frm.passwd.value;
			passwd=passwd.replace(/^\s+|\s+$/g,"");  //공백제거
			
			if(passwd.length==0)
			{
				alert("비밀번호를 입력하세요");			
				frm.passwd.focus();  //비밀번호에 커서 생성
				return;
			}			
			frm.submit();
		}
	</script>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		