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
		var mess="ȸ�������� ������ �����˴ϴ�\n�����ұ��?"
		if(confirm(mess))
		{
			frm.submit();
		}
	}  //delok() end
</script>
</head>
<body>
	<div align="center">* ȸ/��/��/�� *</div><br/>
	<%
		ArrayList<MemberDTO> list=mgr.list(nowPage);
		
		if(list==null)
		{
			out.print("ȸ�� ����");
		}
		else
		{
			ArrayList<MemberDTO> list2=mgr.list();
	%>
	<table border="1" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<th>���̵�</th>
		<th>��й�ȣ</th>
		<th>�̸�</th>
		<th>��ȭ��ȣ</th>
		<th>�̸���</th>	
		<th>�����ȣ</th>	
		<th>�ּ�</th>	
		<th>���ּ�</th>	
		<th>����</th>	
		<th>ȸ�����</th>	
		<th>������</th>	
		<th>����</th>
	</tr>
	<%
			for(int idx=0; idx<list.size(); idx++)
			{
				dto=(MemberDTO)list.get(idx);  //ArrayList���� ���� ��������
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
						<input type="button" value="����" onClick="delok(this.form)">
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
		<td height="30" colspan="2" align="left">�� ȸ��&nbsp;&nbsp;<font color='blue'><strong><%if(list2!=null){out.print(list2.size());}%> </strong></font>��</td>
	 </tr>
	</table>
	<%
	//---------------
	//PageList ���
	//---------------
	//nowPage : ����������
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