<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<title>Project Main Window</title>

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

<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container-narrow">

		<%@ include file="share/header.jsp"%>

		<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
		String dbUser = "bnb";
		String dbPassword = "bnbun";
		
		List<String> errorMsgs = new ArrayList<String>();	
		
		
		int roomid =0;
		String userid="";
		String roomname = "" ; // 방이름 
		String location = ""; // 대학별 위치
		int distance = 0; // 도보거리 기준 
		String stringdistance="";
		String type = "" ; // 자취하숙등 타입
		String kind = "" ; // 원룸투룸등
		String price = "" ; // 가격
		String address = ""; // 주소
		String facility = ""; //시설
		String description = "" ; // 설명
		String photo = "" ; // 사진 	
		
		int numItems=0;
		int startnum=1;

		
		location=request.getParameter("school");	
		distance=Integer.parseInt(request.getParameter("distance"));
		kind=request.getParameter("kind");
		
try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			
			stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms WHERE location = ? and distance <= ? and kind = ? ;");			
			stmt.setString(1,location);
			stmt.setInt(2,distance);
			stmt.setString(3,kind);
			
			rs=stmt.executeQuery();			
			rs.next();
			numItems = rs.getInt(1);
			
			rs.close();
			stmt.close();

			stmt = conn.prepareStatement("SELECT * FROM rooms WHERE location = ? and distance <= ? and kind = ? " +
					"ORDER BY roomid ");
			stmt.setString(1,location);
			stmt.setInt(2,distance);
			stmt.setString(3,kind);
			rs = stmt.executeQuery();
			
			%><div class="row-fluid marketing">

			<ul class="thumbnails">

				<%while(rs.next()){		
					
				int dbroomid =rs.getInt("roomid");
				String dbuserid=rs.getString("userid");
				String dbroomname = rs.getString("name");
				String dblocation = rs.getString("location");
				int dbdistance = rs.getInt("distance");
				String dbtype =rs.getString("type");
				String dbkind =rs.getString("kind");
				String dbprice = rs.getString("price");
				String dbaddress = rs.getString("address");
				String dbfacility = rs.getString("facility");
				String dbdescription = rs.getString("description");
				String dbphoto = rs.getString("photo");			
				
				if(dblocation.equals("Seoul_Un")){
					dblocation = "서울대";
				}else if (dblocation.equals("Yonsei_Un" )){
					dblocation = "연세대";
				}else if (dblocation.equals("Myongji_Un" )){
					dblocation = "명지대";
				}else{
					dblocation = "기타";
				}
				
				if(dbtype.equals("rented room")){
					dbtype = "자취";
				}else if (type.equals("boarding house" )){
					dbtype = "하숙";
				}else{
					dbtype = "기타";
				}
				
				if(dbkind.equals("officetel")){
					dbkind = "오피스텔";
				}else if (kind.equals("one_room" )){
					dbkind = "원룸";
				}else if (kind.equals("two_room" )){
					dbkind = "투룸";
				}else{
					dbkind = "기타";
				}

				
				if(dbdistance==5){
					stringdistance = "5분 이내";
				}else if (dbdistance==10){
					stringdistance = "10분 이내";
				}else if (dbdistance==20){
					stringdistance = "20분 이내";
				}else{
					stringdistance = "30분 이내";
				}
				
			
				%>


				<li class="span3">
					<div class="thumbnails">

					<a href="show.jsp?roomid=<%=dbroomid%>">
						<img src="./upload/<%=dbphoto%>" alt="http://placehold.it/300x200"
							width="150" height="200"></a>
						<h3><%=dblocation %></h3>
						<p>
							방이름:
							<%= dbroomname %><br /> 학교에서의 거리:
							<%=stringdistance%><br /> 방 종류:
							<%=dbkind%>
						</p>

					</div>
				</li>


				<%
      }%>

			</ul>

		</div>

		<%}catch (SQLException e){
			errorMsgs.add("SQL 에러: " + e.getMessage());
		}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}		%>


		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

</body>


</html>