<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function comma(price) {
	price = price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	return price;
}
var tt = comma("100000000");
alert(tt);
</script>
</head>
<body>

</body>
</html>