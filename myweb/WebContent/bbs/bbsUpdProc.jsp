<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- bbsUpdProc.jsp -->
	<!-- 본문 시작 -->
	<%	
		//사용자가 입력 요청한 값 가져오기
		int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
		String wname=request.getParameter("wname").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		String passwd=request.getParameter("passwd").trim();
		String ip=request.getRemoteHost();
		
		//dto 객체에 담기
		dto.setBbsno(bbsno);
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPasswd(passwd);
		dto.setIp(ip);
		
		boolean flag=dao.update(dto);
		if(flag)
		{
			//response.sendRedirect("bbsList.jsp?nowPage="+request.getParameter("nowPage"));
	%>
	<script type="text/javascript">
		alert("수정 성공");
		location="bbsList.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
		</script>
	<%
		}
		else
		{		
			out.print("update 실패<br/>");
			out.print("<a href='javascript:history.back()'>다시시도</a>");
		}
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		