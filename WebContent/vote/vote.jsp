<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method=post action=vote_ok.jsp>
<table width=400>
<caption><h3>제일 좋아는 슈퍼 히어로</h3></caption>
<tr>
<td><input type=radio name=hero value=1></td>
<td>아이언맨</td>
</tr>
<tr>
<td><input type=radio name=hero value=2></td>
<td>스파이더맨</td>
</tr>
<tr>
<td><input type=radio name=hero value=3></td>
<td>헐크</td>
</tr>
<tr>
<td><input type=radio name=hero value=4></td>
<td>토르</td>
</tr>
<tr>
<td><input type=radio name=hero value=5></td>
<td>캡틴 아메리카</td>
</tr>
<tr>
<td><input type=radio name=hero value=6></td>
<td>닥터 스트레인지</td>
</tr>
<tr>
<td><input type=radio name=hero value=7></td>
<td>블랙 팬서</td>
</tr>
<tr align=center>
<td colspan=2><input type=submit value=투표></td>
</tr>
</table>
</body>
</html>