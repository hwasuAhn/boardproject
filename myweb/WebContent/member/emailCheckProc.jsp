<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> emailCheckProc.jsp </title>
<link rel="stylesheet" type="text/css" href="../css/mystyle.css"/>
</head>
<script type="text/javascript">
function check(form) {
    var email=form.email;
    if(email.value=="")
    {
        alert("이메일을 입력해주세요");
        email.focus();
        return false;  // 처리 종료
    }    
    
    if(email.value.length>0)
	{		    	 
		var count1=0; //@의 갯수
		var count2=0; //.의 갯수
		for(var i=0; i<=email.value.length; i++) {
			if(email.value.substring(i, i+1)=="@")
			{
				count1++;
				if((email.value.substring(i+1, i+2)=="@") || (email.value.substring(i+1, i+2)==".")) { alert("이메일을 올바르게 입력해주세요"); email.value.focus(); return false;}
			}
			if(email.value.substring(i, i+1)==".")
			{
				count2++;
				if((email.value.substring(i+1, i+2)=="@") || (email.value.substring(i+1, i+2)==".")) { alert("이메일을 올바르게 입력해주세요"); email.value.focus(); return false;}
			}
		}
		if((count1!=1) || (count2<1) || (count2>3)) { alert("이메일을 올바르게 입력해주세요"); email.value.focus(); return false;}
	}        
       
    form.submit();
}  //check() end

function use(email) {
	//opener.opener
	opener.document.regForm.email.value=email;
	window.close();
}  //use() end
</script>
<body>
	* 이메일 중복 확인 *<br/>
	<%
		String email=request.getParameter("email").trim();
		int res=mgr.duplicatedemail(email);
	%>

	<form action="emailCheckProc.jsp">
	<table border="0">
	<tr>
		<td>
		이메일
		</td>
		<td>
		<input type="text" name="email" size="25" maxlength="23" value="<%=email%>">
		</td>
		<td>
		<input type="button" class="btn" value="검색" onClick="check(this.form)">
		</td>
	</tr>
	<tr>
	<td colspan="3" align="center">
	<%
		if(res==1) 
		{
			out.print("사용할수 없는 이메일입니다</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td colspan='3' align='right'>");
		}
		else
		{
			out.print("사용 가능한 이메일입니다</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td colspan='3' align='right'>");
	%>
		<a href="javascript:use('<%=email%>')">[사용]</a>
	<%
		}
	%>
	<a href='javascript:window.close()'>[닫기]</a></td>
	</tr>
	</table>
	</form>	
	
</body>
</html>