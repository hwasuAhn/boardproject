<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../pds/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> pds_read.jsp </title>
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
	* 글 상세보기 *
	<%
		String root=request.getContextPath();  //웹사이트명(myweb)
		int pdsno=Integer.parseInt(request.getParameter("pdsno").trim());
		
		dto=mgr.read(pdsno); 
		if(dto==null)
		{
			out.print("관련 게시글 없음");
		}
		else
		{
			//<>&...등 특수문자로 변환
			String content=Utility.getConvertChar(dto.getSubject());
			//엔터를 <br>태그로 변환
			content=Utility.getConvertBR(content);			
	%>
	<table border='1' width='600' cellspacing="0" class="table">
	<tr>
	 	<th class="tableth" height='21' colspan='4'><%=dto.getSubject()%></th>
	</tr>
	<tr>
		<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">작성자</td>
	 	<td class="tabletd" align='left'><%=dto.getWname()%></td>
	 	<td align='left'  height='25' class="tabletd" width="70" bgcolor="#ecedf3">조회수</td>
	 	<td class="tabletd" align='left'><%=dto.getReadcnt()%></td>
	</tr>
	
	<tr>
	 	<td align='left' height='100' colspan='4'  class="tabletd">
	 	 <div style="width:575px; height:240px; overflow:auto; padding:10px; border:0; text-align:left;" id="scrollbar">	 	
	 	<%=content%><br/><br/><br/><br/>
	 	<a href="<%=root %>/storage/<%=dto.getFilename() %>">			
		<img src="<%=root%>/storage/<%=dto.getFilename()%>" >
		<br/><br/>
		</a>
		
	 	</div></td>
	</tr>
	<tr>
		<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">파일명</td>
		<td class="tabletd" align='left'><a href="<%=root %>/storage/<%=dto.getFilename() %>"><%=dto.getFilename() %></a></td>
		<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">파일크기</td>
		<td class="tabletd" align='left'><%=dto.getFilesize()/1024 %>&nbsp;KByte</td>
	</tr>	
	</table>
	<%
		}
	%>
	<br/>
	<form method="post">
		<input type="image" src="../../images/bt_list.gif" onclick="gourl(this.form, 'pds_list.jsp')">  <!-- 목록 -->
		<input type="image" src="../../images/bt_mod.gif" onclick="gourl(this.form, 'pds_upd.jsp')"/>  <!-- 수정 -->
		<input type="image" src="../../images/bt_del.gif" onclick="gourl(this.form, 'pds_del.jsp')"/>  <!-- 삭제 -->
		<input type="hidden" name="pdsno" value="<%=dto.getPdsno()%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<input type="hidden" name="filename" value="<%=dto.getFilename() %>">
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