<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ������������ �α��� adminLogin.jsp </title>
</head>
<body>
<center>
  <FORM METHOD=POST ACTION="adminProc.jsp">
	<TABLE border=1 cellspacing="0" cellpadding="0">
	<TR>
		<TD colspan=2 align=center>* ������������ �α��� *</TD>
	</TR>
	<TR>
		<TD>���̵�</TD>
		<TD><INPUT TYPE="text" NAME="adminid" size=20></TD>
	</TR>
	<TR>
		<TD>��й�ȣ</TD>
		<TD><INPUT TYPE="password" NAME="adminpw" size=20></TD>
	</TR>
	<TR>
		<TD colspan=2 align=center>
		<INPUT TYPE="submit" value="Ȯ��">
		<INPUT TYPE="reset"    value="���">
		</TD>
	</TR>
	</TABLE>
  </FORM>
  </center>
</body>
</html>