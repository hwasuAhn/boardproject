<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %> 
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- mailProc.jsp -->
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
	msgText="<font size=4>"+msgText+"</font>";
	
	/* msgText+="<table border='1'>";
	msgText+="<tr>";
	msgText+="		<td>�׸���ǻ�;�Ʈ�п�</td>";
	msgText+="</tr>";
	msgText+="</table>"; */

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
		