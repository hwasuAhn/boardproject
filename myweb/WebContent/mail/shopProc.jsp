<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %> 
    
<jsp:include page="../main.jsp"/>
	
<div id="content" align="center">
	<!-- shopProc.jsp -->
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
	
	Calendar cal=Calendar.getInstance();
	int year=cal.get(cal.YEAR);  //int year=cal.get(1);
	
	int month=cal.get(cal.MONTH);  //int month=cal.get(2);
	
	int date=cal.get(cal.DATE);  //int date=cal.get(5);
	
	msgText+="<br/>주문번호 : "+year+month+date+"-001<br/>";
	msgText+="주문금액 : <font color='red'>55000원</font><br/>";
	msgText+="<table border='0'>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4' align='center'><font size='4'>주/문/내/역</font></td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<th>상품명</th>";
	msgText+="		<th>단가</th>";
	msgText+="		<th>수량</th>";
	msgText+="		<th>금액</th>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td align='center'>사과</td>";
	msgText+="		<td align='center'>10000</td>";
	msgText+="		<td align='center'>5</td>";
	msgText+="		<td align='center'>50000</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td colspan='4'>-----------------------------------</td>";
	msgText+="</tr>";
	msgText+="<tr>";
	msgText+="		<td align='center'>수박</td>";
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
		