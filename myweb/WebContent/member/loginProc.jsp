<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>    

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- loginProc.jsp -->
	<!-- 본문 시작 -->
	<%	
		String id=request.getParameter("id").trim();
		String passwd=request.getParameter("passwd").trim();
		dto.setId(id);
		dto.setPasswd(passwd);
		dto=mgr.loginproc(dto);
		if(dto!=null)
		{
			//로그인 성공을 했으면
			//session 유지시간 10분 설정
			session.setMaxInactiveInterval(600);
			//session변수 선언
			session.setAttribute("s_id", id);  //아이디
			session.setAttribute("s_passwd", passwd);  //비번
			session.setAttribute("s_mlevel", dto.getMlevel());  //회원등급
			
			//아이디 쿠키저장-----------------------------
			String c_id=request.getParameter("c_id");
			//Checkbox에 체크를 하면 SAVE, 안하면 빈값
			if(c_id==null)
			{
				c_id="";
			}
			
			Cookie cookie=null;
			if(c_id.equals("SAVE"))
			{
				//Checkbox를 선택해 쿠키를 저장할 경우
				cookie=new Cookie("c_id", id);
				cookie.setMaxAge(60*60*24*31);  //1달동안 쿠키저장
			}
			else
			{
				//Checkbox를 선택하지않아 쿠키를 저장하지 않을 경우
				cookie=new Cookie("c_id", "");
				cookie.setMaxAge(0);  //0second
			}
			
			response.addCookie(cookie);  //사용자PC에 쿠키값 저장
			//----------------------------------------------		
			response.sendRedirect("../index.jsp");
		}
		else
		{
	%>
	<script type="text/javascript">
		alert("아이디와 비밀번호를 확인해주세요");
		location="loginForm.jsp";
	</script>
	<%
		}
	%>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		