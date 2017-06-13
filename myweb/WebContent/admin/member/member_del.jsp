<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../member/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> member_del.jsp </title>
<script type="text/javascript">
	function delok(frm) {
		var mess="회원정보가 영구히 삭제됩니다\n삭제할까요?"
		if(confirm(mess))
		{
			frm.submit();
		}
	}  //delok() end
</script>
</head>
<body>
	<div align="center">* 회/원/삭/제 *</div><br/>
	<%
		ArrayList<MemberDTO> list=mgr.list(nowPage);
		
		if(list==null)
		{
			out.print("회원 없음");
		}
		else
		{
			ArrayList<MemberDTO> list2=mgr.list();
	%>
	<table border="1" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>	
		<th>우편번호</th>	
		<th>주소</th>	
		<th>상세주소</th>	
		<th>직업</th>	
		<th>회원등급</th>	
		<th>가입일</th>	
		<th>삭제</th>
	</tr>
	<%
			for(int idx=0; idx<list.size(); idx++)
			{
				dto=(MemberDTO)list.get(idx);  //ArrayList에서 한줄 가져오기
	%>
				<tr>
				<td> <%=dto.getId()%></td>
				<td><%=dto.getPasswd()%></td>
				<td><%=dto.getMname()%></td>
				<td><%=dto.getTel()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getZipcode()%></td>
				<td><%=dto.getAddress1()%></td>
				<td><%=dto.getAddress2()%></td>
				<td><%=dto.getJob()%></td>
				<td><%=dto.getMlevel()%></td>
				<td><%=dto.getMdate().substring(0, 10)%></td>		
				<td>
					<form method="post" action="member_delok.jsp">
						<input type="button" value="삭제" onClick="delok(this.form)">
						<input type="hidden" name="id" value="<%=dto.getId()%>">
					</form>
				</td>		
	<%
			}
	%>
	</tr>
	</table>
	<table align="center">
	<tr>
		<td height="30" colspan="2" align="left">총 회원&nbsp;&nbsp;<font color='blue'><strong><%if(list2!=null){out.print(list2.size());}%> </strong></font>명</td>
	 </tr>
	</table>
	<%
	//---------------
	//PageList 출력
	//---------------
	//nowPage : 현재페이지
	out.print("<table border='0' align='center'>");
	out.print("<tr><td height='40' align='center'>");
	out.print(mgr.paging(nowPage, "member_del.jsp"));
	out.print("</td></tr>");
	out.print("</table>");
	//-------------------------------------------------
		} 
	%>
</body>
</html>