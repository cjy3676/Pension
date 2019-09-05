<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="java.io.File"%> 
<%
    String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();
	
    String id = request.getParameter("id");
    String sql = "select fname from tour where id="+id;
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    
    File f = new File("C:/Users/alfo1-5/eclipse-workspace2/Pension/WebContent/img/"+rs.getString("fname"));
    
    if(f.exists())
    	f.delete();
    sql = "delete from tour where id="+id;
    stmt.executeUpdate(sql);
    
    stmt.close();
    conn.close();
    
    response.sendRedirect("tour_list.jsp");
%> 