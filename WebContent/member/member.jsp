<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 회원가입 부분 -->	
<%@ include file="../top.jsp"%>
<style>
#image {
	width: 1200px;
	height: 305px;
	margin: auto;
}

#section {
	width: 1200px;
	height: 400px;
	margin: auto;
}

#section input[type=text] { /* input의 type=text인것 */
	width: 200px;
	height: 30px;
	border: 1px solid #202124;
}

#section input[type=password] { /* input의 type=password인것 */
	width: 200px;
	height: 30px;
	border: 1px solid #202124;
}

#section input[type=submit] { /* input의 type=submit인것 */
	width: 200px;
	height: 40px;
	border: 1px solid #FF3061;
	background: #FF3061;
	color: #FFF;
}

#section input[type=button] { /* input의 type=button인것 */
	width: 80px;
	height: 30px;
	border: 1px solid #FF3061;
	background: #FF3061;
	color: #FFF;
	margin-left: 10px;
}
#section td {
	width: 170px;
	height: 40px;
	font-size: 16px;
	font-weight: 900;
}

#section tr:last-child { /* tr태그중에 마지막 tr태그 */
	height: 60px;
}
</style>
<script>
	function check(form) {
		if (form.userid.value == "") {
			alert("아이디를 입력하세요");
			form.userid.focus();
			return false;
		} 
		else if (form.name.valuse == "") {
			alert("이름을 입력하세요");
			form.name.focus();
			return false;
		} 
		else if (form.pwd1.value == "") {
			alert("비밀번호를 입력하세요");
			form.pwd1.focus();
			return false;
		} 
		else if (form.pwd1.value != form.pwd2.value) {
			alert("비밀번호가 틀립니다");
			form.pwd1.value = "";
			form.pwd1.value = "";
			form.pwd1.focus();
			return false;
		} 
		else if (form.email.value == "") {
			alert("이메일을 입력하세요");
			form.email.focus();
			return false;
		} 
		else
			return true;
	    }
	
	var uid = new XMLHttpRequest();
	function userid_check(ppp) {
		userid = encodeURIComponent(ppp.userid.value);

		url = "userid_check.jsp?userid="+userid;
		uid.open("get",url);
		uid.send();
	}
	uid.onreadystatechange = function() {
		if(uid.readyState == 4) { // send()보낸 문서에서 응답완료
		    document.getElementById("tr1").style.display = "block";
		    var idk = document.getElementById("id_chk");
			if(uid.responseText.trim() == "1") {
				idk.innerHTML = "<b style='color:red'> 존재하는 아이디 입니다.</b>";
			}
			else {
				idk.innerHTML = "<b style='color:blue'> 사용가능한 아이디 입니다.</b>";
			}
		}	
	}
	
	function pwd_check(ppp) { // 두개의 비밀번호가 같은지 검사
		var p1 = ppp.pwd1.value; // 첫번째 비밀번호
		var p2 = ppp.pwd2.value; // 두번째 비밀번호
		
	    if(p1 == p2) {
	    	pwd_memo.innerHTML = "<b style='color:blue'> 비밀번호가 일치합니다.</b>";
	    }
	    else {
	    	pwd_memo.innerHTML = "<b style='color:red'> 비밀번호가 일치하지 않습니다.</b>";
	    }
	}
</script>
<div id=section>
	<form method=post action=member_ok.jsp onsubmit="return check(this)">
		<table align=center>
			<caption><h1>회원가입</h1></caption>
			<tr>
				<td>아이디</td>
				<td><input type=text name=userid></td>
				<td><input type="button" onclick="userid_check(this.form)" value="중복확인"></td>
			</tr>
			<tr id="tr1" style="display:none;">
			    <td colspan="3" style="height:10px;"><span id="id_chk"></span></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type=text name=name></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name=pwd1></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name=pwd2 onblur="pwd_check(this.form)"></td>
				<td><span id="pwd_memo"></span></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type=text name=email></td>
			</tr>
			<tr>
				<td colspan=2 align=center><input type=submit value=회원가입>
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>

