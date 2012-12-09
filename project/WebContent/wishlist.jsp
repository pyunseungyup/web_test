<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%



	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
		
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	

	String dwishid="";
	String dname = "" ; // 방이름 
	String dlocation = ""; // 대학별 위치
	String dphoto = ""; // 유저 아이디 저장
	String droomid = "";
	
	
	try {
	droomid = request.getParameter("roomid");
	} catch (NumberFormatException e) {
	
		
	}

  try {
		
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		stmt = conn.prepareStatement("SELECT * FROM rooms WHERE roomid =?");
		stmt.setString(1, droomid);
		rs = stmt.executeQuery();
		
		if (rs.next()) {
			dwishid=rs.getString("userid");
			dname = rs.getString("name");
			dlocation =rs.getString("location");
		  dphoto = rs.getString("photo");
		  droomid = rs.getString("roomid");
		}
	
		stmt = conn.prepareStatement(
				"INSERT INTO wish(wishid,name,location,photo,roomid) " +
				"VALUES(?, ?, ?, ?, ?)"
				);
		stmt.setString(1,  dwishid);
		stmt.setString(2,  dname);
		stmt.setString(3,  dlocation);
		stmt.setString(4,  dphoto);
		stmt.setString(5,  droomid);
		
		stmt.executeUpdate();
		
	}
 finally {
		
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
	response.sendRedirect("showlist.jsp");
%>
