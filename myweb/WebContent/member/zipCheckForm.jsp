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
			alert("동을 입력해주세요")
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
	*우편번호 검색*<br/>
	<form name="zip" action="zipCheckProc.jsp" method="post">
	<table border='0' width="325px" height="37px" class="table">
	<tr>
		<td align="left" class="tabletd" valign = "middle">
			▶동/읍/면 의 이름을 입력하시고 '주소찾기'를 클릭하세요. (예 : 개포동 또는 창녕읍 또는 홍동면)
		</td>
	</tr>
	<tr>
		<td  class="tabletd">
			동이름 &nbsp; <input type="text" name="dong">
			<input type="button" value="주소찾기" class="btn" onclick="zipcode()">
		</td>
	</tr>
	</table>
	</form>
 	<div style="height: 50px; "></div>
        <div style="height: 30px; ">
            <table border="0" width="330px" height="75px">
	        <tr>
	            <td align="right" valign="middle">
	                <a href="#" onclick="javascript:window.close()">[창닫기]</a>
	            </td>
	        </tr>
            </table>
        </div>
</body>
</html>