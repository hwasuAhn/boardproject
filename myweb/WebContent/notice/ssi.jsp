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
	//session ����
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