<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%


	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
		
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	// 사용자 정보를 위한 변수 초기화
	String dwishid="";
	String dname = "" ; // 방이름 
	String dlocation = ""; // 대학별 위치
	String dphoto = ""; // 유저 아이디 저장
	int roomid = 0;
	
	
	try {
	roomid = Integer.parseInt(request.getParameter("roomid"));
	} catch (NumberFormatException e) {
		roomid = -1;
		
	}

  try {
		
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		stmt = conn.prepareStatement("SELECT * FROM rooms WHERE roomid =?");
		stmt.setInt(1, roomid);
		rs = stmt.executeQuery();
		
		if (rs.next()) {
			dwishid=rs.getString("userid");
			dname = rs.getString("name");
			dlocation =rs.getString("location");
		  dphoto = rs.getString("photo"); 
		}
		System.out.println(dwishid);
		System.out.println(dname);
		System.out.println(dlocation);
		System.out.println(dphoto);
	
		stmt = conn.prepareStatement(
				"INSERT INTO wish(wishid,name,location,photo) " +
				"VALUES(?, ?, ?, ?)"
				);
		stmt.setString(1,  dwishid);
		stmt.setString(2,  dname);
		stmt.setString(3,  dlocation);
		stmt.setString(4,  dphoto);
		stmt.executeUpdate();
	}
 finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
	response.sendRedirect("showlist.jsp");
%>
