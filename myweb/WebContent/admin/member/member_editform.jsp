<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../member/ssi.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> member_editform.jsp </title>
<body>
	<div align="center">
	* ȸ������ ���� *<br/><br/>
	<%
		String id=request.getParameter("id").trim();
		dto.setId(id);
		dto=mgr.editform(dto);
		if(dto==null)
		{
	%>
	<script type="text/javascript">
		alert("���� ����")
		//history.back();
	</script>
    <%
    	}
		else
		{
	%>
	 <form name="regForm" 
   	               method="post" 
	               action="member_editok.jsp">
		<input type="hidden" name="id" value="<%=id%>">
      <table  width="650" border="1" cellspacing="0" cellpadding="2">
         <tr> 
           <th width="20%">���̵�</th>
           <td width="53%" align="left" colspan="2"> 
               <strong>&nbsp;<%=dto.getId() %></strong>
            </td>            
         </tr>
         <tr>	
            <th>��й�ȣ</th>
            <td align="left"> <input type="password" name="passwd" size="15" value="<%=dto.getPasswd() %>" maxlength="12"> </td>
            <td>��й�ȣ�� �����ּ���.</td>
          </tr>
          <tr> 
            <th>��й�ȣ Ȯ��</th>
            <td align="left"> <input type="password" name="repasswd" size="15" value="<%=dto.getPasswd() %>" maxlength="12"> </td>
            <td>��й�ȣ�� Ȯ���մϴ�.</td>
          </tr>
          <tr> 
            <th>�̸�</th>
            <td align="left"> <input type="text" name="mname" size="15" value="<%=dto.getMname() %>" maxlength="12"> </td>
            <td>���Ǹ��� �����ּ���.</td>
          </tr>
          <tr> 
            <th>�̸���</th>
            <td align="left">
                <input type="text" name="email" size="27"  value="<%=dto.getEmail()%>">
                <input type="button" 
                            value="Email �ߺ�Ȯ��" 
                            onclick="javascript:emailCheck(this.form.email.value)">
            
            </td>
            <td>�̸����� �����ּ���.</td>
          </tr>         
          <tr>  
            <th>��ȭ��ȣ</th>
            <td align="left">
                <input type="text" name="tel" value="<%=dto.getTel()%>">
            </td>
            <td>��ȭ��ȣ �Է�</td>
          </tr>
          <tr>  
            <th>�����ȣ</th>
            <td align="left"> <input type="text" name="zipcode" size="10" value="<%=dto.getZipcode() %>" readonly>
                 <input type="button" value="�����ȣã��" 
                       onclick="javascript:zipCheck()"></td>
            <td>�����ȣ�� �˻� �ϼ���.</td>
          </tr>
          <tr>  
            <th>�ּ�</th>
            <td align="left">
            <input type="text" name="address1" size="45" value="<%=dto.getAddress1()%>"><br/>
            <input type="text" name="address2" size="45" value="<%=dto.getAddress2() %>">
            </td>
            <td>�ּҸ� ���� �ּ���.</td>
          </tr>
          <tr>  
            <th>����</th>
            <td align="left"><select name='job'>
                    <option value="A01" <%if(dto.getJob().equals("A01")) { out.print("selected"); } %>>ȸ���</option>
                    <option value="A03" <%if(dto.getJob().equals("A03")) { out.print("selected"); } %>>���������</option>
                    <option value="A05" <%if(dto.getJob().equals("A05")) { out.print("selected"); } %>>����������</option>
                    <option value="A07" <%if(dto.getJob().equals("A07")) { out.print("selected"); } %>>�����б��л�</option>
                    <option value="A09" <%if(dto.getJob().equals("A09")) { out.print("selected"); } %>>�Ϲ��ڿ���</option>
                    <option value="A11" <%if(dto.getJob().equals("A11")) { out.print("selected"); } %>>������</option>
                    <option value="A13" <%if(dto.getJob().equals("A13")) { out.print("selected"); } %>>�Ƿ���</option>
                    <option value="A15" <%if(dto.getJob().equals("A15")) { out.print("selected"); } %>>������</option>
                    <option value="A17" <%if(dto.getJob().equals("A17")) { out.print("selected"); } %>>����.���/������</option>
                    <option value="A19" <%if(dto.getJob().equals("A19")) { out.print("selected"); } %>>��/��/����/������</option>
                    <option value="A21" <%if(dto.getJob().equals("A21")) { out.print("selected"); } %>>�ֺ�</option>
                    <option value="A23" <%if(dto.getJob().equals("A23")) { out.print("selected"); } %>>����</option>
                    <option value="A99" <%if(dto.getJob().equals("A99")) { out.print("selected"); } %>>��Ÿ</option>
                  </select>
             </td>		             
            <td>������ ���� �ϼ���.</td>
        </tr>
        <tr> 
            <th>ȸ�����</th>
            <td align="left"><select name='mlevel'>
                    <option value="A" <%if(dto.getMlevel().equals("A")) { out.print("selected"); } %>>A</option>
                    <option value="B" <%if(dto.getMlevel().equals("B")) { out.print("selected"); } %>>B</option>
                    <option value="C" <%if(dto.getMlevel().equals("C")) { out.print("selected"); } %>>C</option>
                    <option value="D" <%if(dto.getMlevel().equals("D")) { out.print("selected"); } %>>D</option>
                    <option value="E" <%if(dto.getMlevel().equals("E")) { out.print("selected"); } %>>E</option>
                  </select>
              </td>
              <td>ȸ������� ���� �ϼ���
          </tr>
      </table>
    <div style="text-align: center">
        <input type="button" value="��������" onclick="javascript:inputCheck(this.form)" > 
        <input type="reset" value="�ٽþ���">
    </div>
	</form>
	</div>
	
	<%		 
		}
	%>
	<script type="text/javascript">
	function zipCheck() {
		var zipwin=window.open("../../member/zipCheckForm.jsp", "winzip", "width=400, height=450");
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
			winemail=window.open("../../member/emailCheckProc.jsp?email="+email, "emailwin", "width=310, height=110");		
	}  //emailCheck() end
	
	function inputCheck(frm) {
		//ȸ������ �����ϱ� �� ��ȿ�� �˻�
		
		if(passwd!="")
		{
			var passwd=frm.passwd.value;
			passwd=passwd.replace(/^\s+|\s+$/g,"");
			var repasswd=frm.repasswd.value;
			repasswd=repasswd.replace(/^\s+|\s+$/g,"");
				
			if(passwd!=repasswd)
			{
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
				return;
			}  //��й�ȣ�� ��й�ȣ Ȯ�� ��ġ �˻�
		}
			
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
		
</body>
</html>