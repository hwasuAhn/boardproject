<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//�α��� �������� �Ǵ�
	//���Ǻ����� ��������
	String s_id="", s_passwd="";
	if(session.getAttribute("s_id")!=null)
	{
		s_id=(String)session.getAttribute("s_id");
		s_passwd=(String)session.getAttribute("s_passwd");
	}
	else
	{
		s_id="guest";
		s_passwd="guest";
	}
%>    
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
		border-top:#009999 2px solid;
		border-bottom:#009999 2px solid;
	}
	.tabletd{
		border-bottom:#eaddff 2px solid;
		
	}
	
	.tableth{ color:white; background-color:#597ca4;}
	
	a.submenu:hover{background:#c5c5e6;color:#4855cc; height:25px;}
	a.submenu2:hover{
       background:#FFFF6C;color:#FF9436; 
    }
  
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<!-- �Ӹ��� ���� -->
			<table width="100%" border="0">
			<tr>				
				<td>&nbsp;</td>
				<td align="right">
				<a href="/myweb/index.jsp"><img src="../images/top_bt_home.gif"/></a>
				<%if(s_id.equals("guest") || s_id.equals("")) { %>
				<a href="../member/loginForm.jsp"><img src="../images/top_bt_login.gif"/></a>
				<a href="../member/agreement.jsp"><img src="../images/top_bt_join.gif"/></a>
				<%} else {%>
				<a href="../member/logout.jsp"><img src="../images/top_bt_logout.gif"/></a>
				<a href="../member/loginForm.jsp"><img src="../images/top_mypage.gif"/></a>
				<%} %>
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
				<!-- ���� ī�װ� -->
				<img src="../images/board.gif"/>
				<table border="0" width="100%" bgcolor="#ffffff">
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../bbs/bbsList.jsp">�Խ���</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../mvc2bbs/list.do">�Խ���(MVC)</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../notice/noticeList.jsp">��������</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../pds/pdsList.jsp">÷���� �Խ���</a></td>
				</tr>
				</table>
				<br/>				
				<img src="../images/member.gif"/>
				<table border="0" width="100%" bgcolor="#ffffff">
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../member/loginForm.jsp">ȸ��</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../mvc2member/loginForm.do">ȸ��(MVC)</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../mail/mailForm.jsp">���Ǹ��Ϻ�����</a></td>
				</tr>
				</table>
			</div>
			
			