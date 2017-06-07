<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %> 
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- shopProc.jsp -->
	<!-- ���� ���� -->
	<%
	// javamail lib �� �ʿ��մϴ�.
	//���ϼ����� �ִ� ���� ����
	class MyAuthentication extends Authenticator {
	    PasswordAuthentication pa;
	    public MyAuthentication(){
	        pa=new PasswordAuthentication("webmaster@rogbatoni.cafe24.com", "rogbatoni1");  
	        //ex) ID:cafe24@cafe24.com PASSWD:1234
	    }
	
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	}
		
	request.setCharacterEncoding("euc-kr");	
	
	String from=request.getParameter("from");// ������ �ּ�
	String to=request.getParameter("to");  // �޴� ���
	String subject=request.getParameter("subject"); // ����
	String msgText=request.getParameter("msgText"); // ����
	msgText=msgText.replace("\n", "<BR>");
	
	Calendar cal=Calendar.getInstance();
	int year=cal.get(cal.YEAR);  //int year=cal.get(1);
	
	int month=cal.get(cal.MONTH);  //int month=cal.get(2);
	
	int date=cal.get(cal.DATE);  //int date=cal.get(5);
	
	msgText+="<br/>�ֹ���ȣ : "+year+month+date+"-001<br/>";
	msgText+="�ֹ��ݾ� : <font color='red'>55000��</font><br/>";
	msgText+="<table border='0'>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4' align='center'><font size='4'>��/��/��/��</font></td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<th>��ǰ��</th>";
	msgText+="		<th>�ܰ�</th>";
	msgText+="		<th>����</th>";
	msgText+="		<th>�ݾ�</th>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td align='center'>���</td>";
	msgText+="		<td align='center'>10000</td>";
	msgText+="		<td align='center'>5</td>";
	msgText+="		<td align='center'>50000</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td align='center'>����</td>";
	msgText+="		<td align='center'>5000</td>";
	msgText+="		<td align='center'>1</td>";
	msgText+="		<td align='center'>5000</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="</table>";
	msgText+="<br/>";
	msgText+="<img src='http://rogbatoni.cafe24.com/images/uefa.jpg'/>";

	//smtp mail server(ī��24 ���ϼ���)
	String host = "mw-002.cafe24.com";

	//���� ���� �˻�
	Properties props = new Properties();
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.auth","true");

	Authenticator auth = new MyAuthentication();
	Session sess = Session.getInstance(props, auth);

	try{
	    Message msg = new MimeMessage(sess);
	    msg.setFrom(new InternetAddress(from));// ���� ���
	    
	    // �Ѹ��Ը� ����
	    InternetAddress[] address={new InternetAddress(to)};   
	    msg.setRecipients(Message.RecipientType.TO, address);// ������
	    
	    msg.setSubject(subject); // ���� 
	    msg.setSentDate(new Date()); // ���� ��¥  

	    // ���� HTML �������� ���� ���
	    msg.setContent(msgText, "text/html;charset=euc-kr");
	    Transport.send(msg);  // ��������
	    out.print(to + "�Կ��� ������ �߼��߽��ϴ�.");
		
	}catch(MessagingException e){
		out.print(e.toString());
		out.print("�������� ����!!");
	}
	%>	
	<!-- ���� �� -->
</div>

<jsp:include page="../footer.jsp"/>
		