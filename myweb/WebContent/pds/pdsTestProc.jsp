<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="www.utility.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> pdsTestProc.jsp </title>
</head>
<body>
	* 파일 첨부 게시판 *<br/>
	<%
		//파일 첨부에 관련된 enctype이 추가되었을 경우
		//사용자가 전달한 값은 request객체를 사용할 수 없다
		/* request.setCharacterEncoding("euc-kr");
		out.print(request.getParameter("title")+"<br/>");
		out.print(request.getParameter("content")+"<br/>");
		out.print(request.getParameter("etc")+"<br/>");
		out.print(request.getParameter("filenm")+"<br/>");
		out.print(request.getParameter("filenm").length()+"<br/>");
		out.print("<br/>"); */
		//------------------------------------------------------------
		// 자료실 구현 부분 - 파일 업로드 
		// enctype="multipart/form-data" 로 보낸 데이터는
		// request 객체로 받을 수 없음으로
		// request 객체에 접근 할 수 있는
		// HttpServletRequestWrapper를 상속받은 
		// FileUploadRequestWrapper 클래스의 객체를 만들어 사용한다
		//------------------------------------------------------------
		
		//서버에서 temp폴더의 실제 물리적인 경로를 파악
		String tempdir=application.getRealPath("/temp");
		out.print(tempdir);
		UploadManager requestWrap=null;
		requestWrap=new UploadManager(request, -1, -1, tempdir);
		request=requestWrap;  //상속의 다형성		
		
		out.print("<br/>");
		out.print(request.getParameter("title")+"<br/>");
		out.print(request.getParameter("content")+"<br/>");
		out.print(request.getParameter("etc")+"<br/>");
		
		//전송해온 파일관련 자료---------------------
		//전송파일 가져오기
		FileItem item=requestWrap.getFileItem("filenm");
		out.print("파일크기 : "+item.getSize()+"<br/>");
		out.print("파일이름 : "+item.getName()+"<br/>");
		out.print("파일타입 : "+item.getContentType()+"<br/>");
		
		//temp폴더에 파일 저장하기
		String str=UploadManager.saveFile(item, tempdir);
		out.print(str+" 파일 저장 성공");
	%>
</body>
</html>