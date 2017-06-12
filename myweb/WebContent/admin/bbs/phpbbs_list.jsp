<%@page import="php.board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../bbs/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> bbs_list.jsp </title>
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
		ArrayList<BoardDataBean> list=dao.phplist(nowPage);  //�ش��������� ��������
		
		if(list==null)
		{
			out.print("�Խñ� ����");
		}
		else
		{
			ArrayList<BoardDataBean> list2=dao.phplist();  //��� ���ڵ� ��������
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
				phpbbsDto=(BoardDataBean)list.get(idx);  //ArrayList���� ���� ��������
				out.print("<tr>");
				out.print("<td width=50 height=25 class='tabletd'>"+phpbbsDto.getNum()+"</td>");
				out.print("<td td width='260' align='left' class='tabletd'>");
				
				//���þ����� ���
				if(phpbbsDto.getRe_step()>0)
				{
					for(int n=1; n<=phpbbsDto.getRe_step(); n++)
					{
						out.print("<img src='../../images/icon_reply.gif'/>");
					}
				}
		 		out.print("<a href='phpbbs_read.jsp?nowPage="+nowPage+"&num="+phpbbsDto.getNum()+"'>"+phpbbsDto.getSubject()+"</a>");
		 		
		 		//���� �Խñۿ� new�̹��� �߰�
		 		String today=Utility.getDate();  //2013-05-01;
		 		String regdt=phpbbsDto.getReg_date().toString().substring(0, 10);
		 		if(regdt.equals(today))
		 		{
		 			out.print("<img src='../../images/new.gif'>");
		 		}
		 		
		 		//��ȸ�� 10�̻� hot�̹��� �߰�
		 		if(dto.getReadcnt()>=10)
		 		{
			 		out.print("<img src='../../images/hot.gif'>");
		 		}
		 				 		
		 		out.print("</td>");
				out.print("<td width='120' class='tabletd'>"+phpbbsDto.getWriter()+"</td>");
				out.print("<td width='50' class='tabletd'>"+phpbbsDto.getReadcount()+"</td>");				
				out.print("<td width='120' class='tabletd'>"+phpbbsDto.getReg_date().toString().substring(0, 10)+"</td>");
				out.print("</tr>");
			}
	%>
	<tr>
		<td height="30" colspan="2" align="left">��&nbsp;&nbsp;<font color='blue'><strong><%if(list2!=null){out.print(list2.size());}%></strong></font>���� �Խù��� �ֽ��ϴ�</td>
		<td></td>
	    <td></td>
	    <td><a href="phpbbs_form.jsp"><img src="../../images/bt_write.gif" border="0"/></a></td>
	 </tr>
	
	<%
	//---------------
	//PageList ���
	//---------------
	//nowPage : ����������
	out.print("<tr><td height='40' colspan='5' align='center'>");
	out.print(dao.paging(nowPage, "phpbbs_list.jsp"));
	out.print("</td></tr>");
	out.print("</table>");
	//-------------------------------------------------
		} 
	%>	
	</table>
	</div>
</body>
</html>