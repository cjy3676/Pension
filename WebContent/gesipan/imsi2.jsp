<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
function sel() {
	var y = "2018"
	var n = 2020 - y;
	document.imsi.year.selectedIndex=n;
	// selectedIndex 값은 0부터 시작된다  
}
</script>
</head>
<body onload="sel()">
	<!-- select태그에 원하는 option태그가 나타내기 -->
	<form name=imsi>
		태어난 해 <select name=year>
			<option>선택</option>
			<option>2019</option>
			<option>2018</option>
			<option>2017</option>
			<option>2016</option>
			<option>2015</option>
			<option>2014</option>
			<option>2013</option>
			<option>2012</option>
		</select>
	</form>
</body>
</html>