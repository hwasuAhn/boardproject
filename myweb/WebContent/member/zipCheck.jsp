<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ȣ�˻�</title>
<script type="text/javascript">
function ApplyZip(zipcode,address)
{
   //opener ��â�� ���½�Ų ��ü
   //opener.opener
   opener.document.regForm.zipcode.value=zipcode;
   opener.document.regForm.address1.value=address;
   window.close(); //â�ݱ�
}

function check(form) {
	var f=form;
	if(f.dong.value=="")
    {
        alert("��/��/�� �Է����ּ���");
        f.dong.focus(); 
    }
    form.submit;
}  //check() end
</script>

</head>
<body>
<form name="dong" method="post" action="zipCheckProc.jsp">
<TABLE border=0>
<TR>
  <TD colspan=3 width=400 height=50 bgcolor=#330000>
    <FONT SIZE="5" COLOR="#FFFF00" face="����"><B>�����ȣ�˻�</B></FONT>
  </TD>
</TR>
<TR>
  <TD colspan=3 height=40>
    ã�� ��/��/�� �Է��ϼ���.
    <INPUT TYPE="text" NAME="dong" size=15>
    <INPUT TYPE="button" VALUE="�˻�" ONCLICK="check(this.form)">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR>
  <TD width=80 height=25 align=center>�����ȣ</TD>
  <TD width=270 align=center>�ּ�</TD>
  <TD width=50 align=center>����</TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-040</TD>
  <TD>���� �������� ��굿</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="����" ONCLICK="ApplyZip('150-040','���� �������� ��굿')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-041</TD>
  <TD>���� �������� ��굿 1��</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="����" ONCLICK="ApplyZip('150-041','���� �������� ��굿 1��')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-042</TD>
  <TD>���� �������� ��굿 2��</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="����" ONCLICK="ApplyZip('150-042','���� �������� ��굿 2��')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-043</TD>
  <TD>���� �������� ��굿 3��</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="����" ONCLICK="ApplyZip('150-043','���� �������� ��굿 3��')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-044</TD>
  <TD>���� �������� ��굿 4��</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="����" ONCLICK="ApplyZip('150-044','���� �������� ��굿 4��')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-045</TD>
  <TD>���� �������� ��굿 5��</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="����" ONCLICK="ApplyZip('150-045','���� �������� ��굿 5��')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
</TABLE>  
</form>
</body>
</html>