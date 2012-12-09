<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    %>
<%

	String errorMsg = null;

	

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	request.setCharacterEncoding("utf-8");
 
	int id = 0;

	try {
		id = Integer.parseInt(request.getParameter("id"));
	  System.out.println(id);
	} catch (Exception e) {}
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("DELETE FROM wish WHERE id=?");
		stmt.setInt(1,  id);
    
		stmt.executeUpdate();
	  
	} finally {
		
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}

	 		
	 	
	 			response.sendRedirect("showlist.jsp");
	 	
			
			
			%>