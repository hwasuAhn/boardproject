<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./view/color.jspf" %>
<jsp:include page="../bbsMain4.jsp"/>
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>

<form method="post" name="writeform" action="/myweb/mvc2bbs/writePro.do">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="ref" value="${ref}">
<input type="hidden" name="re_step" value="${re_step}">
<input type="hidden" name="re_level" value="${re_level}">
<table width="600" border="1" cellspacing="1" class="table" >
<tr>
    <th bgcolor="#b0e0e6" class="tabletd" height="30">�ۼ���</th>
    <td align="left" class="tabletd"><input type="text" name="writer"></td>  
</tr>
<tr>
    <th bgcolor="#b0e0e6" class="tabletd" height="30">����</th>
    <td align="left" class="tabletd"><input type="text" name="subject" size="68"></td>
</tr>
<tr>
    <th bgcolor="#b0e0e6" class="tabletd" height="30">�̸���</th>
    <td align="left" class="tabletd"><input type="text" name="email" size="30"></td>
</tr>
<tr>
    <th bgcolor="#b0e0e6" class="tabletd">����</th>
    <td align="left" class="tabletd"><textarea name="content" rows="10" cols="70"></textarea></td>
</tr>
<tr>
    <th bgcolor="#b0e0e6" class="tabletd" height="30">��й�ȣ</th>
    <td align="left" class="tabletd"><input type="password" name="passwd"></td>
</tr>
</table>

<table border="0" cellpadding="5" cellspacing="5" width="600">
<tr>
	<td align="left" width="20" >
	<a href="/myweb/mvc2bbs/list.do"><img src='../images/bt_list.gif' border='0'></a>
	</td>
	<td align="center">
	<input type="submit" value="�۾���" class="btn">
	<input type="reset" value="���" class="btn">
	</td>
</tr>
</table>
</form>

<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>