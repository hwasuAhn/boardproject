<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../pds/ssi.jsp" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> pds_ins.jsp </title>
</head>
<body>
	<div align="center">
	* 첨부형 게시판 *<br/><br/>
	<%
	UploadManager requestWrap=null;
	requestWrap=new UploadManager(request, -1, -1, tempDir);
	request=requestWrap;  //상속의 다형성
	
	String filename="";  //업로드 파일명
	FileItem fileItem=requestWrap.getFileItem("filename");
	long filesize=fileItem.getSize();  //파일 사이즈
	
	if(filesize>0)
	{
		//전송된 파일이 있다면 물리적인 디스크로 저장
		filename=requestWrap.saveFile(fileItem, upDir);
	}
	
	//텍스트 정보 가져오기
	String wname=request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String passwd=request.getParameter("passwd").trim();
	String ip=request.getRemoteHost();
	
	//한글변환
	wname=Utility.getEncodingFileUpload12(wname);
	subject=Utility.getEncodingFileUpload12(subject);
	
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setPasswd(passwd);
	dto.setFilename(filename);
	dto.setFilesize(filesize);	
	
	int res=mgr.insert(dto);
	if(res==0)
	{
		out.print("파일등록 실패");
		out.print("<a href='javascript:history.back();'>다시시도</a>");
	}
	else
	{
		response.sendRedirect("pds_list.jsp");
	}
	%>
	</div>
</body>
</html>