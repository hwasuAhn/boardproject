<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="www.member.*" %>
<%@page import="www.utility.*" %>

<jsp:useBean id="dto" class="www.member.ZipcodeDTO" scope="page"/>
<jsp:useBean id="mgr" class="www.member.ZipcodeMgr" scope="page" />

<%request.setCharacterEncoding("euc-kr"); %>