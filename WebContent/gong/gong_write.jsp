<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 공지사항 작성 부분 -->		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method=post action=gong_write_ok.jsp>
제목 <input type=text name=title><p>
내용<textarea name=content cols=40 rows=7></textarea><p>
<input type=submit value=저장>
</form>
</body>
</html>