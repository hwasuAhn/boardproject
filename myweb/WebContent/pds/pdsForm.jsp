<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!-- pdsForm.jsp -->
	<!-- 본문 시작 -->
	<img src="../images/j_board_attach.gif"/><br/><br/>
    <form name="frmData" 
          method="post"
          enctype="multipart/form-data" 
          action="./pdsIns.jsp" 
          onSubmit="return checkData(this)"> 
	  <table width="600" border="1" cellspacing="1" class="table">	       
	      <tr> 
	        <th width="80"  height="30" class="tableth">성명</th>
	        <td width="350" align="left" class="tabletd"><input type="text" name="wname" value='홍길동'></td>
	      </tr>
	      <tr> 
	        <th class="tableth">내용</th>
	        <td align="left" class="tabletd"><textarea name="subject" rows='10' cols='70'>맛있는 요리 사진</textarea></td>
	      </tr>
	      <tr> 
	        <th class="tableth">파일명</th>
	        <td align="left" class="tabletd"><input type="file" name="filename" value="" size="40"></td>
	      </tr>
	      <tr> 
	        <th class="tableth">비밀번호</th>
	        <td align="left" class="tabletd"><input type="password" name="passwd" value='1234'></td>
	      </tr>
	      </table>
	      <br/>
	      <table width="600" border="0" cellspacing="1">
	      <tr>
	      <td align="left" width="20" >
        	<a href='pdsList.jsp'><img src='../images/bt_list.gif' border='0'></a>
			</td> 
	        <td style='text-align:center;'>
	          <div align="center"> 
	            <input type="submit"  value="전송" class="btn">
	               
	            <input type="Reset"  value="다시쓰기" class="btn">
	          </div>
	          </td>
	      </tr>
	  </table>
    </form>
    
	<script type="text/javascript">
	function checkData(f){ // f == document.frmData 객체
	    var msg; // 에러 메세지
	    var str; // 임시 문자열 저장 변수
	    
	    // 파일명을 소문자로 변환
	    var ext = f.filename.value.toLowerCase();
	    
	    /* 
	     정규 표현식
	     /^\s*: 시작 문자가 탭, 공백, 개행인 경우
	     |    : OR 문자는 두 정규 표현식에서의 선택을 허용
	     \s*  : 문자가 탭, 공백, 개행인 경우 
	     $/g  : 패턴을 문장의 끝에 적용
	     \s*$/g: 문장의 끝에 있는 공백          
	    */
	    // alert('>>' + '  test test  '.replace(/^\s*|\s*$/g,'') + '<<'); return false;
	
	       
	    // 이름 앞뒤의 공백 제거
	    str = f.wname.value.replace(/^\s*|\s*$/g,''); 
	
	    // 이름의 길이를 비교
	    if (str.length == 0){
	        msg = '이름을 입력해 주세요'; 
	        window.alert(msg);
	        f.wname.focus();
	        return false;
	    }
	
	    // 제목 앞뒤의 공백 제거
	    str = f.subject.value.replace(/^\s*|\s*$/g,'');
	    if (str.length == 0){
	        msg = '제목을 입력해 주세요'; 
	        window.alert(msg);
	        f.subject.focus();
	        return false;
	    }
	
	    // 이름 앞뒤의 공백 제거
	    str = f.filename.value.replace(/^\s*|\s*$/g,''); 
	
	    // 이름의 길이를 비교
	    if (str.length == 0){
	        msg = '전송할 파일을 선택해 주세요'; 
	        window.alert(msg);
	        f.filename.focus();
	        return false;
	    }
	    
	    if (f.passwd.value.length < 4){
	        msg = '비밀번호는 4자이상 입력해 주세요';    
	        window.alert(msg);
	        f.passwd.focus();
	        return false;
	    }   
	
	    if (ext.lastIndexOf(".exe") > 0){
	        alert('파일의 확장자가 EXE 인것은 전송할 수 없습니다.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".asp") > 0){
	        alert('파일의 확장자가 ASP 인것은 전송할 수 없습니다.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".jsp") > 0){
	        alert('파일의 확장자가 JSP 인것은 전송할 수 없습니다.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".php") > 0){
	        alert('파일의 확장자가 PHP 인것은 전송할 수 없습니다.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".cgi") > 0){
	        alert('파일의 확장자가 CGI 인것은 전송할 수 없습니다.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".dll") > 0){
	        alert('파일의 확장자가 DLL 인것은 전송할 수 없습니다.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".jar") > 0){
	        alert('파일의 확장자가 JAR 인것은 전송할 수 없습니다.');
	        f.filename.focus();
	        return false;
	    }
	        
	    return true;
	}
	</script>	
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		