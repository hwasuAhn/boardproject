<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="www.notice.*"%>
<%@ page import="www.utility.*"%>

<jsp:useBean id="dto" class="www.notice.NoticeDTO" scope="page"/>
<jsp:useBean id="dao" class="www.notice.NoticeDAO" scope="page"/>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	//session 변수
	String s_mlevel="";
	    
	if(session.getAttribute("s_mlevel")!=null)
	{
		s_mlevel=(String)session.getAttribute("s_mlevel");
	}
	else
	{
		s_mlevel="guest";
	}
%>

<%
//------------------
//페이징 관련 부분
//------------------
int nowPage=0;  //시작 페이지 번호는 0부터
//최초 nowPage(현재 페이지)는 0부터 시작

if(request.getParameter("nowPage")!=null)
{
	//사용자가 요청한 값으로 현재 페이지를 구성한다
	//request.getParameter()는 기본적으로 문자열로 처리
	//따라서 연산이 필요한 경우는 정수로 변환 해야 함
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
%>