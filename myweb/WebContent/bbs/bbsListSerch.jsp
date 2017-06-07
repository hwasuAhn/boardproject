<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>

<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
<!-- bbsList.jsp -->
<!-- ���� ���� -->
	<img src="../images/j_board_reply.gif"/><br/><br/>
	<div id="scrollbar" style="width:620px; height:400px; overflow:auto; padding:10px; border:0; border-style:solid; border-color:'#ecedf3';"> <!-- ��ũ�ѹ� -->
	<%
		request.setCharacterEncoding("euc-kr");
		String serch=request.getParameter("serch");
		String serchTxt=request.getParameter("serchTxt").trim();
	%>
	<%
	if(serchTxt=="")
	{
		response.sendRedirect("bbsList.jsp");
	}
		
	else
	{
		ArrayList<BbsDTO> list=dao.listSerch(nowPage, serchTxt, serch);  //�ش��������� ��������  
		
		if(list==null)
		{
			out.print("�Խñ� ����");
		}
		else
		{
			ArrayList<BbsDTO> list2=dao.listSerch(serchTxt, serch);  //��� ���ڵ� ��������
	%>
	<table width="600" border="0" cellspacing="0">
	<tr align='center' height="21">
		<th class="tableth">��ȣ</th>
		<th class="tableth">����</th>
		<th class="tableth">�ۼ���</th>
		<th class="tableth">��ȸ��</th>
		<th class="tableth">�ۼ���</th>	
	</tr>
	<%
			for(int idx=0; idx<list.size(); idx++)
			{
				dto=(BbsDTO)list.get(idx);  //ArrayList���� ���� ��������
				out.print("<tr>");
				out.print("<td width=50 height=25 class='tabletd'>"+dto.getBbsno()+"</td>");
				out.print("<td td width='260' align='left' class='tabletd'>");
				
				//���þ����� ���
				if(dto.getIndent()>0)
				{
					for(int n=1; n<=dto.getIndent(); n++)
					{
						out.print("<img src='../images/icon_reply.gif'/>");
					}
				}
		 		out.print("<a href='bbsRead.jsp?nowPage="+nowPage+"&bbsno="+dto.getBbsno()+"'>"+dto.getSubject()+"</a>");
		 		
		 		//���� �Խñۿ� new�̹��� �߰�
		 		String today=Utility.getDate();  //2013-05-01;
		 		String regdt=dto.getRegdt().substring(0, 10);
		 		if(regdt.equals(today))
		 		{
		 			out.print("<img src='../images/new.gif'>");
		 		}
		 		
		 		//��ȸ�� 10�̻� hot�̹��� �߰�
		 		if(dto.getReadcnt()>=10)
		 		{
			 		out.print("<img src='../images/hot.gif'>");
		 		}
		 				 		
		 		out.print("</td>");
				out.print("<td width='120' class='tabletd'>"+dto.getWname()+"</td>");
				out.print("<td width='50' class='tabletd'>"+dto.getReadcnt()+"</td>");				
				out.print("<td width='120' class='tabletd'>"+dto.getRegdt().substring(0, 10)+"</td>");
				out.print("</tr>");
			}
	%>
	<tr>
		<td height="30" colspan="2" align="left">��&nbsp;&nbsp;<font color='blue'><strong><%if(list2!=null){out.print(list2.size());}%></strong></font> ���� �Խù��� �ֽ��ϴ�</td>
		<td></td>
	    <td></td>
	    <td><a href="bbsForm.jsp"><img src="../images/bt_write.gif" border="0"/></a></td>
	 </tr>
	
	<%
	if(list2.size()!=0){
	//---------------
	//PageList ���
	//---------------
	//nowPage : ����������
	out.print("<tr><td height='40' colspan='5' align='center'>");
	out.print(dao.paging(nowPage, "bbsList.jsp"));
	out.print("</td></tr>");
	out.print("</table>");
	//-------------------------------------------------
	}
	
		}
	}
	%>	
	</table>
	<br/>
	 <table cellpadding="0" cellspacing="0">
     <tr>
     	<td>
     	<form method="post" action="bbsListSerch.jsp">	
			<select name='serch'>
			    <option value="S1" selected>����</option>
			    <option value="S2">����+����</option>
			    <option value="S3">�ۼ���</option>
		    </select>
		
			<input type="text" size="30" name="serchTxt" value="">
		
			<input type="submit" value="�˻�" class='btn'>
		</form>
	</tr>
	</table>
	</div>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>