<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 확인 부분 -->
<%@ page import="java.sql.*"%>
<%
// DB 연결및 쿼리를 사용할
String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb = "root";
String cc = "1234";
Connection conn = DriverManager.getConnection(aa, bb, cc);
Statement stmt = conn.createStatement();

// 아이디,비밀번호 입력값을 가져오기
String userid = request.getParameter("userid");
String pwd = request.getParameter("pwd");

// 아이디,비밀번호를 조건으로 하는 검색쿼리문 작성
String sql = "select * from member where userid='"+userid+"'";
sql=sql+" and pwd='"+pwd+"'";

// 쿼리문을 실행해서 ResultSet로 가져오기
ResultSet rs = stmt.executeQuery(sql);

if(rs.next()) // 레코드가 있으면 true, 없으면 false
{ // 로그인에 성공하면 세션번수를 만든다
	session.setAttribute("userid",rs.getString("userid"));
    session.setAttribute("name",rs.getString("name"));
    // 세션변수 만드는 메소드 (변수명, 값)
    response.sendRedirect("../main/index.jsp");
}
else
	response.sendRedirect("login.jsp?err=1");
%>