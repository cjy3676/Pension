<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>	
<%
    // id_search.jsp는 아이디를 이름과 이메일을 가지고 찾는다
    // DB 오픈
    String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
    String bb = "root";
    String cc = "1234";
    Connection conn = DriverManager.getConnection(aa, bb, cc);
    Statement stmt = conn.createStatement();
    
    // 이름과 이메일을 request
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    // member 테이블에 검색(이름, 이메일) 하는 쿼리
    String sql = "select * from member where name='"+name+"' and email='"+email+"'";
    ResultSet rs = stmt.executeQuery(sql);
    
    // 존재한다면, 존재하지 않는다
    if(rs.next()) { // 레코드를 다음으로 이동 => true, false
    // 존재할경우 => 아이디를 보여준다
    out.println("<b style='color:blue'>"+rs.getString("userid")+"</b>");
    }
    else { // 아니면 경고창 출력 후 search.jsp로 이동
    out.println("<b style='color:red'>아이디가 존재하지 않습니다</b>");
    }
%>	
