<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>탈퇴할까요?</title>
<script>
function goback() {
	history.back();  
	return false;
}
</script>
</head>
<body>
<form action="myListDelete.pro" name="f" method="post">
	<input type="hidden" value="${param.email}" name="email">
	<div class="check">
	<div class="divcenter">
		비밀번호를 입력해주세요
		<hr>
		<input type="password" name="password">
		<br><br>
		<button onclick="return goback()" class="btn-main">CANCLE</button>
		&nbsp;&nbsp;
		<button class="btn-main" onclick="submit()">OK</button>
	</div>
	</div>
</form>
</body>
</html>