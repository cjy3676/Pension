<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
 /*
   select 태그
   1. 선택된 option태그의 값을 가져오기
   2. 수정관련 => 이전에 선택된 option 태그를 보이게 하기
 */
  function sel_view() {
	   alret(document.sel.hero.value);
   }
  function check() {
	  var ch = 3;
	  document.sel.hero.value = ch;
  } 
 </script>
</head>
<body onload="check()">
  <form name=sel>
   <select name=hero onchange="sel_view()">
      <option>선택</option>
      <option>아이언맨</option>
      <option>스파이더맨</option>
      <option>토르</option>
      <option>헐크</option>
      <option>캡틴 아메리카</option>
      <option>블랙팬서</option>
   </select>
   <!-- <input type="button" onclick="sel_view()" value="확인"> -->
  </form>
</body>
</html>