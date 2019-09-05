<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function sung_in() { // 함수를 실행하면 imsi1에 있는 남자, 여자 체크  
	document.imsi1.sung[0].checked="true";
	// DB값과 sung이름의 배열인덱스 
}
</script>
</head>
<body onload="sung_in()">
<!-- 체크되서 표시하는 방법 : 자바스크립트에 실행, 태그내에서 실행 -->
<!-- 공통점 : checked 속성 -->
<form name=imsi1>
성별 : <input type=radio name=sung> 남자
     <input type=radio name=sung> 여자
</form>
<p>
<hr>
<form name=imsi2>
성별 : <input type=radio name=sung> 남자
     <input type=radio name=sung> 여자
     <!--  -->
</form>
</body>
</html>