<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- pdsIns.jsp -->
	<!-- ���� ���� -->
	* ÷���� �Խ��� *<br/><br/>
	<%
	UploadManager requestWrap=null;
	requestWrap=new UploadManager(request, -1, -1, tempDir);
	request=requestWrap;  //����� ������
	
	String filename="";  //���ε� ���ϸ�
	FileItem fileItem=requestWrap.getFileItem("filename");
	long filesize=fileItem.getSize();  //���� ������
	
	if(filesize>0)
	{
		//���۵� ������ �ִٸ� �������� ��ũ�� ����
		filename=requestWrap.saveFile(fileItem, upDir);
	}
	
	//�ؽ�Ʈ ���� ��������
	String wname=request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String passwd=request.getParameter("passwd").trim();
	String ip=request.getRemoteHost();
	
	//�ѱۺ�ȯ
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
		out.print("���ϵ�� ����");
		out.print("<a href='javascript:history.back();'>�ٽýõ�</a>");
	}
	else
	{
		response.sendRedirect("pdsList.jsp");
	}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		