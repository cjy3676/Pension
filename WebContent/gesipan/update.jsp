<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 게시판 수정 부분 -->
<%@ page import="java.sql.*"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();
	
	// 수정하고자 하는 레코트의 id값 가져오기
	String id = request.getParameter("id");
	// 쿼리 작성
	String sql = "select * from gesipan where id="+id;
	// ResultSet에 가져오기
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>		
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
	background: gray;
	float: left;
}

#section #right #list_name {
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
}

a {
	color: #000000;
	text-decoration: none;
}
</style>
<script>
function check() { // 혈액형 4개의 radio중에 하나만 체크를 한다(DB에 있는 내용)
    // DB에 있는 값 1은 A, 2은 B, 3는 O, 4은 AB이여서 값에 -1한다
    // blood[n] => n: 0은 A, 1은 B, 2는 O, 3은 AB
    b=<%=rs.getInt("blood")%>;
    document.body.blood[b].checked=true;
    
    // DB에 있는 값 => 1은 낚시, 2는 독서, 3은 게임, 4는 노래, 5는 영화, 6은 운동
    // hobby[n]
     var num = "<%=rs.getString("hobby")%>";
     var h = num.split(",");
     for(i=0; i<h.length-1; i++) {
    	 document.body.hobby[h[i]].checked=true;
     }
    // DB에 있는 태어난해 => option태그의 순서로 변환 => 2020-태어난해 => index값과 일치
    /*
    y=2020-<%=rs.getString("birth")%>;
    document.body.birth.selectedIndex=y;
    */
    document.body.birth.value=<%=rs.getString("birth")%>;
}
</script>
<body onload="check()">
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
		<div id=gang>게시판</div>
		<form name=body method=post action=update_ok.jsp>
		<input type=hidden name=id value=<%=id%>>
		<table width=800>
		<caption><h3>글쓰기</h3></caption>
		<tr>
		<td>제목</td>
		<td><input type=text name=title value="<%=rs.getString("title")%>"></td>
		</tr>
		<tr>
		<td>작성자</td>
		<td><%=rs.getString("name")%></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input type=password name=pwd></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><textarea cols=40 rows=6 name=content><%=rs.getString("content")%></textarea>
		</td>
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
		for(int i=2019;i<=1900;i--)
		{
		%>
		<option value=<%=i %>><%=i %></option>
		<%
		}
		%>
		</select></td>
		</tr>
		<tr>
		<td colspan=2 align=center><input type=submit value=수정하기></td>
		</tr>
		</table>
		</form>
	    </div>
	</div>
	</body>
<%@ include file="../bottom.jsp"%>