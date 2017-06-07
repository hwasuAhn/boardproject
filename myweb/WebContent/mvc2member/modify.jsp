<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../bbsMain2.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<img src="../images/j_mypage_mvc.gif"/><br/><br/><br/>
	* 회원정보 수정 *<br/>
	<form name="myform" method="post" action="/myweb/mvc2member/modifyForm.do">
		<input type="hidden" name="id" value="${requestScope.id }">
		<table border="0" cellpadding="2" cellspacing="2" class="table">
		<tr>
			<th class="tableth">비밀번호</th>
			<td align="left" class="tabletd"><input type="password" name="passwd" maxlength="12"></td>
		</tr>
		<tr>
			<td colspan="2" class="tabletd">
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
		