<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../auth.jsp" %>
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
 * ȸ������ *
 <FORM name=myform METHOD=POST>
<INPUT TYPE="button" VALUE="���" ONCLICK="Go_File('member_list.jsp')">	
<INPUT TYPE="button" VALUE="����" ONCLICK="Go_File('member_edit.jsp')">	
<%
//�����ڷα��� ����� ���� A�� ��쿡�� ������ư ���
String level=(String)session.getAttribute("s_adminlevel");
if(level.equals("A"))
{
%>
    <INPUT TYPE="button" VALUE="����" ONCLICK="Go_File('member_del.jsp')">	
<%
}
%>
  </FORM> 
 </BODY>
</HTML>

