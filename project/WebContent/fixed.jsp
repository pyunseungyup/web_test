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
	
	String name = "" ; // 방이름 
	String location = ""; // 대학별 위치
	String photo="";
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
		location =rs.getString("location");
		name = rs.getString("name");
		String photo = rs.getString("photo"); // 파일의 url
	}
	}finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
%>
<!DOCTYPE html>
<html lang="ko"> 

	<head>
	<meta charset="utf-8">
	<title>실습 3 - 테이블 만들기</title>
	 <link href="css/bootstrap.css " rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css " rel="stylesheet" type="text/css">
   <link href="css/main.css" rel="stylesheet">
	</head>

	<body>
		<table class="table table-bordered" style="text-align: center;width:140px;height:10px; position: fixed; top:80px; left:1000px;" >
			<tr class="success">
				<th class="info">그림</th><th>소개</th>
			</tr>
			<tr>
				<td rowspan="2"><img src="<%=photo%>" class="img-rounded"></td>
				<td><%=name %></td>
			</tr>
			<tr class="success">
				<td>방이름</td>
		    </tr>
		    			<tr>
				<th>그림</th><th>소개</th>
			<tr class="success">
			<tr>
				<td rowspan="2"><img src="..." class="img-rounded"></td>
				<td>대학명</td>
			</tr>
			<tr>	
				<td>방이름</td>
		    </tr>
			
						<tr>
				<th>그림</th><th>소개</th>
			</tr>
			<tr>
				<td rowspan="2"><img src="..." class="img-rounded"></td>
				<td>대학명</td>
			</tr>
			<tr>	
				<td>방이름</td>
		    </tr>
			
			
		</table>
	</body>

</html>
