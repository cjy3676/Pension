<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인페이지 윗부분 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리의 팬션</title>
<style>
html, body, h2 {
	margin: 0;
	padding: 0;
	border: 0;
}

#member, #header, #move_img, #insa, #link, #footer {
	margin: auto;
}

#member {
	width: 1200px;
	height: 50px;
	background: red;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

#member>a {
	color: black;
	text-decoration: none;
	margin-left: 20px;
	margin-right: 15px;
}

#header { /* 2층 */
	width: 1200px;
	height: 60px;
	background: orange;
}

#header #logo {
	width: 300px;
	height: 60px;
	float: left;
	display: flex;
	align-items: center;
	float: left;
	margin-left: 50px;
}

#header #menu {		
	width: 850px;
	height: 60px;
	float: right;
	display: flex;
	align-items: center;
}

#header #menu ul {
    padding-left: 20px;
    letter-spacing: -1px;
}

#header #menu li {
	list-style-type: none;
	float: left;
	font-size: 19px;
	font-weight: 900;
	margin-left: 80px;
}

#header #menu a {
	color: #000000;
	text-decoration: none;
}

#adpop {
	position: absolute;
	left: 200px;
	top: 200px;
	width: 300px;
	height: 300px;
	border: 5px solid #009688;
	border-radius: 10px 10px 10px 10px; 
	background: #2ecc71;
	text-align: center;
}

#adpop #e1 {
	text-color: skyblue;
	border-bottom: 2px solid black;
	text-align: center;
}

#adpop #e2 {
	color: #fff ;
	word-spacing: -2px;
	margin-top: 30px;
}

#adpop #e3 {
	color: #fff;
	margin-top: 30px;
	margin-bottom: 60px;
}

button,button::after {
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
  -o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
  background: none;
  border: 3px solid #fff;
  border-radius: 5px;
  color: #fff;
/*   display: flex; */
  font-size: 12px;
  font-weight: bold;
  margin: 5px auto;
  padding: 5px 10px;
  position: relative;
  text-transform: uppercase;
}

button::before, button::after {
  background: #fff;
  content: '';
  position: absolute;
  z-index: -1;
}

button:hover {
  color: #2ecc71;
}

#adpop #e5 {
/* float: left; */
margin-left: 10px;
}

#adpop #e5::after {
  height: 100%;
  left: 0;
  top: 0;
  width: 0;
}

#adpop #e5:hover:after {
  width: 100%;
}

#move_img {
	width: 1200px;
	height: 300px;
	background: yellow;
}

#insa {
	width: 1200px;
	height: 200px;
	background: green;
}

#insa #left {
	width: 340px;
	height: 200px;
	color: gray;
	float: left;
	padding-left: 15px;
	font-weight: bold;
	font-size: 30px;
	line-height: 14px;
}

#insa #left p:last-child {
	color: #9f9da0;
}

#insa #right {
	width: 840px;
	height: 200px;
	float: right;
	line-height: 7px;
	font-size: 13px;
}

#insa #right span {
	display: inline-block;
	width: 80px;
	height: 35px;
	border: 1px solid #333;
	display: flex;
	justify-content: center;
	align-items: center;
}

#insa #right span:hover {
	border-color: white;
}

#insa #right p:first-child {
	height: 30px;
}

#insa #right p:last-child {
	display: flex;
	justify-content: flex-end;
	padding-right: 30px;
}

#link {
	width: 1200px;
	height: 470px;
	background: blue;
}

#link td:first-child {
	padding-left: 0px;
}

#link td {
	padding: 12px;
}

#link img:hover {
	opacity: 0.6;
}

#footer {
	width: 1160px;
	height: 130px;
	background: #1f2330;
	color: #000000;
	line-height: 8px;
	padding-top: 20px;
	padding-left: 40px;
	font-size: 14px;
}

#footer p:last-child {
	margin-top: 30px;
}

a {
	color: #000000;
	text-decoration: none;
}
</style>
<script>
function change_form() {
	document.all.aa.innerHTML="이름 <input type=text name=name>";
	document.all.aa.innerHTML="전화번호 <input type=text name=phone>";
	document.all.aa.innerHTML="<input type=submit value=저장>";
}
</script>
</head>
<body>
	<div id=member><!-- 1층 -->
	<% 
	  if(session.getAttribute("userid")==null)
	  {
	%>
	    <a href="../member/member.jsp">회원가입</a>  
		<a href="../member/login.jsp">로그인</a> 
		<a href="">찾아오시는길</a> 
	<%
	  }
	  else
	  {	  
	%>
		<a href="pwd.check.jsp">정보수정</a>  
		<a href="../member/logout.jsp">로그아웃</a> 
		<a href="">찾아오시는길</a>
	<%
	  }
	%>
	</div>
	<div id=header><!-- 2층 -->
		<div id=logo><a href="../main/index.jsp"><img src=../img/logo.png ></a></div>
		<div id=menu>
			<ul>
			   <li>프로방스펜션</li>
			   <li>객실안내</li>
			   <li>부대시설</li>
			   <li><a href="../gong/gong_list.jsp">커뮤니티</a></li>
			   <li><a href="../reserve/reserve.jsp">예약하기</a></li>
			</ul>
		</div>
	</div>