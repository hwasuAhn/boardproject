<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> My Web </title>
<link rel="stylesheet" type="text/css" href="css/mystyle.css"/>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<!-- �Ӹ��� ���� -->
			<table width="100%" border="0">
			<tr>
				<td><a href="/myweb/index.jsp"><img src="images/home.gif"/></a></td>
				<td>&nbsp;</td>
			</tr>
			<tr bgcolor="#99ccff"><td colspan="2" height="1"></td></tr>
			<tr>
				<td><img src="images/logo.gif"/></td>
				<td><img src="images/visual_img.jpg"/></td>
			</tr>
			<tr bgcolor="#99ccff"><td colspan="2" height="1"></td></tr>
			</table>
		</div>
		
		<div id="container">
			<div id="nav">
				<!-- ���� ī�װ� -->
				<img src="images/board.gif"/>
				<table border="0" width="100%" bgcolor="#ffffff">
				<tr>
					<td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="bbs/bbsList.jsp">�Խ���</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="bbs2/list.do">�Խ���(MVC)</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="notice/notiveList.jsp">��������</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="pds/pdsList.jsp">÷���� �Խ���</a></td>
				</tr>
				</table>
				<br/>				
				<img src="images/member.gif"/>
				<table border="0" width="100%" bgcolor="#ffffff">
				<tr>
					<td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="member/loginForm.jsp">ȸ��</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="member2/login.do">ȸ��(MVC)</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mail/mailForm.jsp">���Ǹ��Ϻ�����</a></td>
				</tr>
				</table>
			</div>
			
			<div id="content" align="center">
				<!-- ���� -->
				<img src="images/uefa.jpg">
			</div>
		</div>
		
		<div id="footer">
			<!-- ������ -->
			<table width="100%" height="30" border="0">
			<tr>
				<td class="footer">My Web 2013 Copyright &copy; Song</td>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>