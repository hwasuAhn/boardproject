<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../main.jsp"/>
<div id="content" align="center">
	<!-- 본문 시작 -->
	<img src="../images/j_board_notice_mvc.gif"/><br/><br/>
	<div id="scrollbar" style="width:620px; height:380px; overflow:auto; padding:10px; border:0; 
                             border-style:solid; border-color:'#ecedf3';"> <!-- 스크롤바 -->
	
<c:if test="${count==0}">
	<table width="700">
		<tr>
			<td>게시판에 글 없음!</td>
		</tr>
		<c:if test="${memid != 'guest' }">
		<tr>
			<td><a href="/myweb/mvc2bbs/phpwriteForm.do"><img src="../images/bt_write.gif" border="0"/></a></td>
		</tr>
		</c:if>
	</table>
</c:if>	
<c:if test="${count>0}">
	<table width="600" border="0" cellspacing="0">
		<tr align='center' height="21">
			<th bgcolor="#b0e0e6">번호</th>
			<th bgcolor="#b0e0e6">제목</th>
			<th bgcolor="#b0e0e6">작성자</th>
			<th bgcolor="#b0e0e6">조회수</th>
			<th bgcolor="#b0e0e6">작성일</th>			
		</tr>
		<c:forEach var="article" items="${articleList}">
			<c:set var="reg" value="${article.reg_date }"/>
    		<c:set var="date" value="${fn:substring(reg, 0,10) }"/> <!-- 게시글 날짜를 2012-12-03 -->
			<tr>
				<td width=50 height=25 class='tabletd'>
					<c:out value="${number }"/>
					<c:set var="number" value="${number-1}" />
				</td>
				<td width='260' align='left' class='tabletd'>
					<c:if test="${article.re_level>0}">
						<img src="images/level.gif" border="0" width="${5*article.re_level}" height="16" />
						<img src="images/re.gif">
					</c:if>
					<c:if test="${article.re_level==0}">
						<img src="images/level.gif" border="0" width="${5*article.re_level}" height="16" />
					</c:if>
					<a href="/myweb/mvc2bbs/phpcontent.do?id=${memid}&num=${article.num}&pageNum=${currentPage}">${article.subject}</a>
					<c:if test="${today == date}">
    					<img src="../images/new.gif"/>
    				</c:if>
					<c:if test="${article.readcount>=10}">
						<img src="images/hot.gif" border="0" height="16" />
					</c:if>
				</td>
				<td width='120' class='tabletd'><a href="mailto:${article.email}">${article.writer}</a></td>				
				<td width='50' class='tabletd'>${article.readcount}</td>
				<td width='120' class='tabletd'>${date}</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td height="30" colspan="2" align="left">총&nbsp;&nbsp;<font color='blue'><strong>${count}</strong></font> 개의 게시물이 있습니다</td>
				<td></td>
			    <td></td>
			    <c:if test="${memid != 'guest' }">
			    <td><a href="/myweb/mvc2bbs/phpwriteForm.do"><img src="../images/bt_write.gif" border="0"/></a></td>
			    </c:if>
			 </tr>		
			
	</table>
	<br/>
</c:if>
<c:if test="${count>0}">
	<c:set var="pageCount" value="${count/pageSize+(count%pageSize==0?0:1)}"/>
	<c:set var="startPage" value="${currentPage/pageSize+1}"/>
	<c:set var="endPage" value="${startPage+10}"/>
	<fmt:parseNumber var="startPage2" value="${startPage+(1-(startPage%1))%1 }" integerOnly="true" />
	<fmt:parseNumber var="endPage2" value="${endPage+(1-(endPage%1))%1 }" integerOnly="true" />
	
	<c:if test="${endPage>pageCount}">
		<c:set var="endPage" value="${pageCount}" />
	</c:if>
	<c:if test="${startPage>2 }">
		<a href="/myweb/mvc2bbs/phplist.do?pageNum=${startPage2-1 }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" >
		<a href="/myweb/mvc2bbs/phplist.do?pageNum=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage<pageCount}">
		
		<a href="/myweb/mvc2bbs/phplist.do?pageNum=${endPage2}">[다음]</a>
	</c:if>
</c:if>
<br/>
<!-- 
pageCount : ${pageCount }<br/>
startPage : ${startPage }<br/>
endPage : ${endPage }<br/>
pageSize : ${pageSize }<br/>
currentPage : ${currentPage }<br/>
count : ${count }<br/>
number : ${number }<br/>
endPage 올림 : ${endPage+(1-(endPage%1))%1 }<br/>
 -->
	<!-- 본문 끝 -->
	</div>
</div>

<jsp:include page="../footer.jsp"/>
		







