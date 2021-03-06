<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>



<%
	

	// 현재 메뉴
	String errorMsg = null;
	int result = 0;
	
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	request.setCharacterEncoding("utf-8");


	String userid = session.getAttribute("s_userid").toString();
	

	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("DELETE FROM users WHERE userid=?");
		stmt.setString(1,  userid);
		
		 stmt.executeUpdate();
	
	} finally {
	
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}

	 		
	 		session.invalidate();
			response.sendRedirect("index.jsp");
			
			
	%>
