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
	* ���� ÷�� �Խ��� *<br/>
	<%
		//���� ÷�ο� ���õ� enctype�� �߰��Ǿ��� ���
		//����ڰ� ������ ���� request��ü�� ����� �� ����
		/* request.setCharacterEncoding("euc-kr");
		out.print(request.getParameter("title")+"<br/>");
		out.print(request.getParameter("content")+"<br/>");
		out.print(request.getParameter("etc")+"<br/>");
		out.print(request.getParameter("filenm")+"<br/>");
		out.print(request.getParameter("filenm").length()+"<br/>");
		out.print("<br/>"); */
		//------------------------------------------------------------
		// �ڷ�� ���� �κ� - ���� ���ε� 
		// enctype="multipart/form-data" �� ���� �����ʹ�
		// request ��ü�� ���� �� ��������
		// request ��ü�� ���� �� �� �ִ�
		// HttpServletRequestWrapper�� ��ӹ��� 
		// FileUploadRequestWrapper Ŭ������ ��ü�� ����� ����Ѵ�
		//------------------------------------------------------------
		
		//�������� temp������ ���� �������� ��θ� �ľ�
		String tempdir=application.getRealPath("/temp");
		out.print(tempdir);
		UploadManager requestWrap=null;
		requestWrap=new UploadManager(request, -1, -1, tempdir);
		request=requestWrap;  //����� ������		
		
		out.print("<br/>");
		out.print(request.getParameter("title")+"<br/>");
		out.print(request.getParameter("content")+"<br/>");
		out.print(request.getParameter("etc")+"<br/>");
		
		//�����ؿ� ���ϰ��� �ڷ�---------------------
		//�������� ��������
		FileItem item=requestWrap.getFileItem("filenm");
		out.print("����ũ�� : "+item.getSize()+"<br/>");
		out.print("�����̸� : "+item.getName()+"<br/>");
		out.print("����Ÿ�� : "+item.getContentType()+"<br/>");
		
		//temp������ ���� �����ϱ�
		String str=UploadManager.saveFile(item, tempdir);
		out.print(str+" ���� ���� ����");
	%>
</body>
</html>