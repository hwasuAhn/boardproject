<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> zipCheckForm.jsp </title>

<script type="text/javascript">
	function zipcode() {
		var f=document.zip;
		if(f.dong.value=="")
		{
			alert("���� �Է����ּ���")
		}
		else
		{
			f.submit();
		}
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
	*�����ȣ �˻�*<br/>
	<form name="zip" action="zipCheckProc.jsp" method="post">
	<table border='0' width="325px" height="37px" class="table">
	<tr>
		<td align="left" class="tabletd" valign = "middle">
			����/��/�� �� �̸��� �Է��Ͻð� '�ּ�ã��'�� Ŭ���ϼ���. (�� : ������ �Ǵ� â���� �Ǵ� ȫ����)
		</td>
	</tr>
	<tr>
		<td  class="tabletd">
			���̸� &nbsp; <input type="text" name="dong">
			<input type="button" value="�ּ�ã��" class="btn" onclick="zipcode()">
		</td>
	</tr>
	</table>
	</form>
 	<div style="height: 50px; "></div>
        <div style="height: 30px; ">
            <table border="0" width="330px" height="75px">
	        <tr>
	            <td align="right" valign="middle">
	                <a href="#" onclick="javascript:window.close()">[â�ݱ�]</a>
	            </td>
	        </tr>
            </table>
        </div>
</body>
</html>