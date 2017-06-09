<%@page import="my.board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="www.notice.*"%>
<%@ page import="www.utility.*"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="www.pds.PdsDTO"%>
<%@page import="www.bbs.BbsDTO"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="noticeDto" class="www.notice.NoticeDTO" scope="page"/>
<jsp:useBean id="noticeDao" class="www.notice.NoticeDAO" scope="page"/>
<jsp:useBean id="bbsDto" class="www.bbs.BbsDTO" scope="page"/>
<jsp:useBean id="bbsDao" class="www.bbs.BbsDAO" scope="page"/>
<jsp:useBean id="mvcbbsDto" class="my.board.BoardDataBean" scope="page"/>
<jsp:useBean id="phpbbsDto" class="php.board.BoardDataBean" scope="page"/>
<%
//------------------
//����¡ ���� �κ�
//------------------
int nowPage=0;  //���� ������ ��ȣ�� 0����
//���� nowPage(���� ������)�� 0���� ����

if(request.getParameter("nowPage")!=null)
{
	//����ڰ� ��û�� ������ ���� �������� �����Ѵ�
	//request.getParameter()�� �⺻������ ���ڿ��� ó��
	//���� ������ �ʿ��� ���� ������ ��ȯ �ؾ� ��
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
%>
<c:if test="${sessionScope.s_id2 != null }">
	<c:set var="memid" value="${sessionScope.s_id2 }" scope="session"/>
	<c:set var="s_mlevel" value="${sessionScope.s_mlevel }" scope="session"/>
</c:if>
<c:if test="${sessionScope.s_id2 == null }">
	<c:set var="memid" value="guest" scope="session"/>
	<c:set var="s_mlevel" value="guest" scope="session"/>
</c:if>    
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
			<c:if test="${memid == 'guest' || memid == null }">
			<a href="mvc2member/loginForm.do"><img src="images/top_bt_login.gif"/></a>
			<a href="mvc2member/agreement.do"><img src="images/top_bt_join.gif"/></a>
			</c:if>
			<c:if test="${memid != 'guest'}">
			<a href="mvc2member/logout.do"><img src="images/top_bt_logout.gif"/></a>
			<a href="mvc2member/loginForm.do"><img src="images/top_mypage.gif"/></a>
			</c:if>
			
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
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="notice/noticeList.jsp">��������</a></td>
            </tr>
            <tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="./bbs/bbsList.jsp">�͸� �Խ���</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mvc2bbs/list.do">�͸� �Խ���(MVC)</a></td>
            </tr>
            <tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mvc2bbs/phplist.do">PHP ������ �Խ���</a></td>
            </tr>
			</table>
			
			<br/>
			
			<img src="images/member.gif">
			<table border="0" width="100%" bgcolor="#ffffff">
            <tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mvc2member/loginForm.do">ȸ��</a></td>
            </tr>
			<tr>
               <td height="25">&nbsp;<img src="images/arrow.gif"/>&nbsp;&nbsp;<a href="mail/mailForm.jsp">���Ǹ��Ϻ�����</a></td>
            </tr>
			</table>			
			</div>
			
			<div id="content" align="center">
				<!-- ���� -->
				<div style="width:620px; border:0px; " align="center">
				    <div style="width:300px; float:left; margin-right:10px;">
				        <table width="300" border="0" cellpadding="0" cellspacing="0" class="table">
				            <tr>
				                <td height="30"  style="vertical-align:middle;" align="left">
				                   &nbsp; NOTICE <br/> &nbsp; <font style="font-size:12px ">��������</font> 
				                </td>
				                <td align="right" style="font-size:12px; vertical-align:bottom;">
				                   <a href="./notice/noticeList.jsp"> more</a> <img src="images/arrow.gif"/>&nbsp; &nbsp; 
				                </td>
				            </tr>
				        </table>
				    </div>
				    <div style="width:300px; float:left; ">
				        <table width="300" border="0" cellpadding="0" cellspacing="0" class="table">
				                <tr>
				                    <td height="30"  style="vertical-align:middle;" align="left">
				                       &nbsp; �͸� �Խ��� <br/> &nbsp; <font style="font-size:12px ">�ֱ� �ۼ� ��</font> 
				                    </td>
				                    <td align="right" style="font-size:12px; vertical-align:bottom;">
				                       <a href="./bbs/bbsList.jsp"> more</a> <img src="images/arrow.gif"/>&nbsp; &nbsp; 
				                    </td>
				                </tr>
				            </table>
				    </div>
				</div>
				
    			<div style="width:620px; border:0px; " align="center">
    				<div style="width:300px; float:left; margin-right:10px; margin-top:5px; margin-bottom:10px;  ">
    	<%
	       	ArrayList<NoticeDTO> noticeList=noticeDao.listMain();
	    	if(noticeList==null)
			{
				out.print("�Խñ� ����");
			}
			else
			{
		%>			            	
       				<table width="300" border='0'  cellspacing="0">
       				<tr align='center' height="21">      	
             			<th class="tableth" >����</th>        
              			<th class="tableth" >�ۼ���</th>
           			 </tr>      				
    	<%
    		
		    	for(int idx=0; idx<noticeList.size(); idx++)
				{
					noticeDto=noticeList.get(idx);  //ArrayList���� ���� ��������
					out.print("<tr>");
					
					out.print("<td width=250 align=left class='tabletd' height='25'>");
					
					
			 		out.print("<a href='./notice/noticeRead.jsp?nowPage="+nowPage+"&noticeno="+noticeDto.getNoticeno()+"'>"+noticeDto.getSubject()+"</a>");
			 		
			 		//���� �������׿� new�̹��� �߰�
			 		String today=Utility.getDate();  //2013-05-01;
			 		String regdt=noticeDto.getRegdt().substring(0, 10);
			 		if(regdt.equals(today))
			 		{
			 			out.print("<img src='./images/new.gif'>");
			 		}		 				 		
			 		out.print("</td>");		
					out.print(" <td width=100 class='tabletd' height='25'>"+noticeDto.getRegdt().substring(0, 10)+"</td>");
					out.print("</tr>");
				}
			}
	    %>				
	    			</table>
					</div>
				
					<div style="width:300px; float:left; margin-top:5px; margin-bottom:10px; ">
		<%
			ArrayList<BbsDTO> bbsList=bbsDao.listMain();  //�ش��������� ��������
		
			if(bbsList==null)
			{
				out.print("�Խñ� ����");
			}
			else
			{
		%>
       				 <table width="300" border="0" cellspacing="0">
                	<tr align='center' height="21">                    
                    	<th class="tableth">����</th>
                    	<th class="tableth">�ۼ���</th>
                    	<th class="tableth">�ۼ���</th>
                    </tr>
		<%
				for(int idx=0; idx<bbsList.size(); idx++)
				{
					bbsDto=(BbsDTO)bbsList.get(idx);  //ArrayList���� ���� ��������
					out.print("<tr>");
					out.print("<td align='left' class='tabletd'  height='25'>");
					
					//���þ����� ���
					if(bbsDto.getIndent()>0)
					{
						for(int n=1; n<=bbsDto.getIndent(); n++)
						{
							out.print("<img src='./images/icon_reply.gif'/>");
						}
					}
			 		out.print("<a href='./bbs/bbsRead.jsp?nowPage="+nowPage+"&bbsno="+bbsDto.getBbsno()+"'>"+bbsDto.getSubject()+"</a>");
			 		
			 		//���� �Խñۿ� new�̹��� �߰�
			 		String today=Utility.getDate();  //2013-05-01;
			 		String regdt=bbsDto.getRegdt().substring(0, 10);
			 		if(regdt.equals(today))
			 		{
			 			out.print("<img src='./images/new.gif'>");
			 		}
			 		
			 		//��ȸ�� 10�̻� hot�̹��� �߰�
			 		if(bbsDto.getReadcnt()>=10)
			 		{
				 		out.print("<img src='./images/hot.gif'>");
			 		}
			 				 		
			 		out.print("</td>");
					out.print("<td class='tabletd'>"+bbsDto.getWname()+"</td>");		
					out.print("<td class='tabletd'>"+bbsDto.getRegdt().substring(0, 10)+"</td>");
					out.print("</tr>");
				}
			}
		%>			
					</table>
					</div>
				</div>
				<div style="width:620px; border:0px; " align="center">
				    <div style="width:300px; float:left; margin-right:10px;">
				        <table width="300" border="0" cellpadding="0" cellspacing="0" class="table">
				            <tr>
				                <td height="30"  style="vertical-align:middle;" align="left">
				                   &nbsp; JSP ������ �Խ��� <br/> &nbsp; <font style="font-size:12px ">�ֱ� �ۼ� ��</font> 
				                </td>
				                <td align="right" style="font-size:12px; vertical-align:bottom;">
				                   <a href="mvc2bbs/list.do"> more</a> <img src="images/arrow.gif"/>&nbsp; &nbsp; 
				                </td>
				            </tr>
				        </table>
				    </div>
				    <div style="width:300px; float:left; ">
				        <table width="300" border="0" cellpadding="0" cellspacing="0" class="table">
				                <tr>
				                    <td height="30"  style="vertical-align:middle;" align="left">
				                       &nbsp; PHP ������ �Խ��� <br/> &nbsp; <font style="font-size:12px ">�ֱ� �ۼ� ��</font> 
				                    </td>
				                    <td align="right" style="font-size:12px; vertical-align:bottom;">
				                       <a href="mvc2bbs/phplist.do"> more</a> <img src="images/arrow.gif"/>&nbsp; &nbsp; 
				                    </td>
				                </tr>
				            </table>
				    </div>
				</div>
				<div style="width:620px; border:0px; " align="center">
    				<div style="width:300px; float:left; margin-right:10px; margin-top:5px; margin-bottom:10px;  ">
    	<%
	       	ArrayList<BoardDataBean> jspDTO = bbsDao.listMainJsp(); 
	    	if(jspDTO==null)
			{
				out.print("�Խñ� ����");
			}
			else
			{
		%>			            	
       				<table width="300" border='0'  cellspacing="0">
       				<tr align='center' height="21">      	
             			<th class="tableth" >����</th>        
              			<th class="tableth" >�ۼ���</th>
           			 </tr>      				
    	<%
    		
		    	for(int idx=0; idx<jspDTO.size(); idx++)
				{
					mvcbbsDto=jspDTO.get(idx);  //ArrayList���� ���� ��������
					out.print("<tr>");
					
					out.print("<td width=250 align=left class='tabletd' height='25'>");
					
					
			 		out.print("<a href='mvc2bbs/content.do?pageNum="+nowPage+"&num="+mvcbbsDto.getNum()+"'>"+mvcbbsDto.getSubject()+"</a>");
			 		
			 		//���� �Խù��� new�̹��� �߰�
			 		String today=Utility.getDate();  //2013-05-01;
			 		String dt = mvcbbsDto.getReg_date().toString();
			 		String regdt=dt.substring(0, 10);
			 		if(regdt.equals(today))
			 		{
			 			out.print("<img src='./images/new.gif'>");
			 		}		 				 		
			 		out.print("</td>");		
					out.print(" <td width=100 class='tabletd' height='25'>"+regdt+"</td>");
					out.print("</tr>");
				}
			}
	    %>				
	    			</table>
					</div>
				
	
					
		<!-- ���� �� -->
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