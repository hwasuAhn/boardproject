<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우편번호검색</title>
<script type="text/javascript">
function ApplyZip(zipcode,address)
{
   //opener 새창을 오픈시킨 주체
   //opener.opener
   opener.document.regForm.zipcode.value=zipcode;
   opener.document.regForm.address1.value=address;
   window.close(); //창닫기
}

function check(form) {
	var f=form;
	if(f.dong.value=="")
    {
        alert("읍/면/동 입력해주세요");
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
    <FONT SIZE="5" COLOR="#FFFF00" face="굴림"><B>우편번호검색</B></FONT>
  </TD>
</TR>
<TR>
  <TD colspan=3 height=40>
    찾을 읍/면/동 입력하세요.
    <INPUT TYPE="text" NAME="dong" size=15>
    <INPUT TYPE="button" VALUE="검색" ONCLICK="check(this.form)">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR>
  <TD width=80 height=25 align=center>우편번호</TD>
  <TD width=270 align=center>주소</TD>
  <TD width=50 align=center>선택</TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-040</TD>
  <TD>서울 영등포구 당산동</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="선택" ONCLICK="ApplyZip('150-040','서울 영등포구 당산동')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-041</TD>
  <TD>서울 영등포구 당산동 1가</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="선택" ONCLICK="ApplyZip('150-041','서울 영등포구 당산동 1가')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-042</TD>
  <TD>서울 영등포구 당산동 2가</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="선택" ONCLICK="ApplyZip('150-042','서울 영등포구 당산동 2가')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-043</TD>
  <TD>서울 영등포구 당산동 3가</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="선택" ONCLICK="ApplyZip('150-043','서울 영등포구 당산동 3가')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-044</TD>
  <TD>서울 영등포구 당산동 4가</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="선택" ONCLICK="ApplyZip('150-044','서울 영등포구 당산동 4가')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
<TR onMouseOver=this.style.backgroundColor="#C0C0C0" onMouseOut=this.style.backgroundColor=''>
  <TD height=25 align=center>150-045</TD>
  <TD>서울 영등포구 당산동 5가</TD>
  <TD align=center>
  <INPUT TYPE="button" VALUE="선택" ONCLICK="ApplyZip('150-045','서울 영등포구 당산동 5가')">
  </TD>
</TR>
<TR>
  <TD colspan=3 height=1 bgcolor=#808080></TD>
</TR>
</TABLE>  
</form>
</body>
</html>