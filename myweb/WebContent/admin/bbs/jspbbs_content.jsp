<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="header.jsp" />
<div id="content" align="center">
	<!--  -->
	<!-- ���� ���� -->
<img src="../../images/j_board_notice_mvc.gif" /><br /> <br />

	<form>
		<table border='1' width='600' cellspacing="0" class="table">
			<tr>
				<th bgcolor="#b0e0e6" height='25' width="80" class="tabletd_d"
					colspan="4">${article.subject}</th>
			</tr>
			<tr>
				<th bgcolor="#b0e0e6" height='21' width="80" class="tabletd_d">�ۼ���</th>
				<td class="tabletd" align='left'>${article.writer}</td>
				<th bgcolor="#b0e0e6" height='21' width="80" class="tabletd_d">��ȸ��</th>
				<td class="tabletd" align='left'>${article.readcount}</td>
			</tr>
			<tr>
				<td align='left' height='100' colspan='4' class="tabletd">
					<div
						style="width: 575px; height: 240px; overflow: auto; padding: 10px; border: 0; text-align: left;"
						id="scrollbar">${content}</div>
				</td>
			</tr>
			<tr>
				<th bgcolor="#b0e0e6" height='21' width="80" class="tabletd_d">�ۼ���</th>
				<c:set var="reg" value="${article.reg_date }" />
				<c:set var="date" value="${fn:substring(reg, 0,10) }" />
				<!-- �Խñ� ��¥�� 2012-12-03 -->
				<td class="tabletd" align='left' width="200">${date}</td>
				<th bgcolor="#b0e0e6" height='21' width="80" class="tabletd_d">IIP�ּ�</th>
				<td class="tabletd" align='left'>${article.ip }</td>
			</tr>
		</table>
		<table border="0" cellpadding="10" cellspacing="0" width="600">
			<tr>
				<td colspan=4><input type="button" value="�ۼ���" class="btn"
					id="btn_update">
					<input type="button" value="�ۻ���" class="btn" id="btn_del">
					<input type="button" value="�亯" class="btn" id="btn_re">
					<input type="button" value="���" class="btn"
					onclick="document.location.href='/myweb/admin/bbs/list.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var session = '${memid}';
		$("#btn_update").click(function() {

			if (session == 'guest' || session == null) {
				alert("�α����� ���ּ���~!!");
				//location.href = "../mvc2member/loginForm.do"
				return;
			} else {
				location.href = "/myweb/admin/bbs/updateForm.do?num=${article.num}&pageNum=${pageNum}";
				return;
			}
		});

		$("#btn_del").click(function() {
			if (session == 'guest' || session == null) {
				alert("�α����� ���ּ���~!!");
				//location.href = "../mvc2member/loginForm.do"
				return;
			} else {
				location.href = "/myweb/admin/bbs/deletePro.do?num=${article.num}&pageNum=${pageNum}";
				return;
			}
		});

		$("#btn_re").click(function() {
			if (session == 'guest' || session == null) {
				alert("�α����� ���ּ���~!!");
				//location.href = "../mvc2member/loginForm.do"
				return;
			} else {
				location.href = "/myweb/admin/bbs/writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}";
				return;
			}
		});
	});
</script>


