<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../notice/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> notice_list.jsp </title>
<link rel="stylesheet" type="text/css" href="../../css/mystyle.css"/>
<style type='text/css'>
	.table{
		border-collapse:collapse;
		cellpacing:0;
		border-top:#009999 2px solid;
		border-bottom:#009999 2px solid;
	}
	.tabletd{
		border-bottom:#eaddff 2px solid;
		
	}
	
	.tableth{ color:white; background-color:#597ca4;}
	
	a.submenu:hover{background:#c5c5e6;color:#4855cc; height:25px;}
	a.submenu2:hover{
       background:#FFFF6C;color:#FF9436; 
    }
  
</style>
</head>
<body>

	<div align="center">
	* �� ��� *<br/>
	<%		
		ArrayList<NoticeDTO> list=dao.list(nowPage);  //�ش��������� ��������
		int count = dao.countList();
		int pageSize = 10;
		int number = count - nowPage * pageSize;
		
		if(list==null)
		{
			out.print("�Խñ� ����");
		}
		else
		{
			ArrayList<NoticeDTO> list2=dao.list();  //��� ���ڵ� �������� 
	%>
	<table width="370" border="0" cellspacing="0">
	<tr align='center' height="21">
		<th class="tableth">��ȣ</th>
		<th class="tableth">����</th>
		<th class="tableth">�ۼ���</th>	
	</tr>
	<%
			for(int idx=0; idx<list.size(); idx++)
			{
				dto=(NoticeDTO)list.get(idx);  //ArrayList���� ���� ��������
				out.print("<tr>");
				out.print("<td width=50 height=25 align='center' class='tabletd'>"+number+"</td>");
				out.print("<td td width='200' align='left' class='tabletd'>");
				
				
		 		out.print("<a href='notice_read.jsp?nowPage="+nowPage+"&noticeno="+dto.getNoticeno()+"'>"+dto.getSubject()+"</a>");
		 		
		 		//���� �������׿� new�̹��� �߰�
		 		String today=Utility.getDate();  //2013-05-01;
		 		String regdt=dto.getRegdt().substring(0, 10);
		 		if(regdt.equals(today))
		 		{
		 			out.print("<img src='../../images/new.gif'>");
		 		}		 				 		
		 		out.print("</td>");		
				out.print("<td width='120' align='center' class='tabletd'>"+dto.getRegdt().substring(0, 10)+"</td>");
				out.print("</tr>");
				
				number--;
			}
	%>
	<tr>
		<td height="30" colspan="2" align="left">��&nbsp;&nbsp;<font color='blue'><strong><%if(list2!=null){out.print(list2.size());}%> </strong></font>���� �Խù��� �ֽ��ϴ�</td>
	    <td align="center">
	   
	   <a href='notice_form.jsp'><img src='../../images/bt_write.gif' border='0'/></a></td>
	  
	 </tr>
	
	<%
	//---------------
	//PageList ���
	//---------------
	//nowPage : ����������
	out.print("<tr><td colspan='3' height='30' align='center'>");
	out.print(dao.paging(nowPage, "notice_list.jsp"));
	out.print("</td></tr>");
	out.print("</table>");
	//-------------------------------------------------
		} 
	%>
	</table>
	</div>
</body>
</html>