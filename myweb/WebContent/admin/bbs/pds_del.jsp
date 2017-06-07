<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../pds/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> pds_del.jsp </title>
<link rel="stylesheet" type="text/css" href="../../css/mystyle.css"/>
<style type='text/css'>
	.table{
		border-collapse:collapse;
		cellpacing:0;
		border-top:#9999cc 2px solid;
		border-bottom:#9999cc 2px solid;
		border-left:#9999cc 2px solid;
		border-right:#9999cc 2px solid;
	}
	.tabletd{
		
		border-bottom:#eaddff 1px solid;
		
	}
	.tableth{ color:white; background-color:#597ca4;}
	
</style>
</head>
<body>
	<div align="center">
	* 글 삭제 *<br/>
	<form name="myform" method="post" action="pds_delok.jsp">
		<input type="hidden" name="pdsno" value="<%=request.getParameter("pdsno")%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<input type="hidden" name="filename" value="<%=request.getParameter("filename") %>">
		<table border="0" cellpadding="2" cellspacing="2" class="table">
		<tr>
			<th class="tableth" colspan="2">삭제 하시겠습니까?</th>
		</tr>
		<tr>
			<td class="tabletd" colspan="2">
				<input type="button" value="확인" class="btn" onclick="blankchk(this.form)">
				<input type="button" value="취소" class="btn" onclick="history.go(-1)">
			</td>
		</tr>
		</table>
	</form>
	</div>
	
	<script type="text/javascript">
		//onload=document.myform.passwd.focus();		
	
		function blankchk(frm) {
			frm.submit();
		}
	</script>
</body>
</html>