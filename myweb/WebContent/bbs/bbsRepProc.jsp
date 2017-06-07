<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %> 
   
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- bbsRepProc.jsp -->
	<!-- 본문 시작 -->
	* 답변쓰기 *<br/>
	<%
		//1)사용자 입력 요청한 정보 가져오기
		int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
		String wname=request.getParameter("wname").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String passwd=request.getParameter("passwd").trim();
		String ip=request.getRemoteHost();
		
		//2)dto에 세팅하기
		dto.setBbsno(bbsno);
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPasswd(passwd);
		dto.setIp(ip);
		
		int res=dao.reply(dto);
		if(res==0)
		{
			out.print("답변쓰기 실패!!<br/>");
			out.print("<a href='javascript:history.back()'>");
		}
		else
		{
			response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		