<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="www.bbs.*"%>
<%@ page import="www.utility.*"%>

<jsp:useBean id="dto" class="www.bbs.BbsDTO" scope="page"/>
<jsp:useBean id="dao" class="www.bbs.BbsDAO" scope="page"/>
<jsp:useBean id="mvcbbsDto" class="my.board.BoardDataBean" scope="page"/>
<jsp:useBean id="phpbbsDto" class="php.board.BoardDataBean" scope="page"/>

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