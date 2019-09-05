<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 게시판 작성 부분 -->		
<%@ include file="../top.jsp"%>
<style>
#section {
	width: 1200px;
	height: 600px;
	margin: auto;
}

#section #left { /* 왼쪽 메뉴 나오는 부분 */
	width: 300px;
	height: 600px;
	background: red;
	float: left;
}

#section #left li {
	width: 280px;
	height: 60px;
	list-style-type: none;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: center;
	align-item: center;
}

#section #right { /* 공지사항 리스트 나오는 부분 */
	width: 900px;
	height: 600px;
	background: #FAFAFA;
	float: left;
}

#section #right table{
	border: 1px solid black;
	margin-top: 30px;
}

#section #right td, tr{
	border: 1px solid black;
	margin: auto; 
}

/* #section #right #list_name {
	height: 60px;
	font-size: 34px;
	margin-left: 35px;
	margin_top: 20px;
}

#section #right #first td {
	height: 40px;
	border-top: 2px solid #bbb;
	border-bottom: 1px solid #bbb;
}

#section #right #second td {
	height: 30px;
	border-bottom: 1px solid #ddd;
} */

a {
	color: #000000;
	text-decoration: none;
}
</style>
<div id=section>
		<div id=left><!-- 왼쪽 메뉴(공지사항,게시판,갤러리,QnA) -->
		<ul>
		<li> 로고2 </li>
		<li><a href="../gong/gong_list.jsp"> 공지사항 </a></li>
		<li><a href="../gesipan/list.jsp"> 게시판 </a></li>
		<li> 여행후기 </li>
		<li> QnA </li>
		</ul>
		</div>
		<div id=right>
		<form method=post action=write_ok.jsp>
		<table width="600" align="center">
		<caption><h3>글쓰기</h3></caption>
		<tr>
		<td>제목</td>
		<td><input type=text name=title></td>
		</tr>
		<tr>
		<td>작성자</td>
		<td><input type=text name=name></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input type=password name=pwd></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><textarea cols=40 rows=6 name=content></textarea></td>
		</tr>
		<tr>
		<td>혈액형</td>
		<td>
		<input type=radio name=blood value=0> A형
		<input type=radio name=blood value=1> B형
		<input type=radio name=blood value=2> O형
		<input type=radio name=blood value=3> AB형
		</td>
		</tr>
		<tr>
		<td>취미</td>
		<td>
		<input type=checkbox name=hobby value=0> 낚시
		<input type=checkbox name=hobby value=1> 독서
		<input type=checkbox name=hobby value=2> 게임
		<input type=checkbox name=hobby value=3> 노래
		<input type=checkbox name=hobby value=4> 영화
		<input type=checkbox name=hobby value=5> 운동
		</td>
		</tr>
		<tr>
		<td>태어난해</td>
		<td>
		<select name=birth>
		<option> 선택 </option>
		<%
		for(int i=2019; i>=1900; i--) {
		%>
		<option value=<%=i%>><%=i%></option>
		<%
		}
		%>
		</select></td>
		</tr>
		<tr>
		<td colspan=2 align=center><input type=submit value=저장하기></td>
		</tr>
		</table>
		</form>
	    </div>
	</div>
<%@ include file="../bottom.jsp"%>