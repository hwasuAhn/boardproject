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
    var f=form;  // 폼태그 추출

    if(f.id.value=="")
    {
        alert("아이디를 입력해주세요");
        f.id.focus();
        return false;  // 처리 종료
    }

    if(f.id.value.length<4) 
    {
        alert("아이디는 4자이상 입력해주세요");
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
	* 아이디 중복 확인 *<br/>
	<form>
	<table border="0">
	<tr>
		<td>
		아이디
		</td>
		<td>
		<input type="text" name="id" size="15" maxlength="12" value="<%=id%>">
		</td>
		<td>
		<input type="submit" class="btn" value="검색" onClick="return check(this.form)">
		</td>
	</tr>
	<tr>
	<td colspan="3" align="center">
	<%
		if(res==1) 
		{
			out.print("사용할수 없는 아이디입니다</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td colspan='3' align='right'>");
		}
		else
		{
			out.print("사용 가능한 아이디입니다</td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td colspan='3' align='right'>");
			out.print("<a href='javascript:use()'>[사용]</a>");
		}
	%>
	<a href='javascript:window.close()'>[닫기]</a></td>
	</tr>
	</table>
	</form>	
	
</body>
</html>