<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
<!-- bbsList.jsp -->
<!-- ���� ���� -->
	* �� ��� *<br/>
	<%
		ArrayList<NoticeDTO> list2=dao.list();  //��� ���ڵ� �������� 
		ArrayList<NoticeDTO> list=dao.list(nowPage);  //�ش��������� ��������
		
		if(list==null)
		{
			out.print("�Խñ� ����");
		}
		else
		{
	%>
		�� �Խñ� : <%=list2.size()%>��<br/>
	<table border="1">
	<tr>
		<th>��ȣ</th>
		<th>����</th>
		<th>�ۼ���</th>	
	</tr>
	<%
			for(int idx=0; idx<list.size(); idx++)
			{
				dto=(NoticeDTO)list.get(idx);  //ArrayList���� ���� ��������
				out.print("<tr>");
				out.print("<td>"+dto.getNoticeno()+"</td>");
				out.print("<td align='left'>");
				
				
		 		out.print("<a href='noticeRead.jsp?nowPage="+nowPage+"&noticeno="+dto.getNoticeno()+"'>"+dto.getSubject()+"</a>");
		 		
		 		//���� �������׿� new�̹��� �߰�
		 		String today=Utility.getDate();  //2013-05-01;
		 		String regdt=dto.getRegdt().substring(0, 10);
		 		if(regdt.equals(today))
		 		{
		 			out.print("<img src='../images/new.gif'>");
		 		}		 				 		
		 		out.print("</td>");		
				out.print("<td>"+dto.getRegdt().substring(0, 10)+"</td>");
				out.print("</tr>");
			}
	%>
	</table>
	<br/>
	<%
	//---------------
	//PageList ���
	//---------------
	//nowPage : ����������
	out.print("<table border='0'>");
	out.print("<tr><td height='50' align='center'>");
	out.print(dao.paging(nowPage, "noticeList.jsp"));
	out.print("</td></tr>");
	out.print("</table>");
	//-------------------------------------------------
		} 
	%>
	<br/>
	<a href="noticeForm.jsp"><img src="../images/bt_write.gif"/></a>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>