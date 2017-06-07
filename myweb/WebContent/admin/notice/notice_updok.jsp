<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../notice/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> notice_updok.jsp </title>
</head>
<body>
	<div align="center">
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
		location="notice_list.jsp?nowPage="+<%=request.getParameter("nowPage")%>;
		</script>
	<%
		}
		else
		{		
			out.print("수정 실패<br/>");
			out.print("<a href='javascript:history.back()'>다시시도</a>");
		}
	%>
	</div>
</body>
</html>