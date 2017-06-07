<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
<!-- bbsList.jsp -->
<!-- 본문 시작 -->
	<img src="../images/j_board_notice.gif"/><br/><br/>
	<div id="scrollbar" style="width:620px; height:380px; overflow:auto; padding:10px; border:0; border-style:solid; border-color:'#ecedf3';"> <!-- 스크롤바 -->
	<%		
		ArrayList<NoticeDTO> list=dao.list(nowPage);  //해당페이지만 가져오기
		
		if(list==null)
		{
			out.print("게시글 없음");
		}
		else
		{
			ArrayList<NoticeDTO> list2=dao.list();  //모든 레코드 가져오기 
	%>
	<table width="370" border="0" cellspacing="0">
	<tr align='center' height="21">
		<th class="tableth">번호</th>
		<th class="tableth">제목</th>
		<th class="tableth">작성일</th>	
	</tr>
	<%
			for(int idx=0; idx<list.size(); idx++)
			{
				dto=(NoticeDTO)list.get(idx);  //ArrayList에서 한줄 가져오기
				out.print("<tr>");
				out.print("<td width=50 height=25 class='tabletd'>"+dto.getNoticeno()+"</td>");
				out.print("<td td width='200' align='left' class='tabletd'>");
				
				
		 		out.print("<a href='noticeRead.jsp?nowPage="+nowPage+"&noticeno="+dto.getNoticeno()+"'>"+dto.getSubject()+"</a>");
		 		
		 		//오늘 공지사항에 new이미지 추가
		 		String today=Utility.getDate();  //2013-05-01;
		 		String regdt=dto.getRegdt().substring(0, 10);
		 		if(regdt.equals(today))
		 		{
		 			out.print("<img src='../images/new.gif'>");
		 		}		 				 		
		 		out.print("</td>");		
				out.print("<td width='120' class='tabletd'>"+dto.getRegdt().substring(0, 10)+"</td>");
				out.print("</tr>");
			}
	%>
	<tr>
		<td height="30" colspan="2" align="left">총&nbsp;&nbsp;<font color='blue'><strong><%if(list2!=null){out.print(list2.size());}%> </strong></font>개의 게시물이 있습니다</td>
	    <td>
	    <% 
	    /* 	    
	    String s_mlevel="";
	    
		if(session.getAttribute("s_mlevel")!=null)
		{
			s_mlevel=(String)session.getAttribute("s_mlevel");
		}
		else
		{
			s_mlevel="guest";
		} */
	    
	   if(s_mlevel.equals("A")) {
	    out.print("<a href='noticeForm.jsp'><img src='../images/bt_write.gif' border='0'/></a></td>");
	    } %>
	 </tr>
	
	<%
	//---------------
	//PageList 출력
	//---------------
	//nowPage : 현재페이지
	out.print("<tr><td colspan='3' height='30' align='center'>");
	out.print(dao.paging(nowPage, "noticeList.jsp"));
	out.print("</td></tr>");
	out.print("</table>");
	//-------------------------------------------------
		} 
	%>
	</table>
	</div>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>