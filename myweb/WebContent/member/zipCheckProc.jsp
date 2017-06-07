<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%request.setCharacterEncoding("euc-kr"); %>
 <%@ include file="zipssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> zipCheckForm.jsp </title>
<script type="text/javascript">
function use(zipcode, address) {
	opener.document.regForm.zipcode.value=zipcode;
	opener.document.regForm.address1.value=address;
	
	window.close();
	}
</script>
<link rel="stylesheet" type="text/css" href="../css/mystyle.css"/>

<style type='text/css'>
	.table{
		border-collapse:collapse;
		cellpacing:0;
		border-top:1px solid #eaddff;
		border-bottom:1px solid #eaddff;
		border-left:1px solid #eaddff;
		border-right:1px solid #eaddff;
		
	}
	.tabletd{
		border-top:#eaddff 1px solid;
		border-bottom:#eaddff 1px solid;
		border-left:#eaddff 1px solid;
		border-right: #eaddff 1px solid;
		text-align:left;
		
	}
	.tableth{ 
		background-color:#EADDFF; 
		border-top:#D1B2FF 1px solid;
		border-bottom:#D1B2FF 1px solid;
		border-left:#D1B2FF 1px solid;
		border-right: #D1B2FF 1px solid;  
		text-align:center;
	}
</style>
</head>
<body>
<%
	String dongli=request.getParameter("dong");

	dto.setDongli(dongli);

	ArrayList<ZipcodeDTO> list = mgr.list(dto); 

	if(list==null)
	{
	out.print("없는 주소 입니다");
	}
	else
	{
%>
<div id="scrollbar" style="width:405px; height:350px; overflow:auto; padding:10px; border:0; border-style:solid; border-color:'#ecedf3';">
	총 <font color="blue"><strong><%=list.size() %></strong></font> 건의 검색 결과가 나왔습니다<br/>
	<table border='0' class="table" width="400">
	<tr>
	<td class="tableth">우편번호</td>
	<td class="tableth">주소</td>
	<td class="tableth">선택</td>
	</tr>
<%
		for(int idx=0; idx<list.size(); idx++)
		{
			
			dto=(ZipcodeDTO)list.get(idx);	
	
			String addrnum=dto.getZipcode();
			String addr=dto.getSido()+" "+dto.getGugun()+" "+dto.getDongli()+" "+dto. getEtc();	
%>
	<tr>
	<td class="tabletd"><%=addrnum%></td>
	<td class="tabletd"><%=addr %></td>
	<td><input type="button" value = "선택" class="btn" onclick="javascript:use('<%=addrnum%>','<%=addr %>')"></td>
<%
		}
%>
	</table>
<%
	}
%>
</div>
</body>
</html>