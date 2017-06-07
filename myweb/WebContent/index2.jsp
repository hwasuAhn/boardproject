<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//로그인 성공여부 판단
	//세션변수값 가져오기
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
	 //메세지창 alert();
	 //2013.04.26 (금) PM 2:06:34
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
	
	 //요일 1월 2화~~~0일
	 switch(today.getDay()) {
	 case 1 : str+=" (월) "; break;
	 case 2 : str+=" (화) "; break;
	 case 3 : str+=" (수) "; break;
	 case 4 : str+=" (목) "; break;
	 case 5 : str+=" (금) "; break;
	 case 6 : str+=" (토) "; break;
	 case 0 : str+=" (일) "; break;
	 }
	 
	 //시
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

	 //분
	 if(today.getMinutes()<10)
	 {
		str+="0";	 
	 }
	 str+=today.getMinutes()+":";
	 
	 //초
	 if(today.getSeconds()<10)
	 {
		str+="0";	 
	 }
	 str+=today.getSeconds();
	 
	 document.timefrm.clock.value=str; //본문에 시계 출력
	 
	 //1초후에 showtime()호출
	 //일정시간이 지난후 CPU에 의해 자동호출
	 //재귀적 함수 호출
	 timer=window.setTimeout("showtime()",1000);	 
 }
 
 //자바스크립트에서 전역변수 선언
 //전역변수로 선언하면 모든 함수에서 해당 값을 공유할 수 있다
 var timer;
 
 function killtime() {
	 //시간 죽이기
	 window.clearTimeout(timer);
 }
 
 //자바스크립트에서의 전역적 공간
 //자바스크립트에서의 전역적 공간에 선언된 값은
 //HTML문서가 시작될 때 함께 실행된다
 
 //팝업창 띄우기
// window.open("파일명", "창이름", "옵션"); 
 
 //오늘 창 그만 보기가 체크되어 있지 않으면
 if(getCookie("popcookie")!="done")
{
	window.open("event.html", "ewin", "width=218, height=375");
}
 
//쿠키값 불러오기
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
	    <!-- 머리말 영역 -->
		<table width="100%" border="0">
		<tr>			
			<td colspan="2">
			<table border="0" width="100%" cellpadding="0" cellspacing="0" > 
			<tr>
			<td align="left">
				<!-- 디지털 시계 -->
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
			<!-- 서브 카테고리 -->
			<img src="images/board.gif">
			<table border="0" width="100%" bgcolor="#ffffff">
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="bbs/bbsList.jsp">게시판</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mvc2bbs/list.do">게시판(MVC)</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="notice/noticeList.jsp">공지사항</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="pds/pdsList.jsp">첨부형 게시판</a></td>
            </tr>
			</table>
			
			<br/>
			
			<img src="images/member.gif">
			<table border="0" width="100%" bgcolor="#ffffff">
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="member/loginForm.jsp">회원</a></td>
            </tr>
            <tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mvc2member/loginForm.do">회원(MVC)</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mail/mailForm.jsp">문의메일보내기</a></td>
            </tr>
			</table>			
			</div>
			
			<div id="content" align="center">
				<!-- 본문 -->
				<img src="images/main_img.jpg">
			</div>
	</div>
	
	<div id="footer">
		<!-- 꼬리말 -->
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