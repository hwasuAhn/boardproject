<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵��ߺ�Ȯ��</title>
<script type="text/javascript">
function frmSubmit(){
    var f = document.frmIdcheck;  // ���±� ����

    if (f.id.value == "") {
        alert("���̵� �Է��� �ּ���.");
        f.id.focus();
        return false;             // ó�� ����
    }

    if (f.id.value.length < 4) {
        alert("���̵�� 4���̻� �Է��ϼž� �մϴ�.");
        f.id.focus();
        return false;
    }

    return true; 
}
</script>
</head>
<body>
<center>
* ���̵� �ߺ� Ȯ�� *<br/><br/>
<form action="./id_check_proc.jsp" 
           method="post" 
           name="frmIdcheck" 
           onsubmit="return frmSubmit();">
    
    
<br><br><br>    
���̵� �Է� �ϼ���.<br><br>
<input type="text" name="id" size="20">
<input type="submit"  value="�˻�">
</form> 
</center>

</body>
</html>