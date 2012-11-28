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


	String name = "" ; // 방이름 
	String location = ""; // 대학별 위치
	String userid = ""; // 유저 아이디 저장
	String username = "" ; // 유저 네임 저장
	String distance = ""; // 도보거리 기준 
	String type = "" ; // 자취하숙등 타입
	String kind = "" ; // 원룸투룸등
	String price = "" ; // 가격
	String address = ""; // 주소
	String facility = ""; //시설
	String description = "" ; // 설명
	String photo = "" ; // 사진 	
  String phonenumber = ""; 
	
	
	
	location = request.getParameter("location");
	name = request.getParameter("name");
	distance = request.getParameter("distance");
	type = request.getParameter("type");
	kind = request.getParameter("kind");
	price = request.getParameter("price");
	address = request.getParameter("address");
	facility = request.getParameter("facility");
	description = request.getParameter("description");
	photo = request.getParameter("photo");
	phonenumber = request.getParameter("phonenumber");
	
	
	List<String> errorMsgs = new ArrayList<String>(); // 일단 에러 x 
	
	
	int result = 0;
		
		try {
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("SELECT userid FROM users ");
			rs= stmt.executeQuery();
			rs.next();
			userid= rs.getString("userid");	
			
			
			
			stmt = conn.prepareStatement(
					"INSERT INTO rooms(name, userid, location, distance,type,kind, price,address,facility,description,photo) " +
					"VALUES(?, ?, ?, ? , ? , ? , ? , ? , ? , ? , ?)"
					);
					
			
			stmt.setString(1,  name);
			stmt.setString(2,  userid);
			stmt.setString(3,  location);
			stmt.setString(4,  distance);
			stmt.setString(5,  type);
			stmt.setString(6,  kind);
			stmt.setString(7,  price);
			stmt.setString(8,  address);
			stmt.setString(9,  facility);
			stmt.setString(10, description);
			stmt.setString(11, photo);
			
			
		
			
			result = stmt.executeUpdate();
			
			
			
		
			if (result == 0) {
				errorMsgs.add("등록에 실패하였습니다.");
				%>
				<jsp:forward page="room.jsp"></jsp:forward>
				<%
			}else
			{
				%>
				<jsp:forward page="index.jsp"></jsp:forward>
				<%
			}
			
			
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		
	}
%>    