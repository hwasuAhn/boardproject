<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../member/ssi.jsp" %>
<%
	//member_delok.jsp
	String id=request.getParameter("id").trim();
	
	int res=mgr.delete(id); 
	if(res==0)
	{
		out.print("ȸ������ ����");
	}
	else
	{
		out.print("ȸ������ ����");
	}
	
%>