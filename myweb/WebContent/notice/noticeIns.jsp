<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- noticeIns.jsp -->
	<!-- 본문 시작 -->
	<%
		//사용자가 입력 요청한 값 가져오기
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		
		//dto 객체에 담기
		dto.setSubject(subject);
		dto.setContent(content);
		
		int res=dao.insert(dto);
		if(res==0)
		{
			out.print("insert 실패<br/>");
			out.print("<a href='javascript:history.back()'>다시시도</a>");
		}
		else
		{
			response.sendRedirect("noticeList.jsp");
		}	
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		