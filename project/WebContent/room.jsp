<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>


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

<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script>
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(-33.8688, 151.2195),
          zoom: 17,
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
            $("#lat").val(place.geometry.location.lat());
            $("#lng").val(place.geometry.location.lng());
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


<title>Project Main</title>
</head>

<body>

	<div class="container-narrow">



		<jsp:include page="share/header.jsp"></jsp:include>


		<% if (session.getAttribute("s_userid") == null) { 
		
		 response.sendRedirect("login.jsp");

 } else { %>


		<form action="registerroom.jsp" method="post" enctype="multipart/form-data">

			<fieldset>

				<div class="main_title">
					<h3 style="padding-left: 20px; margin-top: 50px">방기본정보</h3>
				</div>


				<div class="basic_information">

					<label>인근 대학<strong style="color: red"> *</strong></label> <select
						name="location">
						<option value=""></option>
						<option value="Seoul_Un">서울대</option>
						<option value="Yonsei_Un">연세대</option>
						<option value="Myongji_Un">명지대</option>
						<option value="other">등등 더추가</option>
					</select>
				</div>

				<div class="basic_information">
					<label>거리(도보 기준) <strong style="color: red"> *</strong></label> <input
						type="radio" name="distance" value="5">5분 이내 <input
						type="radio" name="distance" value="10">10분 이내 <input
						type="radio" name="distance" value="20">20분 이내 <input
						type="radio" name="distance" value="30">30분 이내 
			

				</div>
				<div class="basic_information">
					<label>객실 타입<strong style="color: red"> *</strong></label> <select
						name="type">
						<option value=""></option>
						<option value="rented room">자취</option>
						<option value="boarding house">하숙</option>
						<option value="other">기타</option>
					</select>
				</div>
				<div class="basic_information">
					<label>객실 종류<strong style="color: red"> *</strong></label> <select
						name="kind">
						<option value=""></option>
						<option value="officetel">오피스텔</option>
						<option value="one_room">원룸</option>
						<option value="two_room">투룸</option>
						<option value="other">기타</option>
					</select>
				</div>

				<div class="basic_information">
					<label>가격 정보<strong style="color: red"> *</strong></label>



					<table id="tab">
						<tr>
							<td><input type="button" id="price-btn" value="보증금 여부">
							<input style="display:none" type="text" id='price_'  placeholder="보증금 입력해 주세요" name ="deposit"></td>
							<td id="price_add"></td>
							<td><input type="text" name="price"
								placeholder="가격을 입력해 주세요">만원</td>
						</tr>
					</table>

				
					
				</div>



				<div class="main_title">
					<h3 style="padding-left: 20px">방 상세정보</h3>
				</div>

				<div class="basic_information">
					<label>방 이름<strong style="color: red"> *</strong></label> <input
						type="text" name="name" placeholder="멋진 방이름을 지어주세요">

				</div>

				<div class="basic_information">
					<label>주소<strong style="color: red"> *</strong></label>
					<div id="container">
						<input id="searchTextField" name="address" style="width: 80%;"
							title="목적지를 입력해주세요." />
						<div id="map_canvas"></div>

					</div>
				</div>

				<div class="basic_information">
					<label>시설</label>
					<table>
						<tr>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility" value="tv">TV</span></td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility" value="internet">인터넷</span></td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility" value="gas range">가스렌지</span>
							</td>
						</tr>

						<tr>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility" value="air_conditioner">
									에어컨 </span></td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility" value="refrigerator">냉장고
							</span></td>
							<td class="facilities_item"><span class="facilities">
									<input type="checkbox" name="facility" value="washing_machine">세탁기
							</span></td>
						</tr>

						<tr>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility" value="drying_rack">건조대</span>
							</td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility" value="parking">주차장</span></td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility" value="bathtub">욕조</span></td>
						</tr>
					</table>

				</div>

				<div class="basic_information">
					<label>사진 올리기</label> <input type="File" name="photo">
				</div>

				<div class="basic_information">
					<label>소개</label>
					<div>
						<textarea rows="5" name="description"
							placeholder="방을 멋지게 소개 해주세요."></textarea>
					</div>
				</div>

				<input type="hidden" name="lng" id="lng"/>
				<input type ="hidden" name="lat" id="lat"/>



				<input type="submit" value="방 등록 하기">
			</fieldset>
		</form>
		<% } %>




		<jsp:include page="share/footer.jsp"></jsp:include>

	</div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->


</body>
<script type="text/javascript">

$(function() {
	$("#price-btn").click(function(){
		if($("#price_").css('display')=='none')
			{
		$("#price_").toggle('show',function(){
			$("#price-btn").val("보증금 있음");
			
		});
			}else{
		$("#price_").toggle('hide',function(){
			$("#price-btn").val("보증금 없음 ");
			$("#price_").val("");
			
		});
			}
	});
});
</script>

</html>



