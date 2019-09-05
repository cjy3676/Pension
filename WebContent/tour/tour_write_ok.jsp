<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.sql.*"%> 
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>  
<%
    String path = "C:/Users/alfo1-5/eclipse-workspace2/Pension/WebContent/img";
    int max = 1024*1024*10;
    MultipartRequest multi = new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy()); 
    
    String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	
    // 파일과 입력값 읽어오기
    String name = multi.getParameter("name");
    String title = multi.getParameter("title");
    String content = multi.getParameter("content");
    String fname = multi.getFilesystemName("fname");
    Date today = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String writeday = sdf.format(today);
    
    // 쿼리 작성
    String sql = "insert into tour(name,title,content,fname,writeday) values(?,?,?,?,?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, name);
    pstmt.setString(2, title);
    pstmt.setString(3, content);
    pstmt.setString(4, fname);
    pstmt.setString(5, writeday);
    pstmt.executeUpdate();
    
    response.sendRedirect("tour_list.jsp");
    
    pstmt.close();
    conn.close();
%> 