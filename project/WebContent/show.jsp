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
	
	// 사용자 정보를 위한 변수 초기화
	
	String roomid= "";
	String name = "" ; // 방이름 
	String location = ""; // 대학별 위치
	String userid = ""; // 유저 아이디 저장
	String username = "" ; // 유저 네임 저장
	String userphon = "";
	int distance = 0; // 도보거리 기준 
	String stringdistance = "";
	String type = "" ; // 자취하숙등 타입
	String kind = "" ; // 원룸투룸등
	String price = "" ; // 가격
	String deposit = "";
	String address = ""; // 주소
	String lat = "";
	String lng = "";
	String dbuser= "";
	String description = "" ; // 설명
	String photo = "" ; // 사진 	
  String phonenumber = ""; 
	String dbuserid = "";
  roomid = request.getParameter("roomid");
  
  if (session.getAttribute("s_userid")!=null) {
		userid = session.getAttribute("s_userid").toString();
  }


  try {
	  
	
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);	
		
		
		
		
		stmt = conn.prepareStatement("SELECT * FROM rooms WHERE roomid=?");
		stmt.setString(1, roomid);
		
		rs= stmt.executeQuery();
	
		rs.next();
		
		name = rs.getString("name");
		dbuserid = rs.getString("userid");
	  location = rs.getString("location");
		distance = rs.getInt("distance");
		type = rs.getString("type");
		kind = rs.getString("kind");
		price = rs.getString("price");
		deposit = rs.getString("deposit");
		address = rs.getString("address");
		String facility= rs.getString("facility");
		description = rs.getString("description");
		photo = rs.getString("photo");
		lat =rs.getString("lat");
		lng =rs.getString("lng");
		
		
		
		String[] facilities = facility.split(",");
  	
		if(location.equals("Seoul_Un")){
			location = "서울대";
		}else if (location.equals("Yonsei_Un" )){
			location = "연세대";
		}else if (location.equals("Myongji_Un" )){
			location = "명지대";
		}else{
			location = "기타";
		}
		
		if(type.equals("rented room")){
			type = "자취";
		}else if (type.equals("boarding house" )){
			type = "하숙";
		}else{
			type = "기타";
		}
		
		if(kind.equals("officetel")){
			kind = "오피스텔";
		}else if (kind.equals("one_room" )){
			kind = "원룸";
		}else if (kind.equals("two_room" )){
			kind = "투룸";
		}else{
			kind = "기타";
		}

		
		if(distance==5){
			stringdistance = "5분 이내";
		}else if (distance==10){
			stringdistance = "10분 이내";
		}else if (distance==20){
			stringdistance = "20분 이내";
		}else{
			stringdistance = "30분 이내";
		}
		
		
		stmt = conn.prepareStatement("SELECT * FROM users WHERE userid=?");
		stmt.setString(1, dbuserid);
		
		rs= stmt.executeQuery();
		if(rs.next()){
		username = rs.getString("name");
		userphon = rs.getString("phonenumber");
		}
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
<link href="css/showroom.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->


<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script>
      function initialize() {
        var mapOptions = {
        	center: new google.maps.LatLng(<%=lat%>, <%=lng%>),
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById('map_canvas'),
          mapOptions);

        var input = document.getElementById('searchTextField');
        var autocomplete = new google.maps.places.Autocomplete(input);

        autocomplete.bindTo('bounds', map);
        var myLatlng = new google.maps.LatLng(<%=lat%>, <%=lng%>);
        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
        	  position: myLatlng,
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


<div class="container-narrow">
		<jsp:include page="share/header.jsp"></jsp:include>


				<h2>방 상세보기</h2>
	     <div class="">


				


				<img src="./upload/<%=photo%>" width="340px" height="100px" 
					alt="http://placehold.it/300x200" style = "float : left">
		    </div>

      
				<div class="main_title">
					<h3 style="padding-left: 20px">판매자 정보</h3>
				</div>

				<div class="basic_information">
					<label>판매자 이름<strong style="color: red"> *</strong><%=username%></label>
			
				</div>
				
				<div class="basic_information">
					<label>판매자 전화번호<strong style="color: red"> *</strong><%=userphon%></label> 
				</div>

				<div class="main_title">
					<h3 style="padding-left: 20px;">방 기본정보</h3>
				</div>


				<div class="basic_information">

					<label>인근 대학<strong style="color: red"> *</strong><%=location %></label> 

				</div>

				<div class="basic_information">
					<label>거리(도보 기준) <strong style="color: red"> *</strong>	<%=stringdistance %></label> 
				</div>
				<div class="basic_information">
					<label>객실 타입<strong style="color: red"> *</strong>	<%=type %></label> 
				</div>
				<div class="basic_information">
					<label>객실 종류<strong style="color: red"> *</strong><%=kind %></label> 
						
				</div>



			
					<label>가격 정보<strong style="color: red"> *</strong></label> <span>
					<%
					if(!deposit.equals("")){
						
					%>
						
						보증금 <%=deposit%> 만원
						
						
					<%						
					}
				
					%>	
				
				<%=price %> 만원
					</span>



				



				<div class="main_title_1">
					<h3 style="padding-left: 20px">방 상세정보</h3>
				</div>

				<div class="basic_information_1">
					<label>방 이름<strong style="color: red"> *</strong>	<%=name%></label> 

				</div>

				<div class="basic_information_1">
					<label>주소<strong style="color: red"> *</strong><%=address%></label>
						

					<div id="container">



						<label for="searchTextField">상세 위치정보</label> <input type ="hidden"
							id="searchTextField" name="searchTextField" title="상세 위치 정보"
							style=" width: 50%;" value="<%=address%>" />


						<div id="map_canvas"
							style="height: 250px; width: 450px; margin: 0 0 0 20px"></div>



					</div>


				</div>

				<div class="basic_information">
					<label>시설  
					<%=	facility
					%>
					<%
					/*
					for (int i = 0 ; i < facilities.length ; i++){
									
						facilities[i];
					}
					*/
						
				 %></label> 

				</div>


				<div class="basic_information_1">
					<label>소개</label>
					<fieldset>
						<%=description%></fieldset>

				</div>
				
				
				



				<div style="margin : 50px 0 0 500px">
				
				<%if(dbuserid.equals(userid)){%>
				  
				  <a href="fixed.jsp?roomid=<%=roomid %>" class="btn btn-mini">wishlist</a>
				  
				  <a href="updateroom.jsp?roomid=<%=roomid %>" class="btn btn-mini">update</a>

					<a href="roomdelete.jsp?roomid=<%=roomid%>" class="btn btn-mini btn-danger" data-action="delete">delete</a>

				<%} %>
				</div>

				
						

		<jsp:include page="share/footer.jsp"></jsp:include>
</div>



	<!-- /container -->

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
