<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>    
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- pdsList.jsp -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_attach.gif"/><br/><br/>

	<%		
	ArrayList<PdsDTO> list=mgr.list(nowPage);
	String root=request.getContextPath();  //웹사이트명(myweb)
	if(list==null)
	{
		out.print("관련자료 없음");
	}
	else
	{
		ArrayList<PdsDTO> list2=mgr.list(); 
	%>
	<div id="scrollbar" style="width:620px; height:400px; overflow:auto; padding:10px; border:0; 
                             border-style:solid; border-color:'#ecedf3';">
	<table width="600" border="0" cellspacing="0">
	<tr align='center' height="21">
		<th class="tableth">번호</th>
		<th class="tableth">제목</th>
		<th class="tableth">파일</th>
		<th class="tableth">작성자</th>
		<th class="tableth">조회수</th>
		<th class="tableth">작성일</th>
	</tr>
	<%
		for(int idx=0; idx<list.size(); idx++)
		{
			dto=(PdsDTO)list.get(idx);
	%>
	<tr>
		<td width=60 height=25 class='tabletd'><%=dto.getPdsno() %></td>
		<td width='240' align='center' class='tabletd'>
		<a href="pdsRead.jsp?nowPage=<%=nowPage%>&pdsno=<%=dto.getPdsno()%>"><%=dto.getSubject() %></a>
	<%
		//오늘 게시글에 new이미지 추가
		String today=Utility.getDate();  //2013-05-01;
		String regdate=dto.getRegdate().substring(0, 10);
		 if(regdate.equals(today))
		{
			out.print("<img src='../images/new.gif'>");
		}
		 		
		 //조회수 10이상 hot이미지 추가
		 if(dto.getReadcnt()>=10)
		 {
			out.print("<img src='../images/hot.gif'>");
		 }
	%>
		</td>
		<td class='tabletd'>
			<%
				int pos=dto.getFilename().indexOf(".");
				String filename=dto.getFilename().substring(pos);
				if(filename.equals(".jpg") || filename.equals(".gif")) 
				{
			%>	
				<a href="pdsRead.jsp?nowPage=<%=nowPage%>&pdsno=<%=dto.getPdsno()%>">			
				<img src="<%=root%>/storage/<%=dto.getFilename()%>" width="150" height="130"/>
				</a>
			<%			
				}
				else
				{
			%>
				<a href="<%=root %>/storage/<%=dto.getFilename() %>"><%=dto.getFilename() %></a>
			<%		
				}
			%>
			</td>
		<td width='120' class='tabletd'><%=dto.getWname() %></td>
		<td width='60' class='tabletd'><%=dto.getReadcnt() %></td>
		<td width='120' class='tabletd'><%=dto.getRegdate().substring(0, 10) %></td>
	</tr>
	<%
		}
	%>
	<tr>
		<td height="30" colspan="2" align="left">총&nbsp;&nbsp;<font color='blue'><strong><%if(list2!=null){out.print(list2.size());}%> </strong></font>개의 게시물이 있습니다</td>
		<td></td>
	    <td></td>
	    <td></td>
	    <td><input type="button" onclick="gourl()" value="파일올리기" class="btn"/></td>
	 </tr>
	</table>
	<%	
	//---------------
	//PageList 출력
	//---------------
	//nowPage : 현재페이지
	out.print("<table>");
	out.print("<tr><td colspan='3' height='30' align='center'>");
	out.print(mgr.paging(nowPage, "pdsList.jsp"));
	out.print("</td></tr>");
	out.print("</table>");
	//-------------------------------------------------
	}
	%>
	</div>
	<script type="text/javascript"> 
		<!--
		function gourl() {		  
			location.href='pdsForm.jsp';		        
		}
		//-->
	</script>	
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		