<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> pdsTest.jsp </title>
</head>
<body>
	���� ÷�� �Խ���<br/>	
	<form name="frmData" action="pdsTestProc.jsp" method="post" enctype="multipart/form-data">
		<table border="1">
		<tr>
			<td>����</td>
			<td><input type="text" name="title" size="20"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><textarea name="content" rows="5" cols="32"></textarea></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="etc" size="20"></td>
		</tr>
		<tr>
			<td>����÷��</td>
			<td><input type="file" name="filenm"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="���">
			<input type="reset" value="���">
			</td>
		</tr>
		</table>
	</form>
</body>
</html>