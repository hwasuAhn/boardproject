<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!-- pdsForm.jsp -->
	<!-- ���� ���� -->
	<img src="../images/j_board_attach.gif"/><br/><br/>
    <form name="frmData" 
          method="post"
          enctype="multipart/form-data" 
          action="./pdsIns.jsp" 
          onSubmit="return checkData(this)"> 
	  <table width="600" border="1" cellspacing="1" class="table">	       
	      <tr> 
	        <th width="80"  height="30" class="tableth">����</th>
	        <td width="350" align="left" class="tabletd"><input type="text" name="wname" value='ȫ�浿'></td>
	      </tr>
	      <tr> 
	        <th class="tableth">����</th>
	        <td align="left" class="tabletd"><textarea name="subject" rows='10' cols='70'>���ִ� �丮 ����</textarea></td>
	      </tr>
	      <tr> 
	        <th class="tableth">���ϸ�</th>
	        <td align="left" class="tabletd"><input type="file" name="filename" value="" size="40"></td>
	      </tr>
	      <tr> 
	        <th class="tableth">��й�ȣ</th>
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
	            <input type="submit"  value="����" class="btn">
	               
	            <input type="Reset"  value="�ٽþ���" class="btn">
	          </div>
	          </td>
	      </tr>
	  </table>
    </form>
    
	<script type="text/javascript">
	function checkData(f){ // f == document.frmData ��ü
	    var msg; // ���� �޼���
	    var str; // �ӽ� ���ڿ� ���� ����
	    
	    // ���ϸ��� �ҹ��ڷ� ��ȯ
	    var ext = f.filename.value.toLowerCase();
	    
	    /* 
	     ���� ǥ����
	     /^\s*: ���� ���ڰ� ��, ����, ������ ���
	     |    : OR ���ڴ� �� ���� ǥ���Ŀ����� ������ ���
	     \s*  : ���ڰ� ��, ����, ������ ��� 
	     $/g  : ������ ������ ���� ����
	     \s*$/g: ������ ���� �ִ� ����          
	    */
	    // alert('>>' + '  test test  '.replace(/^\s*|\s*$/g,'') + '<<'); return false;
	
	       
	    // �̸� �յ��� ���� ����
	    str = f.wname.value.replace(/^\s*|\s*$/g,''); 
	
	    // �̸��� ���̸� ��
	    if (str.length == 0){
	        msg = '�̸��� �Է��� �ּ���'; 
	        window.alert(msg);
	        f.wname.focus();
	        return false;
	    }
	
	    // ���� �յ��� ���� ����
	    str = f.subject.value.replace(/^\s*|\s*$/g,'');
	    if (str.length == 0){
	        msg = '������ �Է��� �ּ���'; 
	        window.alert(msg);
	        f.subject.focus();
	        return false;
	    }
	
	    // �̸� �յ��� ���� ����
	    str = f.filename.value.replace(/^\s*|\s*$/g,''); 
	
	    // �̸��� ���̸� ��
	    if (str.length == 0){
	        msg = '������ ������ ������ �ּ���'; 
	        window.alert(msg);
	        f.filename.focus();
	        return false;
	    }
	    
	    if (f.passwd.value.length < 4){
	        msg = '��й�ȣ�� 4���̻� �Է��� �ּ���';    
	        window.alert(msg);
	        f.passwd.focus();
	        return false;
	    }   
	
	    if (ext.lastIndexOf(".exe") > 0){
	        alert('������ Ȯ���ڰ� EXE �ΰ��� ������ �� �����ϴ�.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".asp") > 0){
	        alert('������ Ȯ���ڰ� ASP �ΰ��� ������ �� �����ϴ�.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".jsp") > 0){
	        alert('������ Ȯ���ڰ� JSP �ΰ��� ������ �� �����ϴ�.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".php") > 0){
	        alert('������ Ȯ���ڰ� PHP �ΰ��� ������ �� �����ϴ�.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".cgi") > 0){
	        alert('������ Ȯ���ڰ� CGI �ΰ��� ������ �� �����ϴ�.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".dll") > 0){
	        alert('������ Ȯ���ڰ� DLL �ΰ��� ������ �� �����ϴ�.');
	        f.filename.focus();
	        return false;
	    }
	
	    if (ext.lastIndexOf(".jar") > 0){
	        alert('������ Ȯ���ڰ� JAR �ΰ��� ������ �� �����ϴ�.');
	        f.filename.focus();
	        return false;
	    }
	        
	    return true;
	}
	</script>	
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		