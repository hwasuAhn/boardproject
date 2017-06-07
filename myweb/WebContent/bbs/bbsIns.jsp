<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- bbsIns.jsp -->
	<!-- 본문 시작 -->
	<%
		//사용자가 입력 요청한 값 가져오기
		String wname=request.getParameter("wname").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String passwd=request.getParameter("passwd").trim();
		
		//입력 요청한 사용자PC의 IP
		String ip=request.getRemoteHost();
		
		//dto 객체에 담기
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPasswd(passwd);
		dto.setIp(ip);
		
		int res=dao.insert(dto);
		if(res==0)
		{
			out.print("insert 실패<br/>");
			out.print("<a href='javascript:history.back()'>다시시도</a>");
		}
		else
		{
			response.sendRedirect("bbsList.jsp");
		}	
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		