<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시판 내용 삭제 부분 -->	
<%@ page import="java.sql.*"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();

	// 삭제하고지 하는 레코드의 id,pwd를 읽어오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// 방금입력 pwd 와 DB에 있는 비밀번호가 비교를 하기위해 DB를 읽어오기
	String sql = "select * from gesipan where id="+id;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	// 입력된 비번과 DB에 있는 비번을 확인 후 작업
	if(pwd.equals(rs.getString("pwd"))) { // 비밀번호가 맞을 때
		sql="delete from gesipan where id="+id;
	    stmt.executeUpdate(sql);
	    response.sendRedirect("list.jsp");
	}
	else { // 비밀번호가 틀릴때
		response.sendRedirect("content.jsp?id="+id);
	}
	stmt.close();
	conn.close();
%>