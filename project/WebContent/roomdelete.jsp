<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>


<%
	String errorMsg = null;
	int result = 0;

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	String droomid=request.getParameter("roomid");
	request.setCharacterEncoding("utf-8");

	int roomid = 0;

	try {
		roomid = Integer.parseInt(request.getParameter("roomid"));
	} catch (Exception e) {}
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("DELETE FROM rooms WHERE roomid=?");
		stmt.setInt(1,  roomid);
		
		result=stmt.executeUpdate();
		
		if(result!=0){
	
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("DELETE FROM wish WHERE roomid=?");
			stmt.setString(1, droomid);
			
			result=stmt.executeUpdate();
			
		}
	
	} finally {

		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}

	 		
	 	
	 			response.sendRedirect("index.jsp");
	 	
			
			
			%>