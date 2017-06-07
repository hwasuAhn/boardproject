<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_attach.gif"/><br/><br/>
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
		<input type="image" src="../images/bt_list.gif" onclick="gourl(this.form, 'pdsList.jsp')">  <!-- 목록 -->
		<input type="image" src="../images/bt_mod.gif" onclick="gourl(this.form, 'pdsUpd.jsp')"/>  <!-- 수정 -->
		<input type="image" src="../images/bt_del.gif" onclick="gourl(this.form, 'pdsDel.jsp')"/>  <!-- 삭제 -->
		<input type="hidden" name="pdsno" value="<%=dto.getPdsno()%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<input type="hidden" name="filename" value="<%=dto.getFilename() %>">
	</form>
	<script type="text/javascript">
		function gourl(frm, file) {
			frm.action=file;
			frm.submit();
		}
	</script>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		