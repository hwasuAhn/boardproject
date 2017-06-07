<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>    
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!--  -->
	<!-- 본문 시작 -->
	<img src="../images/j_mypage.gif"/><br/><br/><br/>
	* 회원정보 수정 *<br/>
	<%
		String s_id=request.getParameter("s_id").trim();
		String s_passwd=request.getParameter("s_passwd").trim();
		dto.setId(s_id);
		dto.setPasswd(s_passwd);
		
		dto=mgr.updateform(dto);
		if(dto==null)
		{
	%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다")
		history.back();
	</script>
    <%
    	}
		else
		{
	%>
	 <form name="regForm" 
   	               method="post" 
	               action="memberUpdProc.jsp">

      <!-- <div style="text-align:right">* 필수 입력</div> -->
      <table  width="600" border="1" cellspacing="0" cellpadding="2"  align="center" class="table">
         <tr> 
           <th width="20%" class="tableth" align="right">아이디</th>
           <td width="57%" class="tabletd" align="left" colspan="2"> 
               <strong>&nbsp;<%=dto.getId() %></strong>
            </td>            
         </tr>
         <tr>	
            <th class="tableth" align="right">비밀번호</th>
            <td class="tabletd" align="left"><input type="password" name="passwd" size="15" value="<%=dto.getPasswd() %>" maxlength="12"> </td>
            <td class="tabletd" align="left">비밀번호를 적어주세요.</td>
          </tr>
          <tr> 
            <th class="tableth" align="right">비밀번호 확인</th>
            <td class="tabletd" align="left"><input type="password" name="repasswd" size="15" value="<%=dto.getPasswd() %>" maxlength="12"> </td>
            <td class="tabletd" align="left">비밀번호를 확인합니다.</td>
          </tr>
          <tr> 
            <th class="tableth" align="right">이름</th>
            <td class="tabletd" align="left"><input type="text" name="mname" size="15" value="<%=dto.getMname() %>" maxlength="12"> </td>
            <td class="tabletd" align="left">고객실명을 적어주세요.</td>
          </tr>
          <tr> 
            <th class="tableth" align="right">이메일</th>
            <td class="tabletd" align="left">
                <input type="text" name="email" size="27"  value="<%=dto.getEmail()%>">
                <input type="button" 
                            value="Email 중복확인" class="btn"
                            onclick="javascript:emailCheck(this.form.email.value)">
            
            </td>
            <td class="tabletd" align="left">이메일을 적어주세요.</td>
          </tr>         
          <tr>  
            <th class="tableth" align="right">전화번호</th>
            <td class="tabletd" align="left">
                <input type="text" name="tel" value="<%=dto.getTel()%>">
            </td>
            <td class="tabletd" align="left">전화번호를 적어주세요.</td>
          </tr>
          <tr>  
            <th class="tableth" align="right">우편번호</th>
            <td class="tabletd" align="left"><input type="text" name="zipcode" size="10" value="<%=dto.getZipcode() %>" readonly>
                 <input type="button" value="우편번호찾기"  class="btn"
                       onclick="javascript:zipCheck()"></td>
            <td class="tabletd" align="left">우편번호를 검색 하세요.</td>
          </tr>
          <tr>  
            <th class="tableth" align="right">주소</th>
            <td class="tabletd" align="left">
            <input type="text" name="address1" size="45" value="<%=dto.getAddress1()%>"><br/>
            <input type="text" name="address2" size="45" value="<%=dto.getAddress2() %>">
            </td>
            <td class="tabletd" align="left">주소를 적어 주세요.</td>
          </tr>
          <tr>  
            <th class="tableth" align="right">직업</th>
            <td class="tabletd" align="left"><select name='job'>
                    <option value="A01" <%if(dto.getJob().equals("A01")) { out.print("selected"); } %>>회사원</option>
                    <option value="A03" <%if(dto.getJob().equals("A03")) { out.print("selected"); } %>>전산관련직</option>
                    <option value="A05" <%if(dto.getJob().equals("A05")) { out.print("selected"); } %>>연구전문직</option>
                    <option value="A07" <%if(dto.getJob().equals("A07")) { out.print("selected"); } %>>각종학교학생</option>
                    <option value="A09" <%if(dto.getJob().equals("A09")) { out.print("selected"); } %>>일반자영업</option>
                    <option value="A11" <%if(dto.getJob().equals("A11")) { out.print("selected"); } %>>공무원</option>
                    <option value="A13" <%if(dto.getJob().equals("A13")) { out.print("selected"); } %>>의료인</option>
                    <option value="A15" <%if(dto.getJob().equals("A15")) { out.print("selected"); } %>>법조인</option>
                    <option value="A17" <%if(dto.getJob().equals("A17")) { out.print("selected"); } %>>종교.언론/예술인</option>
                    <option value="A19" <%if(dto.getJob().equals("A19")) { out.print("selected"); } %>>농/축/수산/광업인</option>
                    <option value="A21" <%if(dto.getJob().equals("A21")) { out.print("selected"); } %>>주부</option>
                    <option value="A23" <%if(dto.getJob().equals("A23")) { out.print("selected"); } %>>무직</option>
                    <option value="A99" <%if(dto.getJob().equals("A99")) { out.print("selected"); } %>>기타</option>
                  </select>
              </td>
            <td class="tabletd" align="left">직업을 선택 하세요.</td>
          </tr>
      </table>
      <br/>
    <div style="text-align: center">
        <input type="button" value="정보수정" class="btn" onclick="javascript:inputCheck(this.form)" > 
        <input type="reset" class="btn" value="다시쓰기">
        <input type="button" value="되돌아가기" onclick="javascript:location.href='loginForm.jsp'" class="btn"/>
    </div>
	</form>
	<%		 
		}
	%>
	<script type="text/javascript">
	function zipCheck() {
		var zipwin=window.open("zipCheckForm.jsp", "winzip", "width=400, height=450");
	}
	
	function emailCheck(email) {
		//이메일 중복확인
		email=email.replace(/^\s+|\s+$/g,"");
		if(email.length==0)
		{
			alert("중복확인 할 이메일을 입력해주세요");
			document.regForm.email.focus();
			return false;
		}	
		
		if (email.length>0)
		{		
			var count1=0; //@의 갯수
			var count2=0; //.의 갯수
			for( var i=0; i<=email.length; i++) {
				if(email.substring(i, i+1)=="@")
				{
					count1++;
					if((email.substring(i+1, i+2)=="@") || (email.substring(i+1, i+2)==".")) { alert("중복확인 할 이메일을 올바르게 입력해주세요"); document.regForm.email.focus(); return false;}
				}
				if(email.substring(i, i+1)==".")
				{
					count2++;
					if((email.substring(i+1, i+2)=="@") || (email.substring(i+1, i+2)==".")) { alert("중복확인 할 이메일을 올바르게 입력해주세요"); document.regForm.email.focus(); return false;}
				}
			}
			if((count1!=1) || (count2<1) || (count2>3)) { alert("이메일을 올바르게 입력해주세요"); document.regForm.email.focus(); return false;}
		}		
		
			var winemail;	
			winemail=window.open("emailCheckProc.jsp?email="+email, "emailwin", "width=310, height=110");		
	}  //emailCheck() end
	
	function inputCheck(frm) {
		//회원정보 수정하기 전 유효성 검사
		
		if(passwd!="")
		{
			var passwd=frm.passwd.value;
			passwd=passwd.replace(/^\s+|\s+$/g,"");
			var repasswd=frm.repasswd.value;
			repasswd=repasswd.replace(/^\s+|\s+$/g,"");
				
			if(passwd!=repasswd)
			{
				alert("비밀번호가 일치하지 않습니다");
				return;
			}  //비밀번호와 비밀번호 확인 일치 검사
		}
			
		var mname=frm.mname.value;
		mname=mname.replace(/^\s+|\s+$/g,"");
		if(mname.length==0)
		{
			alert("이름을 입력해주세요");
			return;
		}  //이름 검사
	
		//이메일 @와 .검사
		var email=frm.email.value;
		email=email.replace(/^\s+|\s+$/g,"");	
		if(email.length==0)
		{
			alert("이메일을 입력해주세요");
			email.focus();
			return false;
		}
		else if (email.length>0)
		{		
			var count1=0; //@의 갯수
			var count2=0; //.의 갯수
			for( var i=0; i<=email.length; i++) {
				if(email.substring(i, i+1)=="@")
				{
					count1++;
					if((email.substring(i+1, i+2)=="@") || (email.substring(i+1, i+2)==".")) { alert("이메일을 올바르게 입력해주세요"); email.focus(); return false;}
				}
				if(email.substring(i, i+1)==".")
				{
					count2++;
					if((email.substring(i+1, i+2)=="@") || (email.substring(i+1, i+2)==".")) { alert("이메일을 올바르게 입력해주세요"); email.focus(); return false;}
				}
			}
			if((count1!=1) || (count2<1) || (count2>3)) { alert("이메일을 올바르게 입력해주세요"); email.focus(); return false;}
		}
		
		var tel=frm.tel.value;
		tel=tel.replace(/^\s+|\s+$/g,"");
		if(tel.length==0)
		{
			alert("전화번호를 입력해주세요");
			return;
		}  //전화번호 검사
		
		var zipcode=frm.zipcode.value;
		zipcode=zipcode.replace(/^\s+|\s+$/g,"");
		if(zipcode.length==0)
		{
			alert("우편번호를 입력해주세요");
			return;
		}  //우편번호 검사
		
		var address1=frm.address1.value;
		address1=address1.replace(/^\s+|\s+$/g,"");
		if(address1.length==0)
		{
			alert("주소를 입력해주세요");
			return;
		}  //주소 검사
		
		var address2=frm.address2.value;
		address2=address2.replace(/^\s+|\s+$/g,"");
		if(address2.length==0)
		{
			alert("상세주소를 입력해주세요");
			return;
		}  //상세주소 검사
		
		var zipcode=frm.zipcode.value;
		zipcode=zipcode.replace(/^\s+|\s+$/g,"");
		if(zipcode.length==0)
		{
			alert("우편번호를 입력해주세요");
			return;
		}  //우편번호 검사
		
		var job=frm.job.value;
		if(job==0)
		{
			alert("직업을 선택해주세요");
			return;
		}  //직업 검사
		
		frm.submit();
	}
	</script>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		