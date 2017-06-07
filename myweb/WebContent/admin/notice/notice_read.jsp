<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../notice/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> notice_read.jsp </title>
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
	* 글 상세보기 *<br/>
	<%
		
		int noticeno=Integer.parseInt(request.getParameter("noticeno").trim());
		dto=dao.read(noticeno);
		if(dto==null)
		{
			out.print("관련 게시글 없음");
		}
		else
		{
			//<>&...등 특수문자로 변환
			String content=Utility.getConvertChar(dto.getContent());
			//엔터를 <br>태그로 변환
			content=Utility.getConvertBR(content);			
	%>
	<table border='1' width='600' cellspacing="0" class="table">
	<tr>
		<th class="tableth" height='21' colspan='2'><%=dto.getSubject()%></th>
	</tr>
	<tr>
	 	<td align='left' height='100' colspan='2'  class="tabletd">
	 	 <div style="width:575px; height:240px; overflow:auto; padding:10px; border:0; text-align:left;" id="scrollbar">	 
	 	 <%=content%>
	 	 </div></td>
	</tr>	
	
	
	</table>
	<%
		}
	%>
	<br/>
	<form method="post">
		<input type="image" src="../../images/bt_list.gif" onclick="gourl(this.form, 'notice_list.jsp')">  <!-- 목록 -->		
		<input type="image" src="../../images/bt_mod.gif" onclick="gourl(this.form, 'notice_upd.jsp')"/>  <!-- 수정 -->
		<input type="image" src="../../images/bt_del.gif" onclick="gourl(this.form, 'notice_del.jsp')"/>  <!-- 삭제 -->
		<input type="hidden" name="noticeno" value="<%=dto.getNoticeno()%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
	</form>
	</div>
	<script type="text/javascript">
		function gourl(frm, file) {
			frm.action=file;
			frm.submit();
		}
	</script>
</body>
</html>