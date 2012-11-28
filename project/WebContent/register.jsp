<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    import="org.apache.commons.lang3.StringUtils"%>
<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String pwd_confirm = request.getParameter("pwd_confirm");
	String name = request.getParameter("name");
	String phonenumber = request.getParameter("phonenumber");
	
	//List<String> errorMsgs = new ArrayList<String>(); // 일단 에러 x 

	int result = 0;

		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO users(userid, pwd, name, phonenumber) " +
					"VALUES(?, ?, ?, ?)"
					);
			stmt.setString(1,  userid);
			stmt.setString(2,  pwd);
			stmt.setString(3,  name);
			stmt.setString(4,  phonenumber);

			result = stmt.executeUpdate();
			

			if (result == 0) {
				%>
				<jsp:forward page="room.jsp"></jsp:forward>
				<%
			}else
			{
				%>
				<jsp:forward page="index.jsp"></jsp:forward>
				<%
			}
		 
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	
%>    