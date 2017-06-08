<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${sessionScope.s_id2 != null }">
	<c:set var="memid" value="${sessionScope.s_id2 }" scope="session"/>
	<c:set var="s_mlevel" value="${sessionScope.s_mlevel }" scope="session"/>
</c:if>
<c:if test="${sessionScope.s_id2 == null}">
	<c:set var="memid" value="guest" scope="session"/>
	<c:set var="s_mlevel" value="guest" scope="session"/>
</c:if>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> My Web </title>
<link rel="stylesheet" type="text/css" href="../css/mystyle.css"/>
<style type='text/css'>
	.table{
		border-collapse:collapse;
		cellpacing:0;
		border-top:1px solid #eaddff;
		border-bottom:1px solid #eaddff;
		border-left:1px solid #eaddff;
		border-right:1px solid #eaddff;
		
	}
	.tabletd{
		border-top:#eaddff 1px solid;
		border-bottom:#eaddff 1px solid;
		border-left:#eaddff 1px solid;
		border-right: #eaddff 1px solid;
		text-align:left;
		
	}
	.tableth{ 
		background-color:#EADDFF; 
		border-top:#D1B2FF 1px solid;
		border-bottom:#D1B2FF 1px solid;
		border-left:#D1B2FF 1px solid;
		border-right: #D1B2FF 1px solid;  
		text-align:center;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<!-- 머리말 영역 -->
			<table width="100%" border="0">
			<tr>
				<td>&nbsp;</td>
				<td align="right">
				<a href="/myweb/index.jsp"><img src="../images/top_bt_home.gif"/></a>
				<c:if test="${memid == 'guest' || memid == null }">
				<a href="../mvc2member/loginForm.do"><img src="../images/top_bt_login.gif"/></a>
				<a href="../mvc2member/agreement.do"><img src="../images/top_bt_join.gif"/></a>
				</c:if>
				<c:if test="${memid != 'guest' }">
				<a href="../mvc2member/logout.do"><img src="../images/top_bt_logout.gif"/></a>
				<a href="../mvc2member/loginForm.do"><img src="../images/top_mypage.gif"/></a>
				</c:if>
				</td>
			</tr>
			<tr bgcolor="#99ccff"><td colspan="2" height="1"></td></tr>
			<tr>
				<td><a href="/myweb/index.jsp"><img src="../images/logo.gif"/></a></td>
				<td><img src="../images/visual_img.jpg"/></td>
			</tr>
			<tr bgcolor="#99ccff"><td colspan="2" height="1"></td></tr>
			</table>
		</div>
		
		<div id="container">
			<div id="nav">
				<!-- 서브 카테고리 -->
				<img src="../images/board.gif"/>
				<table border="0" width="100%" bgcolor="#ffffff">
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../notice/noticeList.jsp">공지사항</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../bbs/bbsList.jsp">익명 게시판</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../mvc2bbs/list.do">익명 게시판(MVC)</a></td>
				</tr>
				</table>
				<br/>				
				<img src="../images/member.gif"/>
				<table border="0" width="100%" bgcolor="#ffffff">
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../mvc2member/loginForm.do">회원</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../mail/mailForm.jsp">문의메일보내기</a></td>
				</tr>
				</table>
			</div>
			
			