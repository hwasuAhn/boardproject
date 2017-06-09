<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./view/color.jspf" %>
<jsp:include page="../bbsMain4.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>
<c:if test="${article!=null }">
<center><b>글수정</b></center>
<br/>

<form method="post" name="writeform" action="/myweb/mvc2bbs/updatePro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${article.num}">	
	<table width="600" border="1" cellspacing="1" class="table" >
	<tr>
    	<th bgcolor="#b0e0e6" class="tabletd" height="30">작성자</th>
		<td align="left" class="tabletd"><input type="text" name="writer" value="${article.writer}"></td> 
	</tr>
	<tr>
    	<th bgcolor="#b0e0e6" class="tabletd" height="30">제목</th>
		<td align="left" class="tabletd"><input type="text" name="subject" size="68" value="${article.subject}"></td>
	</tr>
	<tr>
    	<th bgcolor="#b0e0e6" class="tabletd" height="30">이메일</th>
    	<td align="left" class="tabletd"><input type="text" name="email" size="30" value="${article.email}"></td>
	</tr>
	<tr>
    	<th bgcolor="#b0e0e6" class="tabletd">내용</th>
    	<td align="left" class="tabletd"><textarea name="content" rows="10" cols="70">${article.content}</textarea></td>
	</tr>
	<tr>
    	<th bgcolor="#b0e0e6" class="tabletd" height="30">비밀번호</th>
    	<td align="left" class="tabletd"><input type="password" name="passwd" value="${article.passwd }"></td>
	</tr>
	</table>
	<table border="0" cellpadding="5" cellspacing="5" width="600">
	<tr>
		<td align="left" width="20" >
		<a href="/myweb/mvc2bbs/list.do?pageNum=${pageNum}"><img src='../images/bt_list.gif' border='0'></a>
		</td>
		<td align="center">
			<input type="submit" value="글수정" class="btn">
			<input type="reset" value="다시작성" class="btn">
		</td>
	</tr>	
	</table>
</form>
</c:if>
<c:if test="${article==null }">
<center>
	비밀번호가 다릅니다
<br/>
<a href="javascript:history.go(-1)">[글 수정 비번입력으로 돌아가기]</a>
</center>
</c:if>
<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>