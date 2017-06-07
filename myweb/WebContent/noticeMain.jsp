<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> My Web </title>
<link rel="stylesheet" type="text/css" href="../css/mystyle.css"/>
<style type='text/css'>
	<style type='text/css'>
	.table{
		border-collapse:collapse;
		cellpacing:0;
		border-top:#4374D9 2px solid;
		border-bottom:#4374D9 2px solid;
		border-left:1px solid #eaddff;
		border-right: 1px solid #eaddff;
	}
	.tabletd{
		border-top: 1px solid #eaddff;
		border-left:1px solid #eaddff;
		border-right:1px solid #eaddff;
		border-bottom:#eaddff 1px solid;
		
	}
	.tableth{ 
		color:white; 
		background-color:#597ca4;
		border-top: 1px solid #eaddff;
		border-left:1px solid #eaddff;
		border-right:1px solid #eaddff;
		border-bottom:#eaddff 1px solid;
		
	}

	#con{
		border-collapse:collapse;
		cellpacing:0;
		border-top:#4374D9 2px solid;
		border-bottom:#4374D9 2px solid;
		border-left:1px solid #eaddff;
		border-right: 1px solid #eaddff;
		
		scrollbar-face-color: #eeeeee; 
		scrollbar-highlight-color: #eeeeee; /*  �� ��� �κ� ���� */
		scrollbar-3dlight-color: #cccccc;   /* �� ��� �κ� �ٱ��� */ 
		scrollbar-darkshadow-color: #cccccc; /* ����� �κ� �ٱ��� */
		scrollbar-shadow-color: #eeeeee;    /* ����� �κ� ���� */
		scrollbar-track-color: #bbbbff;   
		scrollbar-arrow-color: #acb890;
		
	
	}	
</style>

<script type="text/javascript">
<!--
function shownotice(str, no) {
	var conStr = str;
	
	document.getElementById("con").style.display='block';
	document.getElementById("con").innerHTML= "<br/> "+ conStr;
	document.getElementById("no").value=no;
	document.getElementById("del").style.display='block';
	
}

function gourl(key){
	switch(key){
		case 1 :
			location.href='noticeChkMlevel.jsp?name=noticeForm.jsp';
			break;
		
		case 2 :
			document.noticeDel.action='noticeChkMlevel.jsp?name=noticeUpdate.jsp';
			document.noticeDel.submit();
			break;
		
		case 3 :
			document.noticeDel.action='noticeChkMlevel.jsp?name=noticeDel.jsp';
			document.noticeDel.submit();
			break;
			
	}
}
//-->
</script>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<!-- �Ӹ��� ���� -->
			<table width="100%" border="0">
			<tr>
				<td><a href="/myweb/index.jsp"><img src="../images/home.gif"/></a></td>
				<td>&nbsp;</td>
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
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="bbs2/list.do">�Խ���(MVC)</a></td>
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
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="member2/login.do">ȸ��(MVC)</a></td>
				</tr>
				<tr>
					<td height="25">&nbsp;<img src="../images/arrow.gif"/>&nbsp;&nbsp;<a href="../mail/mailForm.jsp">���Ǹ��Ϻ�����</a></td>
				</tr>
				</table>
			</div>
			
			