<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../notice/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> notice_updform.jsp </title>
<link rel="stylesheet" type="text/css" href="../../css/mystyle.css"/>
<style type='text/css'>
	.table{
		border-collapse:collapse;
		cellpacing:0;
		border-top:#9999cc 2px solid;
		border-bottom:#9999cc 2px solid;
		border-left:1px solid #eaddff;
		border-right: 1px solid #eaddff;
	}
	.tabletd{
		border-top: 1px solid #eaddff;
		border-left:1px solid #eaddff;
		border-right:1px solid #eaddff;
		border-bottom:#eaddff 1px solid;
		
	}
	.tableth{ color:white; background-color:#597ca4;}
	
</style>
</head>
<body>
	<div align="center">
	* 글 수정 *<br/>
	<%
		int noticeno=Integer.parseInt(request.getParameter("noticeno").trim());
		dto.setNoticeno(noticeno);
		
		dto=dao.updateform(dto);
		if(dto==null)
		{
	%>
	<script type="text/javascript">
		alert("수정 실패")
		history.back();
	</script>
    <%
    	}
		else
		{
	%>
	<form method="post" action="notice_updok.jsp">
	<input type="hidden" name="noticeno" value="<%=dto.getNoticeno()%>">
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<table width="450" border="1" cellspacing="1" class="table" >
		<tr>
			<th height="30" width="80" class="tableth">제목</th>
			<td align="left" class="tabletd"><input type="text" name="subject" size="50" value="<%=dto.getSubject()%>"></td>
		</tr>
		<tr>
			<th class="tableth">내용</th>
			<td align="left" class="tabletd"><textarea name="content" rows="10" cols="50"><%=dto.getContent()%></textarea></td>
		</tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:450px; margin-top:10px;">
		<tr>
			<td align="left" width="20" >
			<a href="notice_list.jsp?nowPage=<%=request.getParameter("nowPage")%>"><img src="../../images/bt_list.gif"/></a>
			</td>
			<td style='text-align:center;'>
			  <input type="submit" value="수정" class="btn">
			  <input type="reset" value="취소" class="btn">
			</td>
		</tr>
		</table>			
	</form>
	</div>
	<%		 
		}
	%>
</body>
</html>