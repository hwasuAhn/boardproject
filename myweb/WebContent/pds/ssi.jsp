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
// �ٿ�ε� ���� �κ�-----------------------------------------
// ���� �ٿ�ε� ����
//String downDir = "/storage";
// ���� ���� ���� (���� �������� ��� �ľ� d:\~~)
String upDir=application.getRealPath("/storage");
System.out.println("upDir: " + upDir);

// �ӽ� ���� ����
String tempDir=application.getRealPath("/temp");
// --------------------------------------------------------------
%>

<%
//------------------
//����¡ ���� �κ�
//------------------
int nowPage=0;  //���� ������ ��ȣ�� 0����
//���� nowPage(���� ������)�� 0���� ����

if(request.getParameter("nowPage")!=null)
{
	//����ڰ� ��û�� ������ ���� �������� �����Ѵ�
	//request.getParameter()�� �⺻������ ���ڿ��� ó��
	//���� ������ �ʿ��� ���� ������ ��ȯ �ؾ� ��
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
%>