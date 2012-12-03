<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    import="org.apache.commons.lang3.StringUtils"%>
<%


	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	
	String userid ="";
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
	int roomid =0;
	
	
	
	request.setCharacterEncoding("utf-8");
	
try {
	
	Class.forName("com.mysql.jdbc.Driver");
	
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	stmt = conn.prepareStatement("SELECT * FROM rooms");
	
	rs= stmt.executeQuery();



%>
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
		
		
		
      <div class="jumbotron">
        <h2>당신이 원하는 자취방</h2>
        <h1>검색하나로!!</h1>
        
        <div class="btn-group">        
            <select name="school" id="select">
              <option value="school">학교</option>
              <option value="Seoul_Un">서울대</option>
              <option value="Yonsei_Un">연세대</option>
              <option value="Myongji_Un">명지대</option>
              <option value="other">등등 더추가</option>
            </select> 
            <select name="distance" id="select">
              <option value="distance">거리</option>
              <option value="one">5분이내</option>
              <option value="two">10분이내</option>
              <option value="three">20분이내</option>
              <option value="four">30분이내</option>
              <option value="five">30분이상</option>
            </select>      
         
            <select name="roomtype" id="select">
              <option value="roomtype">방구조</option>
              <option value="one_room">원룸</option>
              <option value="two_room">투룸</option>
              <option value="officetel">오피스텔</option>     
              <option value="other">기타</option>         
            </select>            
      
        </div>
        <a class="btn btn-large btn-success" href="searchroom.jsp">검색</a>             
       
      </div>
		
      <hr>
      
      
        <%
      while(rs.next()){
      	
			roomid=rs.getInt("roomid");
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
     

		
		%>
		
		
       <div class="row-fluid marketing">  
        
          <ul class="thumbnails">           

      
    
		    <li class="span3" style="width: 250px ; float:left;" >
              <div class="thumbnails" >
                 
                <a href = "show.jsp?roomid=<%=roomid%>"><img src="http://placehold.it/300x200" alt=""></a>
                  <h3><%=location %> 자취방 </h3>
                  <p>방이름:<%= roomname %><br/> 
			                                   학교에서의 거리: <%=distance%><br/>
			                                   방 종류: <%=type%>
			            </p>			                         
             
              </div>
        </li>    
     
            
          </ul>             
         
        </div>     
      
<%
      }
%>
      
		<jsp:include page="share/footer.jsp"></jsp:include>
    </div>     <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  
    
  </body>
  
 <%
 
}finally {
	// 무슨 일이 있어도 리소스를 제대로 종료
	if (rs != null) try{rs.close();} catch(SQLException e) {}
	if (stmt != null) try{stmt.close();} catch(SQLException e) {}
	if (conn != null) try{conn.close();} catch(SQLException e) {}
}
 %>
</html>
