<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
	<img src="../images/j_mypage_mvc.gif"/><br/><br/><br/>
	* ȸ������ ���� *<br/>
	<c:if test="${dto==null }">
	<script type="text/javascript">
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�")
		history.back();
	</script>
	</c:if>
    <c:if test="${dto!=null }">
	 <form name="regForm" 
   	               method="post" 
	               action="modifyPro.do">
	<input type="hidden" name="id" value="${dto.id }">
      <!-- <div style="text-align:right">* �ʼ� �Է�</div> -->
      <table  width="600" border="1" cellspacing="0" cellpadding="2"  align="center" class="table">
         <tr> 
           <th width="20%" class="tableth" align="right">���̵�</th>
           <td width="57%" class="tabletd" align="left" colspan="2"> 
               <strong>&nbsp;${dto.id }</strong>
            </td>            
         </tr>
         <tr>	
            <th class="tableth" align="right">��й�ȣ</th>
            <td class="tabletd" align="left"><input type="password" name="passwd" size="15" value="${dto.passwd }" maxlength="12"> </td>
            <td class="tabletd" align="left">��й�ȣ�� �����ּ���.</td>
          </tr>
          <tr> 
            <th class="tableth" align="right">��й�ȣ Ȯ��</th>
            <td class="tabletd" align="left"><input type="password" name="repasswd" size="15" value="${dto.passwd }" maxlength="12"> </td>
            <td class="tabletd" align="left">��й�ȣ�� Ȯ���մϴ�.</td>
          </tr>
          <tr> 
            <th class="tableth" align="right">�̸�</th>
            <td class="tabletd" align="left"><input type="text" name="mname" size="15" value="${dto.mname }" maxlength="12"> </td>
            <td class="tabletd" align="left">���Ǹ��� �����ּ���.</td>
          </tr>
          <tr> 
            <th class="tableth" align="right">�̸���</th>
            <td class="tabletd" align="left">
                <input type="text" name="email" size="27"  value="${dto.email }">
                <input type="button" 
                            value="Email �ߺ�Ȯ��" class="btn"
                            onclick="javascript:emailCheck(this.form.email.value)">
            
            </td>
            <td class="tabletd" align="left">�̸����� �����ּ���.</td>
          </tr>         
          <tr>  
            <th class="tableth" align="right">��ȭ��ȣ</th>
            <td class="tabletd" align="left">
                <input type="text" name="tel" value="${dto.tel }">
            </td>
            <td class="tabletd" align="left">��ȭ��ȣ�� �����ּ���.</td>
          </tr>
          <tr>  
            <th class="tableth" align="right">�����ȣ</th>
            <td class="tabletd" align="left"><input type="text" name="zipcode" size="10" value="${dto.zipcode }" readonly>
                 <input type="button" value="�����ȣã��"  class="btn"
                       onclick="javascript:zipCheck()"></td>
            <td class="tabletd" align="left">�����ȣ�� �˻� �ϼ���.</td>
          </tr>
          <tr>  
            <th class="tableth" align="right">�ּ�</th>
            <td class="tabletd" align="left">
            <input type="text" name="address1" size="45" value="${dto.address1 }"><br/>
            <input type="text" name="address2" size="45" value="${dto.address2 }">
            </td>
            <td class="tabletd" align="left">�ּҸ� ���� �ּ���.</td>
          </tr>
          <tr>  
            <th class="tableth" align="right">����</th>
            <td class="tabletd" align="left"><select name='job'>
                    <option value="A01" <c:if test="${dto.job=='A01' }">selected</c:if>>ȸ���</option>
                    <option value="A03" <c:if test="${dto.job=='A03' }">selected</c:if>>���������</option>
                    <option value="A05" <c:if test="${dto.job=='A05' }">selected</c:if>>����������</option>
                    <option value="A07" <c:if test="${dto.job=='A07' }">selected</c:if>>�����б��л�</option>
                    <option value="A09" <c:if test="${dto.job=='A09' }">selected</c:if>>�Ϲ��ڿ���</option>
                    <option value="A11" <c:if test="${dto.job=='A11' }">selected</c:if>>������</option>
                    <option value="A13" <c:if test="${dto.job=='A13' }">selected</c:if>>�Ƿ���</option>
                    <option value="A15" <c:if test="${dto.job=='A15' }">selected</c:if>>������</option>
                    <option value="A17" <c:if test="${dto.job=='A17' }">selected</c:if>>����.���/������</option>
                    <option value="A19" <c:if test="${dto.job=='A19' }">selected</c:if>>��/��/����/������</option>
                    <option value="A21" <c:if test="${dto.job=='A21' }">selected</c:if>>�ֺ�</option>
                    <option value="A23" <c:if test="${dto.job=='A23' }">selected</c:if>>����</option>
                    <option value="A99" <c:if test="${dto.job=='A99' }">selected</c:if>>��Ÿ</option>
                  </select>
              </td>
            <td class="tabletd" align="left">������ ���� �ϼ���.</td>
          </tr>
      </table>
      <br/>
    <div style="text-align: center">
        <input type="button" value="��������" class="btn" onclick="javascript:inputCheck(this.form)" > 
        <input type="reset" class="btn" value="�ٽþ���">
        <input type="button" value="�ǵ��ư���" onclick="javascript:location.href='loginForm.do'" class="btn"/>
    </div>
	</form>
	</c:if>
	<script type="text/javascript">
	function zipCheck() {
		var zipwin=window.open("zipCheckForm.do", "winzip", "width=450, height=350");
	}
	
	function emailCheck(email) {
		//�̸��� �ߺ�Ȯ��
		email=email.replace(/^\s+|\s+$/g,"");
		if(email.length==0)
		{
			alert("�ߺ�Ȯ�� �� �̸����� �Է����ּ���");
			document.regForm.email.focus();
			return false;
		}	
		
		if (email.length>0)
		{		
			var count1=0; //@�� ����
			var count2=0; //.�� ����
			for( var i=0; i<=email.length; i++) {
				if(email.substring(i, i+1)=="@")
				{
					count1++;
					if((email.substring(i+1, i+2)=="@") || (email.substring(i+1, i+2)==".")) { alert("�ߺ�Ȯ�� �� �̸����� �ùٸ��� �Է����ּ���"); document.regForm.email.focus(); return false;}
				}
				if(email.substring(i, i+1)==".")
				{
					count2++;
					if((email.substring(i+1, i+2)=="@") || (email.substring(i+1, i+2)==".")) { alert("�ߺ�Ȯ�� �� �̸����� �ùٸ��� �Է����ּ���"); document.regForm.email.focus(); return false;}
				}
			}
			if((count1!=1) || (count2<1) || (count2>3)) { alert("�̸����� �ùٸ��� �Է����ּ���"); document.regForm.email.focus(); return false;}
		}		
		
			var winemail;	
			winemail=window.open("emailCheckPro.do?email="+email, "emailwin", "width=310, height=110");		
	}  //emailCheck() end
	
	function idCheck(id) {
		//���̵� �ߺ�Ȯ��
		id=id.replace(/^\s+|\s+$/g,"");  //��������
		if(id.length==0)
		{
			alert("�ߺ�Ȯ�� �� ���̵� �Է����ּ���");
			document.regForm.id.focus();
		}
		
		if(id.length<4) 
	    {
	        alert("���̵�� 4���̻� �Է����ּ���");
	        document.regForm.id.focus();
	    }
		else
		{
			var winid;	
			winid=window.open("idCheckPro.do?id="+id, "idwin", "width=250, height=110");
			//var x=(screen.width/2)-200;  //����� �ػ� ���� ũ��/2
			//var y=(screen.height/2)-150;  //����� �ػ� ���� ũ��/2			
			//winid.moveTo(x, y);  //�˾�â �̵�
		}
	}  //idCheck() end
	
	function inputCheck(frm) {
		//ȸ�������ϱ� �� ��ȿ�� �˻�
		
		var passwd=frm.passwd.value;
		passwd=passwd.replace(/^\s+|\s+$/g,"");
		if(passwd.length==0)
		{
			alert("��й�ȣ�� �Է����ּ���");
			return;
		}  //��й�ȣ �˻�
		
		var repasswd=frm.repasswd.value;
		repasswd=repasswd.replace(/^\s+|\s+$/g,"");
		if(repasswd.length==0)
		{
			alert("��й�ȣ Ȯ���� �Է����ּ���");
			return;
		}  //��й�ȣ �˻�
		
		if(passwd!=repasswd)
		{
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
			return;
		}  //��й�ȣ�� ��й�ȣ Ȯ�� ��ġ �˻�
			
		var mname=frm.mname.value;
		mname=mname.replace(/^\s+|\s+$/g,"");
		if(mname.length==0)
		{
			alert("�̸��� �Է����ּ���");
			return;
		}  //�̸� �˻�
	
		//�̸��� @�� .�˻�
		var email=frm.email.value;
		email=email.replace(/^\s+|\s+$/g,"");	
		if(email.length==0)
		{
			alert("�̸����� �Է����ּ���");
			email.focus();
			return false;
		}
		else if (email.length>0)
		{		
			var count1=0; //@�� ����
			var count2=0; //.�� ����
			for( var i=0; i<=email.length; i++) {
				if(email.substring(i, i+1)=="@")
				{
					count1++;
					if((email.substring(i+1, i+2)=="@") || (email.substring(i+1, i+2)==".")) { alert("�̸����� �ùٸ��� �Է����ּ���"); email.focus(); return false;}
				}
				if(email.substring(i, i+1)==".")
				{
					count2++;
					if((email.substring(i+1, i+2)=="@") || (email.substring(i+1, i+2)==".")) { alert("�̸����� �ùٸ��� �Է����ּ���"); email.focus(); return false;}
				}
			}
			if((count1!=1) || (count2<1) || (count2>3)) { alert("�̸����� �ùٸ��� �Է����ּ���"); email.focus(); return false;}
		}
		
		var tel=frm.tel.value;
		tel=tel.replace(/^\s+|\s+$/g,"");
		if(tel.length==0)
		{
			alert("��ȭ��ȣ�� �Է����ּ���");
			return;
		}  //��ȭ��ȣ �˻�
		
		var zipcode=frm.zipcode.value;
		zipcode=zipcode.replace(/^\s+|\s+$/g,"");
		if(zipcode.length==0)
		{
			alert("�����ȣ�� �Է����ּ���");
			return;
		}  //�����ȣ �˻�
		
		var address1=frm.address1.value;
		address1=address1.replace(/^\s+|\s+$/g,"");
		if(address1.length==0)
		{
			alert("�ּҸ� �Է����ּ���");
			return;
		}  //�ּ� �˻�
		
		var address2=frm.address2.value;
		address2=address2.replace(/^\s+|\s+$/g,"");
		if(address2.length==0)
		{
			alert("���ּҸ� �Է����ּ���");
			return;
		}  //���ּ� �˻�
		
		var zipcode=frm.zipcode.value;
		zipcode=zipcode.replace(/^\s+|\s+$/g,"");
		if(zipcode.length==0)
		{
			alert("�����ȣ�� �Է����ּ���");
			return;
		}  //�����ȣ �˻�
		
		var job=frm.job.value;
		if(job==0)
		{
			alert("������ �������ּ���");
			return;
		}  //���� �˻�
		
		frm.submit();
	}
	</script>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		