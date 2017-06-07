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

<%
	//저장된 아이디를 쿠키파일에 가져오기
	Cookie[] cookies=request.getCookies();
	String c_id="";  //c_id변수에 쿠키에 저장된 아이디 대입
	
	if(cookies!=null)  //쿠키가 존재한다면
	{
		for(int i=0; i<cookies.length; i++)
		{
			Cookie item=cookies[i];  //쿠키를 하나씩 추출
			if(item.getName().equals("c_id")==true)  //찾으려는 변수가 있는지 검사
			{
				//찾아진 쿠키의 값 추출, 저장된 아이디 가져오기
				c_id=item.getValue();
				
			}
		}
	}
%>
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- loginForm.jsp -->
	<!-- 본문 시작 -->
	<%if(s_id.equals("guest") || s_id.equals(""))
	{	
	%>
	<img src="../images/j_login.gif"><br/><br/><br/>
	<form name="loginfrm"  method="post"  action="loginProc.jsp">    
     <table align="center" border="0" cellspacing="0" cellpadding="0" width="600" height="80">
       <tr> 
         <td align="right" valign="middle" width="190px" height="20">아이디</td>
         <td align="left" valign="middle">
             &nbsp;<input type="text" name="id" value="<%=c_id%>" style="width:160px" tabindex="1"/>
         </td>
         <td rowspan="2" width="230px" align="left">
         	<a href="javascript:loginCheck()" tabindex="3">
         	<img src="../images/bt_login.gif"  /></a>
         </td>
       </tr>
       <tr> 
         <td align="right" valign="middle" height="20">비밀번호</td>
         <td align="left" valign="middle">
         	&nbsp;<input type="password" name="passwd" style="width:160px" tabindex="2"> 
         </td>
       </tr>
       <tr>
          	<td>&nbsp;</td>
          	<td valign="middle" align="left" colspan="2">
          		<input type="checkbox" name="c_id"  value="SAVE" tabindex="4" <%if(c_id!=""){out.print("checked");} %>>ID 저장
          		&nbsp;&nbsp;|&nbsp;&nbsp;
          		<a href="agreement.jsp"><strong>회원가입</strong></a>
          	</td>
       </tr>
       </table>				    
	</form>
	<script type="text/javascript">
	//onload=document.loginfrm.id.focus();
	function loginCheck() {
	    //document-HTML 문서 객체
	    var f=document.loginfrm;
	    var id=f.id.value;
		id=id.replace(/^\s+|\s+$/g,"");
	    var passwd=f.passwd.value;
		passwd=passwd.replace(/^\s+|\s+$/g,"");
	    
	    if(f.id.value=="")
	    {
	        alert("아이디를 입력해주세요");  //경고창 출력
	        f.id.focus();  //커서 지정
	        return;  //처리 종료
	    } 

	    if(f.id.value.length<4) 
	    {
	        alert("아이디는 4자이상 입력해주세요");
	        f.id.focus();               
	        return;                       
	    }

	    if(f.passwd.value=="") 
	    {
	        alert("비밀번호를 입력해주세요");
	        f.passwd.focus();
	        return;
	    }

	    if (f.passwd.value.length<4)
	    {
	        alert("비밀번호는 4자이상 입력해주세요");
	        f.passwd.focus();
	        return;
	    }

	     f.submit(); //JavaScript가 서버로 데이터 전송 
 }
	</script>
	<%
		}  //로그인 하기전
		else
		{
			//로그인 했다면
	%>
		<img src="../images/j_mypage.gif"/><br/><br/><br/>
		<strong><%=s_id %></strong>님 &nbsp;&nbsp;<a href="logout.jsp">[로그아웃]</a><br/><br/>
		<a href="memberUpd.jsp?s_id=<%=s_id%>"><img src="../images/bt_membermod.gif"/></a>
		<a href="memberDel.jsp?s_id=<%=s_id%>"><img src="../images/bt_memberdel.gif"/></a>
	<%		
		}
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		