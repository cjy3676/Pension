<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ID, password 찾기 부분 -->
<%@ include file="../top.jsp"%>
<style>
#section {
  width:1200px;
  height:500px;
  margin:auto;
}
#section input[type=text] { /* input의 type=text인것 */
	width: 200px;
	height: 30px;
	border: 1px solid #202124;
}	
</style>
<script>
// 객체 생성
var xml1 = new XMLHttpRequest();
var xml2 = new XMLHttpRequest();

function id_search() {
	// 보낼 이름
	name = encodeURIComponent(document.id.name.value);
	// 보낼 이메일
	email = encodeURIComponent(document.id.email.value);
	url = "id_search.jsp?name="+name+"&email="+email;
	// open("전송방식",주소(url))
	xml1.open("get",url);
	// 호출
	xml1.send();
}

xml1.onreadystatechange = function() { // readyState => 0~4까지의 값이 발생
	if(xml1.readyState == 4)
		searchid.innerHTML = xml1.responseText.trim();
}

function pwd_search() {
	// 보낼 아이디
	userid = encodeURIComponent(document.pwd.userid.value);
	// 보낼 이름
	name = encodeURIComponent(document.pwd.name.value);
	// 보낼 이메일
	email = encodeURIComponent(document.pwd.email.value);
	url = "pwd_search.jsp?userid="+userid+"&name="+name+"&email="+email;
	// open("전송방식",주소(url))
	xml2.open("get",url);
	// 호출
	xml2.send();
	
}

xml2.onreadystatechange = function() { // readyState => 0~4까지의 값이 발생
	if(xml2.readyState == 4)
		searchpwd.innerHTML = xml2.responseText.trim();
}
</script>
<div id=section>
	<table align="center" width="300">
	  <caption><h3>아이디 ＊ 비밀번호 찾기</h3></caption>
	  <!-- 아이디 찾는 부분 -->
	  <form name="id" method="post" action="id_search.jsp">
	  <tr>
	    <td colspan="2">아이디 찾기  <span id="searchid"></span></td>
	  </tr>
	  <tr>
	    <td>이름</td>
	    <td><input type="text" name="name"></td>
	  </tr>
	  <tr>
	    <td>이메일</td>
	    <td><input type="text" name="email"></td>
	  </tr>
	  <tr>
	    <td colspan="2"><input type="button" onclick="id_search()" value="아이디 찾기"></td>
	  </tr>
	  </form>

	  <!-- 비밀번호 찾는 부분 -->
	  <form name="pwd" method="post" action="pwd_search.jsp">
	  <tr>
	    <td colspan="2">비밀번호 찾기  <span id="searchpwd"></span></td>
	  </tr>
	  <tr>
	    <td>아이디</td>
	    <td><input type="text" name="userid"></td>
	  </tr>
	  <tr>
	    <td>이름</td>
	    <td><input type="text" name="name"></td>
	  </tr>
	  <tr>
	    <td>이메일</td>
	    <td><input type="text" name="email"></td>
	  </tr>
	  <tr>
	    <td colspan="2"><input type="button" onclick="pwd_search()" value="비밀번호 찾기"></td>
	  </tr>
	  </form>	  	  	    
	</table>
</div>
<%@ include file="../bottom.jsp"%>