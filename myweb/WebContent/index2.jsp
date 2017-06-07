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
<link rel="stylesheet" type="text/css" href="css/mystyle.css"/>
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
 <script type="text/javascript">
 function showtime() {
	 //�޼���â alert();
	 //2013.04.26 (��) PM 2:06:34
	 var today=new Date();
	 var str="";
	 str+=today.getFullYear()+"."; //2013.
	 
	 if(today.getMonth()+1<10)
	 {
		str+="0"; 
	 }
	 str+=(today.getMonth()+1)+".";   //04.
	 
	 if(today.getDate()<10)
	 {
		str+="0";		 
	 }
	 str+=today.getDate();             //29
	
	 //���� 1�� 2ȭ~~~0��
	 switch(today.getDay()) {
	 case 1 : str+=" (��) "; break;
	 case 2 : str+=" (ȭ) "; break;
	 case 3 : str+=" (��) "; break;
	 case 4 : str+=" (��) "; break;
	 case 5 : str+=" (��) "; break;
	 case 6 : str+=" (��) "; break;
	 case 0 : str+=" (��) "; break;
	 }
	 
	 //��
	 if(today.getHours()>=12)
	 {
		str+="PM ";	 
	 }
	 else
	 {
		str+="AM ";	 
	 }
	 
	 if(today.getHours()>12)
	 {
		 str+=today.getHours()-12+":";
	 }
	 else
	 {
		 str+=today.getHours()+":";
	 }

	 //��
	 if(today.getMinutes()<10)
	 {
		str+="0";	 
	 }
	 str+=today.getMinutes()+":";
	 
	 //��
	 if(today.getSeconds()<10)
	 {
		str+="0";	 
	 }
	 str+=today.getSeconds();
	 
	 document.timefrm.clock.value=str; //������ �ð� ���
	 
	 //1���Ŀ� showtime()ȣ��
	 //�����ð��� ������ CPU�� ���� �ڵ�ȣ��
	 //����� �Լ� ȣ��
	 timer=window.setTimeout("showtime()",1000);	 
 }
 
 //�ڹٽ�ũ��Ʈ���� �������� ����
 //���������� �����ϸ� ��� �Լ����� �ش� ���� ������ �� �ִ�
 var timer;
 
 function killtime() {
	 //�ð� ���̱�
	 window.clearTimeout(timer);
 }
 
 //�ڹٽ�ũ��Ʈ������ ������ ����
 //�ڹٽ�ũ��Ʈ������ ������ ������ ����� ����
 //HTML������ ���۵� �� �Բ� ����ȴ�
 
 //�˾�â ����
// window.open("���ϸ�", "â�̸�", "�ɼ�"); 
 
 //���� â �׸� ���Ⱑ üũ�Ǿ� ���� ������
 if(getCookie("popcookie")!="done")
{
	window.open("event.html", "ewin", "width=218, height=375");
}
 
//��Ű�� �ҷ�����
function getCookie(name) { 
	var nameOfCookie = name + "="; 
	var x = 0; 
 	while ( x <= document.cookie.length ) 
	{ 
 		var y = (x+nameOfCookie.length); 
 		if ( document.cookie.substring( x, y ) == nameOfCookie )
 		{ 
 			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
 				endOfCookie = document.cookie.length; 
 			return unescape( document.cookie.substring( y, endOfCookie ) ); 
 		} 
 		x = document.cookie.indexOf( " ", x ) + 1; 
 		if ( x == 0 ) break; 
 	} 
 	return ""; 
 }  //getCookie() end 
</script>
  
</head>

<body onLoad="showtime()" onUnload="killtime()">

<div id="wrap">
	<div id="header">
	    <!-- �Ӹ��� ���� -->
		<table width="100%" border="0">
		<tr>			
			<td colspan="2">
			<table border="0" width="100%" cellpadding="0" cellspacing="0" > 
			<tr>
			<td align="left">
				<!-- ������ �ð� -->
				<form name="timefrm">
					<input type="text" name="clock" size="30" readonly class="time">
				</form>
			</td>
			<td align="right">
			<a href="/myweb/index.jsp"><img src="images/top_bt_home.gif"/></a>
			<%if(s_id.equals("guest") || s_id.equals("")) { %>
			<a href="/myweb/member/loginForm.jsp"><img src="images/top_bt_login.gif"/></a>
			<a href="/myweb/member/agreement.jsp"><img src="images/top_bt_join.gif"/></a>
			<%} else {%>
			<a href="/myweb/member/logout.jsp"><img src="images/top_bt_logout.gif"/></a>
			<a href="/myweb/member/loginForm.jsp"><img src="images/top_mypage.gif"/></a>
			<%} %>
			</td>
			</tr>
			</table>
			</td>
		</tr>
		<tr bgcolor="#99ccff"><td colspan="2" height="1"></td></tr>
		<tr>
			<td><a href="/myweb/index.jsp"><img src="images/logo.gif"/></a></td>
			<td><img src="images/visual_img.jpg"/></td>
		</tr>
		<tr bgcolor="#99ccff"><td colspan="2" height="1"></td></tr>
		</table>
	</div>
	
	<div id="container">
			
			<div id="nav">
			<!-- ���� ī�װ� -->
			<img src="images/board.gif">
			<table border="0" width="100%" bgcolor="#ffffff">
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="bbs/bbsList.jsp">�Խ���</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mvc2bbs/list.do">�Խ���(MVC)</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="notice/noticeList.jsp">��������</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="pds/pdsList.jsp">÷���� �Խ���</a></td>
            </tr>
			</table>
			
			<br/>
			
			<img src="images/member.gif">
			<table border="0" width="100%" bgcolor="#ffffff">
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="member/loginForm.jsp">ȸ��</a></td>
            </tr>
            <tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mvc2member/loginForm.do">ȸ��(MVC)</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mail/mailForm.jsp">���Ǹ��Ϻ�����</a></td>
            </tr>
			</table>			
			</div>
			
			<div id="content" align="center">
				<!-- ���� -->
				<img src="images/main_img.jpg">
			</div>
	</div>
	
	<div id="footer">
		<!-- ������ -->
		<table width="100%"  height="30" border="0">
		<tr>
			<td class="footer">
				Copyright &copy; 2013 by S.H Song
				<br/>
				 All Rights Reserved.   ggaggungss@naver.com
			</td>
		</tr>
		</table>	
	</div>
	
</div>

</body>
</html>