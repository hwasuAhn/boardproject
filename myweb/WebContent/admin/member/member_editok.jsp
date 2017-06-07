<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../member/ssi.jsp" %>
<%
	//member_editok.jsp
	String id=request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	String mname=request.getParameter("mname").trim();
	String tel=request.getParameter("tel").trim();
	String email=request.getParameter("email").trim();
	String zipcode=request.getParameter("zipcode").trim();
	String address1=request.getParameter("address1").trim();
	String address2=request.getParameter("address2").trim();
	String job=request.getParameter("job").trim();
	String mlevel=request.getParameter("mlevel").trim();
	
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	dto.setMlevel(mlevel);
	
	//out.print(dto);
 	int res=mgr.update(dto); 
	if(res==0)
	{
		out.print("회원정보수정 실패");
	}
	else
	{
		out.print("회원정보수정 성공");
	}
	
%>