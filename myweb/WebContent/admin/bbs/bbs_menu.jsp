<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <TITLE> member_menu.jsp </TITLE>
  <base target="down">
 </HEAD>
<SCRIPT LANGUAGE="JavaScript">
<!--
function Go_File(filenm)
{
	document.myform.action=filenm;
	document.myform.submit();
}
//-->
</SCRIPT>
 <BODY>
 * 게시판관리 *
 <FORM name=myform METHOD=POST>
<INPUT TYPE="button" VALUE="게시판" ONCLICK="Go_File('bbs_list.jsp')">	
<!--  
<INPUT TYPE="button" VALUE="첨부형 게시판" ONCLICK="Go_File('pds_list.jsp')">	
-->
 </FORM> 
 </BODY>
</HTML>

