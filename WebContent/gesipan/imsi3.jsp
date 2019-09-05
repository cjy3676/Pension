<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var num = "2,4,6,";
	var he = num.split(",");
	for(i=0; i<he.length-1; i++) {
		document.imsi.hero[he[i]].checked=true;
	}
}
</script>
</head>
<body onload="check()">
<form name=imsi>
<input type="checkbox" name=hero>아이언맨<br>
<input type="checkbox" name=hero>스파이더맨<br>
<input type="checkbox" name=hero>닥터 스트레인지<br>
<input type="checkbox" name=hero>토르<br>
<input type="checkbox" name=hero>헐크<br>
<input type="checkbox" name=hero>캡틴 아메리카<br>
<input type="checkbox" name=hero>블랙팬서<br>
</form>
</body>
</html>