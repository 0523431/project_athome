<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
<script>
function win_upload() {
	var op = "width=400, height=150, munubar=no, top=200, left=500";
	open("${path}/member/profileForm.pro","window`s name",op);
}
function goback() {
	 history.back();  
	 return false;
}
function checkToSave() {
	if(f.password.value == "") {
		alert("��й�ȣ�� �Է��ϼ���");
		check.password.focus();
		return false;
	}
	f.submit();
}
function checkname() {
	nickname = $('#nickname').val();
	$.ajax("${page}/ajax/nickname_check.pro?nickname="+nickname, {
		success : function(msg2) {
			console.log("true / false : "+ msg2);							
			$("#check_message").text(msg2);
			//$("#check_message").css("color", "red");
		},
		error : function(e) {
				alert(e.status);
				console.log("����");
		}
	})
}
function changepass() {
	var op = "width=500, height=350, munubar=no, top=300, left=400";
	open("changePassForm.pro","",op);
	return false;
}
</script>
</head>
<body>
<form name="f" action="myListUpdate.pro" method="post">
<input type="hidden" value="${param.email}" name="email">
<input type="hidden" name="profile" value="">
<table>
	<tr>
		<th class="th-main">�г���</th>
		<td class="sub">
			<input type="text" id="nickname" name="nickname" autocomplete="off"
			 onfocus="if(this.value =='${info.nickname}') this.value='';"
			 onblur="if(this.value =='') this.value='${info.nickname}';"
			 value="${info.nickname}">
		</td>
		<td class="sub" style="text-align:left; padding-left: 0px;">
			<button class="btn-main-re" style="margin-bottom: 0px;" onclick="return checkname()">�ߺ�Ȯ��</button>
		</td>
	</tr>
	<tr>
		<th class="th-main">�̸���</th>
		<td class="sub">
			<input type="text" readonly value="${info.email} (����Ұ�)">
		</td>
	</tr>
	<tr>
		<th class="th-main">��й�ȣ</th>
		<td class="sub">
			<input type="password" name="password">
		</td>
		<td class="sub" style="text-align:left; padding-left: 0px;">
			<button class="btn-main-re" style="margin-bottom: 0px;" onclick="return changepass()">��й�ȣ����</button>
		</td>
	</tr>
	<tr>
		<th class="th-main">����</th>
		<td class="sub">
		<!-- �����ʻ��� ���-->
		<div>
			<p style="text-align: center;">
				<img src="${path}/member/profile/${info.profile}" height="150" width="150" id="profile" style="margin:center"><br><br>
				<a href="javascript:win_upload()">�������</a>
			</p>
		</div>
		</td>
	</tr>
</table>
</form>
<!-- ���� ���� -->
<br>
<div class="divcenter">
	<button class="btn-main" onclick="return goback()">cancle</button>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button class="btn-main" onclick="return checkToSave()">save</button>
</div>

</body>
</html>