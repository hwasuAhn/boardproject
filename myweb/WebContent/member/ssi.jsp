<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="www.member.*"%>
<%@ page import="www.utility.*"%>

<jsp:useBean id="dto" class="www.member.MemberDTO" scope="page"/>
<jsp:useBean id="mgr" class="www.member.MemberMgr" scope="page"/>

<% request.setCharacterEncoding("euc-kr"); %>

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