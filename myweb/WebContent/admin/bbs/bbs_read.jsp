<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../bbs/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> bbs_read.jsp </title>
<link rel="stylesheet" type="text/css" href="../../css/mystyle.css"/>
<style type='text/css'>
	.table{
		border-collapse:collapse;
		cellpacing:0;
		border-top:#9999cc 2px solid;
		border-bottom:#9999cc 2px solid;
		border-left:1px solid #eaddff;
		border-right: 1px solid #eaddff;
	}
	.tabletd{
		border-top: 1px solid #eaddff;
		border-left:1px solid #eaddff;
		border-right:1px solid #eaddff;
		border-bottom:#eaddff 1px solid;
		
	}
	.tableth{ color:white; background-color:#597ca4;}
	
</style>
</head>
<body>
	<div align="center">
	* �� �󼼺��� *<br/>
	<%
		int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
		dto=dao.read(bbsno);
		if(dto==null)
		{
			out.print("���� �Խñ� ����");
		}
		else
		{
			//<>&...�� Ư�����ڷ� ��ȯ
			String content=Utility.getConvertChar(dto.getContent());
			//���͸� <br>�±׷� ��ȯ
			content=Utility.getConvertBR(content);			
	%>
	<table border='1' width='600' cellspacing="0" class="table">
	<tr>
	 	<th class="tableth" height='21' colspan='4'><%=dto.getSubject()%></th>
	</tr>
	<tr>
		<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">�ۼ���</td>
	 	<td class="tabletd" align='left'><%=dto.getWname()%></td>
	 	<td align='left'  height='25' class="tabletd" width="70" bgcolor="#ecedf3">��ȸ��</td>
	 	<td class="tabletd" align='left'><%=dto.getReadcnt()%></td>
	</tr>
	
	<tr>
	 	<td align='left' height='100' colspan='4'  class="tabletd">
	 	 <div style="width:575px; height:240px; overflow:auto; padding:10px; border:0; text-align:left;" id="scrollbar">	 	
	 	<%=content%></div></td>
	</tr>
	<tr>
		<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">�ۼ���</td>
	 	<td class="tabletd" align='left' width="200"><%=dto.getRegdt().substring(0, 10)%></td>	
	 	<td align='left' height='25' class="tabletd" width="70" bgcolor="#ecedf3">IP�ּ�</td>
	 	<td class="tabletd" align='left'><%=dto.getIp()%></td>
	 </tr>
	
	</table>
	<%
		}
	%>
	<br/>
	<form method="post">
		<input type="image" src="../../images/bt_list.gif" onclick="gourl(this.form, 'bbs_list.jsp')">  <!-- ��� -->
		<input type="image" src="../../images/bt_rep.gif" onclick="gourl(this.form, 'bbs_rep.jsp')"/>  <!-- ��� -->
		<input type="image" src="../../images/bt_mod.gif" onclick="gourl(this.form, 'bbs_upd.jsp')"/>  <!-- ���� -->
		<input type="image" src="../../images/bt_del.gif" onclick="gourl(this.form, 'bbs_del.jsp')"/>  <!-- ���� -->
		<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
	</form>
	</div>
	<script type="text/javascript">
		function gourl(frm, file) {
			frm.action=file;
			frm.submit();
		}
	</script>
</body>
</html>