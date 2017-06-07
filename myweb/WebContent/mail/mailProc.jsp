<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %> 
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- mailProc.jsp -->
	<!-- 본문 시작 -->
	<%
	// javamail lib 이 필요합니다.
	//메일서버에 있는 계정 지정
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
	
	String from=request.getParameter("from");// 보내는 주소
	String to=request.getParameter("to");  // 받는 사람
	String subject=request.getParameter("subject"); // 제목
	String msgText=request.getParameter("msgText"); // 내용
	msgText=msgText.replace("\n", "<BR>");
	msgText="<font size=4>"+msgText+"</font>";
	
	/* msgText+="<table border='1'>";
	msgText+="<tr>";
	msgText+="		<td>그린컴퓨터아트학원</td>";
	msgText+="</tr>";
	msgText+="</table>"; */

	//smtp mail server(카페24 메일서버)
	String host = "mw-002.cafe24.com";

	//계정 인증 검사
	Properties props = new Properties();
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.auth","true");

	Authenticator auth = new MyAuthentication();
	Session sess = Session.getInstance(props, auth);

	try{
	    Message msg = new MimeMessage(sess);
	    msg.setFrom(new InternetAddress(from));// 보낸 사람
	    
	    // 한명에게만 보냄
	    InternetAddress[] address={new InternetAddress(to)};   
	    msg.setRecipients(Message.RecipientType.TO, address);// 수령인
	    
	    msg.setSubject(subject); // 제목 
	    msg.setSentDate(new Date()); // 보낸 날짜  

	    // 글을 HTML 형식으로 보낼 경우
	    msg.setContent(msgText, "text/html;charset=euc-kr");
	    Transport.send(msg);  // 메일전송
	    out.print(to + "님에게 메일을 발송했습니다.");
		
	}catch(MessagingException e){
		out.print(e.toString());
		out.print("메일전송 실패!!");
	}
	%>	
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		