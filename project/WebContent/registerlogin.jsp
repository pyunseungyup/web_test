<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>


<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	String userid =request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String dbpwd="";
	String dbname = "";
	
	request.setCharacterEncoding("utf-8");
	
	List<String> errorMsgs = new ArrayList<String>();
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		stmt = conn.prepareStatement("SELECT userid,pwd,name FROM users WHERE userid = ?");
		stmt.setString(1, userid);
		rs= stmt.executeQuery();
		rs.next();
		
		dbpwd=rs.getString("pwd");
		dbname=rs.getString("name");		
		
		if(dbpwd.equals(pwd)){
			session.setAttribute("s_userid", userid);	
			session.setAttribute("s_name", dbname);
	
	 		
	%>
		  <jsp:forward page="index.jsp"></jsp:forward>
	<%}else{%>
		  <jsp:forward page="login.jsp"></jsp:forward>
	<%}
		
		
		
		}catch (SQLException e){
			errorMsgs.add("SQL 에러: " + e.getMessage());
		}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		%>

