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
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">

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
              <option value="5m">5분이내</option>
              <option value="10m">10분이내</option>
              <option value="20m">20분이내</option>
              <option value="30m">30분이내</option>
              <option value="30mafter">30분이상</option>
            </select>      
            <select name="money" id="select">
              <option value="money">가격대</option>
              <option value="">30만원대</option>
              <option value="">40만원대</option>
              <option value="">50만원대</option>     
              <option value="">50만원 이상</option>         
            </select>   
            <select name="roomtype" id="select">
              <option value="roomtype">방구조</option>
              <option value="">원룸</option>
              <option value="">투룸</option>
              <option value="">오피스텔</option>     
              <option value="">기타</option>         
            </select>            
      
        </div>
        <a class="btn btn-large btn-success" href="#">검색</a>             
       
      </div>

      <hr>

      <div class="row-fluid marketing">
      <%
    for(int i=1;i<5;i++){
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
		
		request.setCharacterEncoding("utf-8");
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			
			
			stmt = conn.prepareStatement("SELECT * FROM rooms WHERE id=?");
			stmt.setInt(1,i);
			
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
        <div class="span6">
          <h3><%=location %> 자취방 </h3>
          <p><%= roomname %> 
          <%=userid %>
			    <%=roomname%>
			    <%=location%>
			    <%=distance%>
			    <%=type%>
			    <%=kind%>
			    <%=price%>
			    <%=address %>
			    <%=facility %>
			    <%=description %>
			    <%=photo %>
		   	 </p>
         
        </div>       
       <%}%>
        </div>
      </div>    

      
		<jsp:include page="share/footer.jsp"></jsp:include>
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script> 
    
  </body>
  
 
</html>
