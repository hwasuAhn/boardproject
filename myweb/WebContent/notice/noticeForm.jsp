<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
<jsp:include page="../bbsMain.jsp"/>
	
<div id="content" align="center">
	<!-- noticeForm.jsp -->
	<!-- 본문 시작 -->	
	<!--게시판 폼양식 -->
	<img src="../images/j_board_notice.gif"/><br/><br/>
	<form method="post" action="noticeIns.jsp">
		<table width="450" border="1" cellspacing="1" class="table" >
		<tr>
			<th height="30" width="80" class="tableth">제목</th>
			<td align="left" class="tabletd"><input type="text" name="subject" size="50" value=""></td>
		</tr>
		<tr>
			<th class="tableth">내용</th>
			<td align="left" class="tabletd"><textarea name="content" rows="10" cols="50"></textarea></td>
		</tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:450px; margin-top:10px;">
		<tr>
			<td align="left" width="20" >
			<a href="noticeList.jsp"><img src="../images/bt_list.gif"/></a>
			</td>
			<td style='text-align:center;'>	
			  <input type="submit" value="추가" class="btn">
			  <input type="reset" value="취소" class="btn">
			</td>
		</tr>
		</table>			
	</form>
	<!-- 본문 끝 -->
</div>

<jsp:include page="../footer.jsp"/>
		