<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//�α��� �������� �Ǵ�
	//���Ǻ����� ��������
	String s_id="", s_passwd="";
	if(session.getAttribute("s_id")!=null)
	{
		s_id=(String)session.getAttribute("s_id");
		s_passwd=(String)session.getAttribute("s_passwd");
	}
	else
	{
		s_id="guest";
		s_passwd="guest";
	}
%>    

<%
	//����� ���̵� ��Ű���Ͽ� ��������
	Cookie[] cookies=request.getCookies();
	String c_id="";  //c_id������ ��Ű�� ����� ���̵� ����
	
	if(cookies!=null)  //��Ű�� �����Ѵٸ�
	{
		for(int i=0; i<cookies.length; i++)
		{
			Cookie item=cookies[i];  //��Ű�� �ϳ��� ����
			if(item.getName().equals("c_id")==true)  //ã������ ������ �ִ��� �˻�
			{
				//ã���� ��Ű�� �� ����, ����� ���̵� ��������
				c_id=item.getValue();
				
			}
		}
	}
%>
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- loginForm.jsp -->
	<!-- ���� ���� -->
	<%if(s_id.equals("guest") || s_id.equals(""))
	{	
	%>
	<img src="../images/j_login.gif"><br/><br/><br/>
	<form name="loginfrm"  method="post"  action="loginProc.jsp">    
     <table align="center" border="0" cellspacing="0" cellpadding="0" width="600" height="80">
       <tr> 
         <td align="right" valign="middle" width="190px" height="20">���̵�</td>
         <td align="left" valign="middle">
             &nbsp;<input type="text" name="id" value="<%=c_id%>" style="width:160px" tabindex="1"/>
         </td>
         <td rowspan="2" width="230px" align="left">
         	<a href="javascript:loginCheck()" tabindex="3">
         	<img src="../images/bt_login.gif"  /></a>
         </td>
       </tr>
       <tr> 
         <td align="right" valign="middle" height="20">��й�ȣ</td>
         <td align="left" valign="middle">
         	&nbsp;<input type="password" name="passwd" style="width:160px" tabindex="2"> 
         </td>
       </tr>
       <tr>
          	<td>&nbsp;</td>
          	<td valign="middle" align="left" colspan="2">
          		<input type="checkbox" name="c_id"  value="SAVE" tabindex="4" <%if(c_id!=""){out.print("checked");} %>>ID ����
          		&nbsp;&nbsp;|&nbsp;&nbsp;
          		<a href="agreement.jsp"><strong>ȸ������</strong></a>
          	</td>
       </tr>
       </table>				    
	</form>
	<script type="text/javascript">
	//onload=document.loginfrm.id.focus();
	function loginCheck() {
	    //document-HTML ���� ��ü
	    var f=document.loginfrm;
	    var id=f.id.value;
		id=id.replace(/^\s+|\s+$/g,"");
	    var passwd=f.passwd.value;
		passwd=passwd.replace(/^\s+|\s+$/g,"");
	    
	    if(f.id.value=="")
	    {
	        alert("���̵� �Է����ּ���");  //���â ���
	        f.id.focus();  //Ŀ�� ����
	        return;  //ó�� ����
	    } 

	    if(f.id.value.length<4) 
	    {
	        alert("���̵�� 4���̻� �Է����ּ���");
	        f.id.focus();               
	        return;                       
	    }

	    if(f.passwd.value=="") 
	    {
	        alert("��й�ȣ�� �Է����ּ���");
	        f.passwd.focus();
	        return;
	    }

	    if (f.passwd.value.length<4)
	    {
	        alert("��й�ȣ�� 4���̻� �Է����ּ���");
	        f.passwd.focus();
	        return;
	    }

	     f.submit(); //JavaScript�� ������ ������ ���� 
 }
	</script>
	<%
		}  //�α��� �ϱ���
		else
		{
			//�α��� �ߴٸ�
	%>
		<img src="../images/j_mypage.gif"/><br/><br/><br/>
		<strong><%=s_id %></strong>�� &nbsp;&nbsp;<a href="logout.jsp">[�α׾ƿ�]</a><br/><br/>
		<a href="memberUpd.jsp?s_id=<%=s_id%>"><img src="../images/bt_membermod.gif"/></a>
		<a href="memberDel.jsp?s_id=<%=s_id%>"><img src="../images/bt_memberdel.gif"/></a>
	<%		
		}
	%>
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		