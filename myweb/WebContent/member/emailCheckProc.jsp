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
        alert("�̸����� �Է����ּ���");
        email.focus();
        return false;  // ó�� ����
    }    
    
    if(email.value.length>0)
	{		    	 
		var count1=0; //@�� ����
		var count2=0; //.�� ����
		for(var i=0; i<=email.value.length; i++) {
			if(email.value.substring(i, i+1)=="@")
			{
				count1++;
				if((email.value.substring(i+1, i+2)=="@") || (email.value.substring(i+1, i+2)==".")) { alert("�̸����� �ùٸ��� �Է����ּ���"); email.value.focus(); return false;}
			}
			if(email.value.substring(i, i+1)==".")
			{
				count2++;
				if((email.value.substring(i+1, i+2)=="@") || (email.value.substring(i+1, i+2)==".")) { alert("�̸����� �ùٸ��� �Է����ּ���"); email.value.focus(); return false;}
			}
		}
		if((count1!=1) || (count2<1) || (count2>3)) { alert("�̸����� �ùٸ��� �Է����ּ���"); email.value.focus(); return false;}
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
	* �̸��� �ߺ� Ȯ�� *<br/>
	<%
		String email=request.getParameter("email").trim();
		int res=mgr.duplicatedemail(email);
	%>

	<form action="emailCheckProc.jsp">
	<table border="0">
	<tr>
		<td>
		�̸���
		</td>
		<td>
		<input type="text" name="email" size="25" maxlength="23" value="<%=email%>">
		</td>
		<td>
		<input type="button" class="btn" value="�˻�" onClick="check(this.form)">
		</td>
	</tr>
	<tr>
	<td colspan="3" align="center">
	<%
		if(res==1) 
		{
			out.print("����Ҽ� ���� �̸����Դϴ�</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td colspan='3' align='right'>");
		}
		else
		{
			out.print("��� ������ �̸����Դϴ�</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td colspan='3' align='right'>");
	%>
		<a href="javascript:use('<%=email%>')">[���]</a>
	<%
		}
	%>
	<a href='javascript:window.close()'>[�ݱ�]</a></td>
	</tr>
	</table>
	</form>	
	
</body>
</html>