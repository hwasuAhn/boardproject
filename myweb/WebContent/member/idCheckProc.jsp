<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
<%
	String id=request.getParameter("id").trim();
	int res=mgr.duplicatedid(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> idCheckProc.jsp </title>
<link rel="stylesheet" type="text/css" href="../css/mystyle.css"/>
</head>
<script type="text/javascript">
function check(form) {
    var f=form;  // ���±� ����

    if(f.id.value=="")
    {
        alert("���̵� �Է����ּ���");
        f.id.focus();
        return false;  // ó�� ����
    }

    if(f.id.value.length<4) 
    {
        alert("���̵�� 4���̻� �Է����ּ���");
        f.id.focus();
        f.id.value="";
        return false;
    }
    
    return true; 
}  //check() end

function use() {
	//opener.opener
	opener.document.regForm.id.value="<%=id%>";
	window.close();
}  //use() end
</script>
<body>
	* ���̵� �ߺ� Ȯ�� *<br/>
	<form>
	<table border="0">
	<tr>
		<td>
		���̵�
		</td>
		<td>
		<input type="text" name="id" size="15" maxlength="12" value="<%=id%>">
		</td>
		<td>
		<input type="submit" class="btn" value="�˻�" onClick="return check(this.form)">
		</td>
	</tr>
	<tr>
	<td colspan="3" align="center">
	<%
		if(res==1) 
		{
			out.print("����Ҽ� ���� ���̵��Դϴ�</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td colspan='3' align='right'>");
		}
		else
		{
			out.print("��� ������ ���̵��Դϴ�</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td colspan='3' align='right'>");
			out.print("<a href='javascript:use()'>[���]</a>");
		}
	%>
	<a href='javascript:window.close()'>[�ݱ�]</a></td>
	</tr>
	</table>
	</form>	
	
</body>
</html>