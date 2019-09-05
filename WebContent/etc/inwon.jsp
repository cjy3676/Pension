<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var first = 150000; // 숙박요금
var second = 0; // 추가요금
window.onload = function() { // 문서를 읽을때 function() 실행
	// 숙박은 첫번째 option태그이므로 추가해줄 필요X
	document.cjy.adult.selectedIndex = 1;
	document.getElementById("tot").innerText = "150,000";
	document.getElementById("all").innerText = "150,000";
}
function cal() { // 숙박과 인원을 계산하여 합계급액에 전달
	// 숙박일수 => 숙박일수에 따른 금액
	var d = document.cjy.day.value;
	var d_price = d*150000;
	
	// 총인원 => 총인원에 대한 금액
	var n1 = parseInt(document.cjy.adult.value);
	var n2 = eval(document.cjy.child.value);
	var n_tot = n1 + n2;
	
	if(n_tot > 6) {
		alert("바보");
		document.cjy.adult.selectedIndex = 1;
		document.cjy.child.selectedIndex = 0;
		n_tot = 2;

	}
	
		var n_add = n_tot - 2;
		if(n_add > 0)
			var n_price = n_add * 10000;
		else 
			var n_price = 0;
		
		// tot인 곳에 총 급액을 전달
		first = d_price + n_price;
		document.getElementById("all").innerText = comma(first + second);
		var tot_price = comma(d_price + n_price);
		document.getElementById("tot").innerText = tot_price; 
}
function comma(price) {
	price = price + "";
	price = price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	return price;
}
function extra_cal() {
 	if(document.cjy.ch[0].checked)
	var p1 = parseInt(document.cjy.ch[0].value);
	else
		var p1 = 0;
	
	if(document.cjy.ch[1].checked)
	var p2 = parseInt(document.cjy.ch[1].value);
	else
		var p2 = 0;
	
	if(document.cjy.ch[2].checked)
	var p3 = parseInt(document.cjy.ch[2].value);
	else
		var p3 = 0; 
/* 	for(i=0; i <=2; i++) {
		if(document.cjy.ch[i].checked)
			var p(i+1) = parseInt(document.cjy.ch[i].value);
			else
				var p(i+1) = 0;
	} */	
	second = p1+p2+p3;
	document.getElementById("all").innerText = comma(first + second);
	document.getElementById("extra").innerText = comma(p1+p2+p3);
}
</script>
</head>
<body>
<form name="cjy" align="center">
101호 기준2명 / 최대 6명 

<!-- 조건 1 : 1박 기준 가격 => 150,000원
조건 2 : 기준인원 2명 => 최대인원 6명
추가 가능 => 4명 (추가 1인당 : 10,000원) 
문서를 처음 읽을때
- 1박 금액
- 기준 인원 2명(성인 2명)-->

<select name="day" onchange="cal()">
<option value="1">1박</option>
<option value="2">2박</option>
<option value="3">3박</option>
<option value="4">4박</option>
</select>

성인
<select name="adult" onchange="cal()">
<option value="1">1명</option>
<option value="2">2명</option>
<option value="3">3명</option>
<option value="4">4명</option>
<option value="5">5명</option>
<option value="6">6명</option>
</select>

아동
<select name="child" onchange="cal()">
<option value="0">0명</option>
<option value="1">1명</option>
<option value="2">2명</option>
<option value="3">3명</option>
<option value="4">4명</option>
<option value="5">5명</option>
<option value="6">6명</option>
</select>
<p style="margin-left:400px">숙박금액 : <span id="tot"></span>원 
<hr>

<input type="checkbox" name="ch" onclick="extra_cal()" value="25000">수영장 이용 25,000원<p>
<input type="checkbox" name="ch" onclick="extra_cal()" value="30000">숯불 세트 30,000원<p>
<input type="checkbox" name="ch" onclick="extra_cal()" value="50000">바베큐 세트 50,000원<p>
<p style="margin-left:400px">추가금액 : <span id="extra">0</span>원
<hr>

<p style="margin-left:400px">총합계금액 : <span id="all"></span>원
</form>
</body>
</html>