<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- memberProc.jsp -->
	<!-- 본문 시작 -->
	* 회원가입 *<br/>
	<%
		//사용자가 요청 전달한 값 가져오기
		//dto객체에 세팅하기
		String id=request.getParameter("id").trim();
		String passwd=request.getParameter("passwd").trim();
		String mname=request.getParameter("mname").trim();
		String tel=request.getParameter("tel").trim();
		String email=request.getParameter("email").trim();
		String zipcode=request.getParameter("zipcode").trim();
		String address1=request.getParameter("address1").trim();
		String address2=request.getParameter("address2").trim();
		String job=request.getParameter("job").trim();
		
		dto.setId(id);
		dto.setPasswd(passwd);
		dto.setMname(mname);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setZipcode(zipcode);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setJob(job);
		
		int res=mgr.insert(dto);
		if(res==0)
		{
			out.print("회원가입 실패<br/>");
			out.print("<a href='javascript:history.back();'>다시시도</a>");
		}
		else
		{
	%>
	<script type="text/javascript">
	<!--
		alert("회원가입 성공")
		location="loginForm.jsp"
	-->
	</script>
	<%
			//response.sendRedirect("loginForm.jsp");
		}	
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		