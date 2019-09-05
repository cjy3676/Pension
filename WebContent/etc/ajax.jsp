<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// AJAX는 비동기방식으로 서버에 접근하여 동작
var xml = XMLHttpRequest();
function imsi() {
	xml.open("post","test.jsp"); // 전송방식과 호출할 문서
	xml.send(); // 전송단계
}
xml.onreadystatechange = function() {
	if(xml.readyState == 4) {
		ppp.innerHTML = ppp.innerHTML + xml.responseText;
	}
}
</script>
</head>
<body>
<input type="button" onclick="imsi()" value="click">
<div id="ppp"></div>
</body>
</html>