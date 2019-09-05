<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>	
<%
    // 사용자가 입력한 아이디가 기존에 있는지 확인
    // DB 오픈
    String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
    String bb = "root";
    String cc = "1234";
    Connection conn = DriverManager.getConnection(aa, bb, cc);
    Statement stmt = conn.createStatement();
    
    // userid 값을 가져오기
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    
    // 가져온 사용자 아이디가 member 테이블에 존재하는 지를 여부 쿼리
    String sql = "select * from member where userid='"+userid+"'";
    ResultSet rs = stmt.executeQuery(sql);
    
    if(rs.next()) { // 레코드가 있으면 true, 없으면 false    
    // 레코드가 존재하면 사용불가능한 아이디
    out.print("1");
    }
    else {    	
    // 레코드가 없으면 사용가능한 아이디
    out.print("0");
    }
%>	
