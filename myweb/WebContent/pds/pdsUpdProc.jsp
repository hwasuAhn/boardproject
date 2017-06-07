<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- pdsUpdProc.jsp -->
	<!-- ���� ���� -->
	<%	
		UploadManager requestWrap=null;
		requestWrap=new UploadManager(request, -1, -1, tempDir);
		request=requestWrap;  //����� ������
		
		String filename2=request.getParameter("filename2").trim();
		String filename="";  //���ε� ���ϸ�		
		FileItem fileItem=requestWrap.getFileItem("filename");
		long filesize=fileItem.getSize();  //���� ������
		
		if(filesize>0)
		{
			//���۵� ������ �ִٸ� �������� ��ũ�� ����
			filename=requestWrap.saveFile(fileItem, upDir);			
			dto.setFilename(filename);
			dto.setFilesize(filesize);	
		}
		
		//�ؽ�Ʈ ���� ��������
		int pdsno=Integer.parseInt(request.getParameter("pdsno").trim());
		String wname=request.getParameter("wname").trim();
		String subject=request.getParameter("subject").trim();
		String passwd=request.getParameter("passwd").trim();
		String ip=request.getRemoteHost();
		
		//�ѱۺ�ȯ
		wname=Utility.getEncodingFileUpload12(wname);
		subject=Utility.getEncodingFileUpload12(subject);
		
		dto.setPdsno(pdsno);
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);

		
		int res=mgr.updateproc(dto); 
		if(res==0)
		{
			out.print("���ϼ��� ����<br/>");
			out.print("<a href='javascript:history.back();'>�ٽýõ�</a>");
		}
		else
		{
			if(filesize>0)
			{
			UploadManager.deleteFile(upDir, filename2);
			}
			response.sendRedirect("pdsList.jsp?nowPage="+request.getParameter("nowPage"));
		}
	
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		