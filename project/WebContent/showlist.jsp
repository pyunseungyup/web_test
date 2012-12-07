<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	request.setCharacterEncoding("utf-8");	
	
	String dbcode = session.getAttribute("s_userid").toString();

	
	  
	
	String userid="";
		String name = "" ; // 방이름 
		String location = ""; // 대학별 위치
		String photo = ""; // 유저 아이디 저장
%>	









<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
   
try{
 try {
		Class.forName("com.mysql.jdbc.Driver");
	 } catch (ClassNotFoundException e) {
		e.printStackTrace();
	 }
   conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
   stmt = conn.prepareStatement("SELECT * FROM wish WHERE wishid=?");
   
	 stmt.setString(1, dbcode);
   rs = stmt.executeQuery();   
   
   %>
   <ul>
   <%
   while(rs.next()){
    	   userid=rs.getString("wishid");
    	   name=rs.getString("name");
    	   location=rs.getString("location");
    	   photo=rs.getString("photo");
    	   %>
    	  	
    	   <li class="span3" style="width: 210px">
			<div class="thumbnails">
				<a href="show.jsp">
				
				<img src="./upload/<%=photo%>" alt="http://placehold.it/300x200"
					width="150" height="200"></a>
				
				<h3><%=location%></h3>
				<p>
					방이름:<%=name%><br /> 학교에서의 거리:
					<%=location%><br /> 
				</p>
			</div>
		</li>
		<%
   }
   %>
   </ul>
   <%	
}
   finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
   %>




</body>
</html>