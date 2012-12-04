<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    import="org.apache.commons.lang3.StringUtils"%>
<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
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
	
	String description = "" ; // 설명
	String photo = "" ; // 사진 	
  String phonenumber = ""; 
	
	
	userid=session.getAttribute("s_userid").toString();
	location = request.getParameter("location");
	name = request.getParameter("name");
	distance = request.getParameter("distance");
	type = request.getParameter("type");
	kind = request.getParameter("kind");
	price = request.getParameter("price");
	address = request.getParameter("address");
	String facility = request.getParameterValue("facility");
	description = request.getParameter("description");
	photo = request.getParameter("photo");
	phonenumber = request.getParameter("phonenumber");
	

	int result = 0;
	
	List<String> errorMsgs = new ArrayList<String>(); 
	
	if(location == ""){
		errorMsgs.add("인근 대학을 선택해 주세요.");
	}

	if(distance == null || !(distance.equals("one") || distance.equals("two")|| distance.equals("three")|| distance.equals("four")|| distance.equals("five")) ){
		errorMsgs.add("거리을 다시 선택해 주세요.");
	}
	if(type == ""){
		errorMsgs.add("인근 대학을 선택해 주세요.");
	}
	if(kind == ""){
		errorMsgs.add("인근 대학을 선택해 주세요.");
	}
	if (price == null || price.trim().length() == 0) {
		errorMsgs.add("가격 정보를 입력해주세요.");
	}
	
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("방 이름을 입력해주세요.");
	}
	if (address == null || address.trim().length() == 0) {
		errorMsgs.add("주소를 입력해주세요.");
	}
	
	
	
	if (errorMsgs.size() == 0) {
		try {
			/*
			stmt = conn.prepareStatement("SELECT userid FROM users WHERE userid=?");
			stmt.setString(1,userid);
			rs= stmt.executeQuery();
			rs.next();
			userid= rs.getString("userid");	
			*/
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO rooms(userid, name, location, distance,type,kind, price,address,facility,description,photo) " +
					"VALUES(?, ?, ?, ? , ? , ? , ? , ? , ? , ? , ?)"
					);
					
			
			stmt.setString(1,  userid);
			stmt.setString(2,  name);
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
	}else{
	%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- Fav and touch icons -->



<title>Errors</title>
</head>

<body>



<div class="container-narrow">



	<jsp:include page="share/header.jsp"></jsp:include>


	<div class="jumbotron">

			<div class="alert alert-error">
				<h3>Errors:</h3>
				<ul>
					<% for(String msg: errorMsgs) { %>
						<li><%=msg %></li>
					<% } %>
				</ul>
			</div>
	 	<div class="form-action">
	 		<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
	 	</div>
  </div>

		
	
	

	<jsp:include page="share/footer.jsp"></jsp:include>
	</div>

	<% //if (session.getAttribute("userid") == null) %>


	<% //if (session.getAttribute("userid") == null) { %>
	<% //<jsp:forward page="login.jsp"></jsp:forward> %>

	<% //} else { %>
	<%//if(request.getParameter("userid")==userid && request.getParameter("pwd")==pwd){%>
	<%//<jsp:forward page="index.jsp"></jsp:forward>
	//}%>

	<%//}%>


	<%
		/*
if (request.getMethod().equals("POST")) {
  //String id = request.getParameter("userid");
  //String pwd = request.getParameter("pwd");

  if (userid == null || pwd == null || userid.length() == 0 || pwd.length() == 0) {
	  response.sendRedirect("login.jsp");
  }
  
}
		*/
%>


	<!-- /container -->

	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>



	<%
}
	
	%>


  