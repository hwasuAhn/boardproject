<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디중복확인</title>
<script type="text/javascript">
function frmSubmit(){
    var f = document.frmIdcheck;  // 폼태그 추출

    if (f.id.value == "") {
        alert("아이디를 입력해 주세요.");
        f.id.focus();
        return false;             // 처리 종료
    }

    if (f.id.value.length < 4) {
        alert("아이디는 4자이상 입력하셔야 합니다.");
        f.id.focus();
        return false;
    }

    return true; 
}
</script>
</head>
<body>
<center>
* 아이디 중복 확인 *<br/><br/>
<form action="./id_check_proc.jsp" 
           method="post" 
           name="frmIdcheck" 
           onsubmit="return frmSubmit();">
    
    
<br><br><br>    
아이디 입력 하세요.<br><br>
<input type="text" name="id" size="20">
<input type="submit"  value="검색">
</form> 
</center>

</body>
</html>