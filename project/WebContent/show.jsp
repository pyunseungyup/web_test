<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%


	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	// 사용자 정보를 위한 변수 초기화
	
	String roomid= "";
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
	
  roomid = request.getParameter("roomid");
	
	
	



%>
<!DOCTYPE html>
<html lang = "ko">
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
   
 		
 		<script src="js/jquery-1.8.2.min.js"></script>
	  <script src="js/bootstrap.min.js"></script>
	  
	  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	   <script>
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(-33.8688, 151.2195),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById('map_canvas'),
          mapOptions);

        var input = document.getElementById('searchTextField');
        var autocomplete = new google.maps.places.Autocomplete(input);

        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map
        });

        google.maps.event.addListener(autocomplete, 'place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          input.className = '';
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // Inform the user that the place was not found and return.
            input.className = 'notfound';
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(8);  // Why 17? Because it looks good.
          }
          var image = new google.maps.MarkerImage(
              place.icon,
              new google.maps.Size(71, 71),
              new google.maps.Point(0, 0),
              new google.maps.Point(17, 34),
              new google.maps.Size(35, 35));
          marker.setIcon(image);
          marker.setPosition(place.geometry.location);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        /*
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          google.maps.event.addDomListener(radioButton, 'click', function() {
            autocomplete.setTypes(types);
          });
        }
        */
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
<title>show</title>
</head>  

  <body>
  
  <%

  try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		stmt = conn.prepareStatement("SELECT * FROM rooms WHERE roomid=?");
		stmt.setString(1, roomid);
		
		rs= stmt.executeQuery("SELECT * FROM rooms");
	
		rs.next();
		
		name = rs.getString("name");
		userid = rs.getString("userid");
	  location = rs.getString("location");
		distance = rs.getString("distance");
		type = rs.getString("type");
		kind = rs.getString("kind");
		price = rs.getString("price");
		address = rs.getString("address");
		facility = rs.getString("facility");
		description = rs.getString("description");
		photo = rs.getString("photo");
  	
  
  %>
  
  <div class="container-narrow">
  
  
  	
 	<jsp:include page="share/header.jsp"></jsp:include>
  	
  <div class="jumbotron">
  
   <h2>상 세 보 기</h2>
   
   	<h1><%=name%></h1>

    <img src="http://placehold.it/300x200" alt="">
  
    <div class = "basic_information">
    <fieldset>
    
    <div class="main_title"><h3 style="padding-left: 20px ; margin-top: 50px ">방 기본정보</h3></div>
   

    <div class = "basic_information">

        <label>인근 대학<strong style="color:red"> *</strong></label>
        <span > <%=location %></span>  
        
    </div>

    <div class = "basic_information">
    <label>거리(도보 기준) <strong style="color:red"> *</strong></label>
        <span > <%=distance %></span>  
    </div>
    <div class = "basic_information">
        <label>객실 타입<strong style="color:red"> *</strong></label>
         
         
          <span > <%=type %></span>  
    </div>
    <div class = "basic_information">
        <label>객실 종류<strong style="color:red"> *</strong></label>
      
         <span > <%=kind %></span>  
    </div>

    <div class = "basic_information">
        <label>가격 정보<strong style="color:red"> *</strong></label>
      
      	 <span > <%=price %> 만원</span>  
          
         
    </div>

   
    
    <div class="main_title"><h3 style="padding-left: 20px">방 상세정보</h3></div>
   
     <div class = "basic_information">
        <label>방 이름<strong style="color:red"> *</strong></label>
        <span > <%=name%></span>  
					
      </div>

     <div class = "basic_information">
        <label>주소<strong style="color:red"> *</strong></label>
     <span > <%=address%></span>  
      </div>

      <div class = "basic_information">
        <label>시설</label>
				<span > <%=facility %></span>  
      </div>


      <div class = "basic_information">
        <label>소개</label>
       <span > <%=description %></span>  
     
      </div>
      </fieldset>
      
      
       <div id="container">
    <form>
      <fieldset>
        <div>
          <label for="searchTextField">검색위치</label>
          <input id="searchTextField" name="searchTextField" title="목적지를 입력해주세요."/>
        </div>
        <div id="map_canvas" style=" height: 400px; width: 600px;"></div>
       
      </fieldset>
    </form>
  </div>
      </div>
			
     
  


  
	</div> 

   
		
     <jsp:include page="share/footer.jsp"></jsp:include>
    
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->


  </body>
</html>



<%
	}finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
%>