<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="www.pds.*"%>
<%@ page import="www.utility.*"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>

<jsp:useBean id="dto" class="www.pds.PdsDTO" scope="page"/>
<jsp:useBean id="mgr" class="www.pds.PdsMgr" scope="page"/>

<% request.setCharacterEncoding("euc-kr"); %>

<%
// 다운로드 관련 부분-----------------------------------------
// 파일 다운로드 폴더
//String downDir = "/storage";
// 파일 저장 폴더 (실제 물리적인 경로 파악 d:\~~)
String upDir=application.getRealPath("/storage");
System.out.println("upDir: " + upDir);

// 임시 저장 폴더
String tempDir=application.getRealPath("/temp");
// --------------------------------------------------------------
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