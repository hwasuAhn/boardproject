<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../member/ssi.jsp" %>
<%
	//member_delok.jsp
	String id=request.getParameter("id").trim();
	
	int res=mgr.delete(id); 
	if(res==0)
	{
		out.print("회원삭제 실패");
	}
	else
	{
		out.print("회원삭제 성공");
	}
	
%>