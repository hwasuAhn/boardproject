<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
<!-- bbsList.jsp -->
<!-- 본문 시작 -->
	* 글 목록 *<br/>
	<%
		ArrayList<NoticeDTO> list2=dao.list();  //모든 레코드 가져오기 
		ArrayList<NoticeDTO> list=dao.list(nowPage);  //해당페이지만 가져오기
		
		if(list==null)
		{
			out.print("게시글 없음");
		}
		else
		{
	%>
		총 게시글 : <%=list2.size()%>개<br/>
	<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성일</th>	
	</tr>
	<%
			for(int idx=0; idx<list.size(); idx++)
			{
				dto=(NoticeDTO)list.get(idx);  //ArrayList에서 한줄 가져오기
				out.print("<tr>");
				out.print("<td>"+dto.getNoticeno()+"</td>");
				out.print("<td align='left'>");
				
				
		 		out.print("<a href='noticeRead.jsp?nowPage="+nowPage+"&noticeno="+dto.getNoticeno()+"'>"+dto.getSubject()+"</a>");
		 		
		 		//오늘 공지사항에 new이미지 추가
		 		String today=Utility.getDate();  //2013-05-01;
		 		String regdt=dto.getRegdt().substring(0, 10);
		 		if(regdt.equals(today))
		 		{
		 			out.print("<img src='../images/new.gif'>");
		 		}		 				 		
		 		out.print("</td>");		
				out.print("<td>"+dto.getRegdt().substring(0, 10)+"</td>");
				out.print("</tr>");
			}
	%>
	</table>
	<br/>
	<%
	//---------------
	//PageList 출력
	//---------------
	//nowPage : 현재페이지
	out.print("<table border='0'>");
	out.print("<tr><td height='50' align='center'>");
	out.print(dao.paging(nowPage, "noticeList.jsp"));
	out.print("</td></tr>");
	out.print("</table>");
	//-------------------------------------------------
		} 
	%>
	<br/>
	<a href="noticeForm.jsp"><img src="../images/bt_write.gif"/></a>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>