<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 	
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
	import="org.apache.commons.lang3.StringUtils"
%>

<%
	
	String path= getServletContext().getRealPath("./upload");


  
	int sizeLimit = 5 * 1024 * 1024 ; // 5메가까지 제한 넘어서면 예외발생
	MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, "utf-8" , new DefaultFileRenamePolicy());
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	//multi.setCharacterEncoding("euc-kr");
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	


	String name = "" ; // 방이름 
	String location = ""; // 대학별 위치
	String userid = ""; // 유저 아이디 저장
	String username = "" ; // 유저 네임 저장
	
	String distance =""; // 도보거리 기준 

	String type = "" ; // 자취하숙등 타입
	String kind = "" ; // 원룸투룸등
	String price = "" ; // 가격
	String deposit = null;
	String address = ""; // 주소
	String description = "" ; // 설명
	String lat = ""; // google 맵 위도 정보
	String lng = ""; // google 맵 경도 정보

	
  userid=session.getAttribute("s_userid").toString();
	location =multi.getParameter("location");
	name = multi.getParameter("name");
	distance = multi.getParameter("distance");
	type = multi.getParameter("type");
	kind = multi.getParameter("kind");
	price = multi.getParameter("price");
	deposit = multi.getParameter("deposit");
	address = multi.getParameter("address");
	description = multi.getParameter("description");
	lat = multi.getParameter("lat");
	lng = multi.getParameter("lng");
	String photo = multi.getParameter("photo"); // 파일의 url
	String[] facility = multi.getParameterValues("facility");
	
	String favoriteStr = StringUtils.join(facility, ",");
	/*
multi.setCharacterEncoding("euc-kr");
location= new String(multi.getParameter("location").getBytes("EUC-KR"),"UTF-8"));
name= new String(multi.getParameter("name").getBytes("EUC-KR"),"UTF-8"));
distance= new String(multi.getParameter("distance").getBytes("EUC-KR"),"UTF-8"));
type= new String(multi.getParameter("type").getBytes("EUC-KR"),"UTF-8"));
price= new String(multi.getParameter("price").getBytes("EUC-KR"),"UTF-8"));
deposit= new String(multi.getParameter("deposit").getBytes("EUC-KR"),"UTF-8"));
address= new String(multi.getParameter("address").getBytes("EUC-KR"),"UTF-8"));
description= new String(multi.getParameter("description").getBytes("EUC-KR"),"UTF-8"));
lat= new String(multi.getParameter("lat").getBytes("EUC-KR"),"UTF-8"));
lng= new String(multi.getParameter("lng").getBytes("EUC-KR"),"UTF-8"));
photo= new String(multi.getParameter("photo").getBytes("EUC-KR"),"UTF-8"));

String[] facility = multi.getParameterValues("facility");

String favoriteStr = StringUtils.join(facility, ",");
*/
	 
	 
   Enumeration formNames=multi.getFileNames();  // 폼의 이름 반환
	 String formName=(String)formNames.nextElement(); // 자료가 많을 경우엔 while 문을 사용
	 String fileName=multi.getFilesystemName(formName); // 파일의 이름 얻기
	
	 int int_distan = 0;
	int result = 0;

	List<String> errorMsgs = new ArrayList<String>(); 
	
	

	
	
	if(location.equals("not")){
		errorMsgs.add("인근 대학을 선택해 주세요.");
	}
	if(type.equals("not")){
		errorMsgs.add("Room type을 선택해 주세요.");
	}
	if(kind.equals("not")){
		errorMsgs.add("Room kind을 선택해 주세요.");
	}

	if(distance == null){
		errorMsgs.add("거리을 다시 선택해 주세요.");
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
	
	if(favoriteStr == null){
		errorMsgs.add("시설을 선택해 주세요.");
	}

	
	if(distance!=(null)){
		int_distan = Integer.parseInt(distance); 
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
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				}catch(ClassNotFoundException e){
					e.printStackTrace();
				}
			
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO rooms(userid, name, location, distance,type,kind, price,deposit,address, lat , lng ,facility , description , photo) " +
					"VALUES(?, ?, ?, ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?)"
					);
					
			
			stmt.setString(1,  userid);
			stmt.setString(2,  name);
			stmt.setString(3,  location);
			stmt.setInt(4,  int_distan);
			stmt.setString(5,  type);
			stmt.setString(6,  kind);
			stmt.setString(7,  price);
			stmt.setString(8, deposit);
			stmt.setString(9,  address);
			stmt.setString(10,  lat);
			stmt.setString(11, lng);
			stmt.setString(12, favoriteStr);
			stmt.setString(13, description);
			stmt.setString(14, fileName);
			
		
			result = stmt.executeUpdate();
			

			if (result == 0) {
				response.sendRedirect("room.jsp");
			}else
				response.sendRedirect("index.jsp");
			
			
		
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		}
		finally {
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
<link href="css/index.css" rel="stylesheet">


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




<%
}
	
	%>

</html>
