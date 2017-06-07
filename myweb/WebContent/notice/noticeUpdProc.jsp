<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- noticeUpdProc.jsp -->
	<!-- 본문 시작 -->
	<%	
		//사용자가 입력 요청한 값 가져오기
		int noticeno=Integer.parseInt(request.getParameter("noticeno").trim());
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		
		//dto 객체에 담기
		dto.setNoticeno(noticeno);
		dto.setSubject(subject);
		dto.setContent(content);
		
		boolean flag=dao.update(dto);
		if(flag)
		{
			//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
	%>
	<script type="text/javascript">
		alert("수정 성공");
		location="noticeList.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
		</script>
	<%
		}
		else
		{		
			out.print("수정 실패<br/>");
			out.print("<a href='javascript:history.back()'>다시시도</a>");
		}
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		