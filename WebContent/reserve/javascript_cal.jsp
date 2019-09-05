<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function cal_view() {
		// 총일수
		var mon = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		yy = "2019";
		mm = "1";
		dd = "1";
		var aday = new Date(yy, mm, dd); // 원하는 년과 월의 정보
		var yoil = aday.getDay(); // 1일의 요일

		var yy = aday.getFullYear();
		// 년도%4=>0  년도%100 =>0인거는 제외 , 년도%400 => 0
		if ((yy % 4 == 0 && yy % 100 != 0) || yy % 400 == 0)
			var chong = mon[mm] + 1; // aday.getMonth()
		else
			var chong = mon[mm]; // 총일수가 만들어진다.
	
		var date = [ "일","월", "화", "수", "목", "금", "토" ];
		cal_form = "<table width=300 border=1 cellspacing=0>";
		cal_form = cal_form + "<tr>";
		for (i = 0; i <= 6; i++) {
			cal_form = cal_form + " <td> " + date[i] + " </td>";
		}
		cal_form = cal_form + "</tr>";
		/* cal_form="<table width=300 border=1 cellspacing=0>";
		 cal_form=cal_form+"<tr>";
		 cal_form=cal_form+" <td> 일 </td>";
		 cal_form=cal_form+" <td> 월 </td>";
		 cal_form=cal_form+" <td> 화 </td>";
		 cal_form=cal_form+" <td> 수 </td>";
		 cal_form=cal_form+" <td> 목 </td>";
		 cal_form=cal_form+" <td> 금 </td>";
		 cal_form=cal_form+" <td> 토 </td>";
		 cal_form=cal_form+"</tr>";  */

		var day = 1;// 출력할 일의 변수
		// 1행의 시작
		cal_form = cal_form + "<tr>";
		for (j = 0; j < 7; j++) {
			if (yoil > j)
				cal_form = cal_form + " <td> &nbsp; </td>";
			else {
				cal_form = cal_form + " <td> " + day + " </td>"; // 일~월 출력
				day++;
			}
		}
		cal_form = cal_form + "</tr>";
		// 1행의 끝
		// 2행의 시작
		cal_form = cal_form + "<tr>";
		for (j = 0; j < 7; j++) {
			cal_form = cal_form + " <td> " + day + " </td>"; // 일~월 출력
			day++;
		}
		cal_form = cal_form + "</tr>";
		// 2행의 끝
		// 3행의 시작
		cal_form = cal_form + "<tr>";
		for (j = 0; j < 7; j++) {
			cal_form = cal_form + " <td> " + day + " </td>"; // 일~월 출력
			day++;
		}
		cal_form = cal_form + "</tr>";
		// 3행의 끝
		// 4행의 시작
		cal_form = cal_form + "<tr>";
		for (j = 0; j < 7; j++) {
			cal_form = cal_form + " <td> " + day + " </td>"; // 일~월 출력
			day++;
		}
		cal_form = cal_form + "</tr>";
		// 4행의 끝

		// 5행의 시작
		cal_form = cal_form + "<tr>";
		for (j = 0; j < 7; j++) {
			if (chong < day)
				cal_form = cal_form + " <td> &nbsp; </td>";
			else {
				cal_form = cal_form + " <td> " + day + " </td>"; // 일~월 출력
				day++;
			}
		}
		cal_form = cal_form + "</tr>";
		// 5행의 끝

		cjy.innerHTML = cal_form;
	}
</script>
</head>
<body>
    <input type="button" onclick="cal_view()" value="달력보기">
    <div id="cjy"></div>
 </body>
</html>


















</body>
</html>