<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../pds/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> pds_updok.jsp </title>
</head>
<body>
	<div align="center">
	<%	
		UploadManager requestWrap=null;
		requestWrap=new UploadManager(request, -1, -1, tempDir);
		request=requestWrap;  //상속의 다형성
		
		String filename2=request.getParameter("filename2").trim();
		String filename="";  //업로드 파일명		
		FileItem fileItem=requestWrap.getFileItem("filename");
		long filesize=fileItem.getSize();  //파일 사이즈
		
		if(filesize>0)
		{
			//전송된 파일이 있다면 물리적인 디스크로 저장
			filename=requestWrap.saveFile(fileItem, upDir);			
			dto.setFilename(filename);
			dto.setFilesize(filesize);	
		}
		
		//텍스트 정보 가져오기
		int pdsno=Integer.parseInt(request.getParameter("pdsno").trim());
		String wname=request.getParameter("wname").trim();
		String subject=request.getParameter("subject").trim();
		String passwd=request.getParameter("passwd").trim();
		String ip=request.getRemoteHost();
		
		//한글변환
		wname=Utility.getEncodingFileUpload12(wname);
		subject=Utility.getEncodingFileUpload12(subject);
		
		dto.setPdsno(pdsno);
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);

		
		int res=mgr.updateproc(dto); 
		if(res==0)
		{
			out.print("파일수정 실패<br/>");
			out.print("<a href='javascript:history.back();'>다시시도</a>");
		}
		else
		{
			if(filesize>0)
			{
			UploadManager.deleteFile(upDir, filename2);
			}
			response.sendRedirect("pds_list.jsp?nowPage="+request.getParameter("nowPage"));
		}
	
	%>
	</div>
</body>
</html>