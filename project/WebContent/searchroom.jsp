<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    import="org.apache.commons.lang3.StringUtils"%>

<!DOCTYPE html>
<html lang = "ko">
<head>

  <meta charset="utf-8">
<title>Project Main Window</title>

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
	
		String userid="";
		String roomname = "" ; // 방이름 
		String location = ""; // 대학별 위치
		String distance = ""; // 도보거리 기준 
		String type = "" ; // 자취하숙등 타입
		String kind = "" ; // 원룸투룸등
		String price = "" ; // 가격
		String address = ""; // 주소
		String facility = ""; //시설
		String description = "" ; // 설명
		String photo = "" ; // 사진 	

		
		location=request.getParameter("school");
		distance=request.getParameter("distance");
		kind=request.getParameter("kind");
		
try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			
			
			stmt = conn.prepareStatement("SELECT * FROM rooms WHERE location =? AND distance=? AND kind=?");
			
			stmt.setString(1,location);
			stmt.setString(2,distance);
			stmt.setString(3,kind);

			
			rs= stmt.executeQuery();
			
			rs.next();		
			
			userid=rs.getString("userid");
			roomname = rs.getString("name");
			location = rs.getString("location");
			distance = rs.getString("distance");
			type =rs.getString("type");
			kind =rs.getString("kind");
			price = rs.getString("price");
			address = rs.getString("address");
			facility = rs.getString("facility");
			description = rs.getString("description");
			photo = rs.getString("photo");		
			
			
		}catch (SQLException e){
			errorMsgs.add("SQL 에러: " + e.getMessage());
		}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		
		
		
		
		
		%>
		
		<div class="row-fluid marketing">   
        
          <ul class="thumbnails">       
          
          
           <li class="span3">
              <div class="thumbnails">
                 
                <img src="http://placehold.it/300x200" alt="">
                  <h3><%=location %></h3>
                  <p>방이름: <%= roomname %><br/> 
			                                   학교에서의 거리: <%=distance%><br/>
			                                   방 종류: <%=kind%>
			            </p>			                         
             
              </div>
        </li>    
                  
          </ul>             
         
        </div>     
      
		
		<jsp:include page="share/footer.jsp"></jsp:include>
    </div>     <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  
  </body>
  
 
</html>