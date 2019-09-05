<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 부분 -->
<%@ include file="../top.jsp"%>
<style>
#section {
	width: 1200px;
	/* height: 450px; */
	height: auto;
	margin: auto;
	margin-bottom: 20px;
}

#section div {
	text-align: center;
}

#section div:nth-child(1) {
	/* id가 section 태그내의 div태그 */
	font-size: 30px;
	margin-top: 15px;
	margin-bottom: 5px;
}

#section div:nth-child(2) {
	font-size: 270px;
	height: 30px;
	border-top: 1px solid black;
	margin: auto;
}

#section div:nth-child(3) {
	font-size: 12px;
	text-align: left;
	margin-left: 47px;
	margin-bottom: 5px;
}

#section div:nth-child(5) {
	font-size: 12px;
	text-align: left;
	margin-left: 47px;
	margin-bottom: 5px;
}

#section div:nth-child(6) span {
	font-size: 12px;
	color: #ff1616;
}

#section div:nth-child(8) {
	font-size: 12px;
	text-align: left;
	margin-left: 15px;
	width: 350px;
	height: 80px;
}

#section div:nth-child(10) {
	font-size: 12px;
	margin-top: 25px;
	margin-bottom: 5px;
}

#section input[type=text] {
	/* input태그중에 type=text인거 */
	width: 270px;
	height: 27px;
	margin-bottom: 5px;
}

#section input[type=password] {
	/* input태그중에 type=password인거 */
	width: 270px;
	height: 27px;
	margin-bottom: 5px;
}

#section input[type=submit] {
	/* input태그중에 type=password인거 */
	width: 274px;
	height: 31px;
	background: #3c95d5;
	border: 3px solid #2d81c9;
	color: #fff;
}

#section input[type=button] {
	/* input태그중에 type=button인거 */
	width: 150px;
	height: 31px;
}

#section #b1 {
	background: #4b545e;
	border: 1px solid #3b3c3f;
	color: #fff;
}

#section #b2 {
	background: #FAFAFA;
	border: 1px solid #ccc;
	color: #000000;
}

#section #form {
	width: 370px;
	/* height: 420px; */
	height: auto; border : 1px solid #ccc;
	margin: auto;
	border: 1px solid #ccc;
}

#form a {
	color: #000000;
	text-decoration: none;
}
</style>
<script>
function search() { // => 호출되면 search.jsp로 이동
	location = "search.jsp";
}

function member() { // => 호출되면 member.jsp로 이동
	location = "member.jsp";
}
</script>
<div id=image>
	<img src=>
</div>
<div id=section>
	<!-- 아이디와 비밀번호를 입력 폼 -->
	<div id=form>
		<form method=post action=login_ok.jsp>
			<div>로그인</div>
			<div></div>
			<div>회원아이디</div>
			<div>
				<input type=text name=userid>
			</div>
			<div>비밀번호</div>
			<div>
				<input type=password name=pwd><br>
				<%
				if(request.getParameter("err") != null)
				{
				%>
				<span id=error>아이디를 또는 비밀번호를 잘못 입력하셨습니다.</span>
				<%
				}
				%>
			</div>
			<div>
				<input type=submit value=로그인>
			</div>
			<div>
				<p>회원로그인 안내
				<p>회원아이디 및 비밀번호가 기억 안나실 때는 아이디/비밀번호 찾기를 이용하십시오. 아직 회원이 아니시라면
					회원으로 가입 후 이용해 주십시오.
			</div>
			<div>
				<input type=button onclick="search()" id=b1 value="아이디 비밀번호 찾기"> 
				<input type=button onclick="member()" id=b2 value="회원 가입">
			</div>
			<div><a href=../main/index.jsp>메인으로 돌아가기</a></div>
		</form>
	</div>
	<!-- 사각형을 만들 div태그 종료 -->
</div>
<%@ include file="../bottom.jsp"%>