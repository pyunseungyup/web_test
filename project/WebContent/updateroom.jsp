<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%


	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	// 사용자 정보를 위한 변수 초기화
	
	String name = "" ; // 방이름 
	String location = ""; // 대학별 위치
	String userid = ""; // 유저 아이디 저장
	String username = "" ; // 유저 네임 저장
	int distance =0; // 도보거리 기준 
	String type = "" ; // 자취하숙등 타입
	String kind = "" ; // 원룸투룸등
	String price = "" ; // 가격
	String address = ""; // 주소
	String description = "" ; // 설명
	String lat = ""; // google 맵 위도 정보
	String lng = ""; // google 맵 경도 정보
	String deposit ="";
	int roomid = 0;
	try {
	roomid = Integer.parseInt(request.getParameter("roomid"));
	} catch (NumberFormatException e) {
		roomid = -1;
		
	}

 try {
		
	  
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		stmt = conn.prepareStatement("SELECT * FROM rooms WHERE roomid =?");
		stmt.setInt(1, roomid);
		rs = stmt.executeQuery();
		if (rs.next()) {
		location =rs.getString("location");
		name = rs.getString("name");
		distance = rs.getInt("distance");
		type = rs.getString("type");
		kind = rs.getString("kind");
		price = rs.getString("price");
		address = rs.getString("address");
		description = rs.getString("description");
		lat = rs.getString("lat");
		lng = rs.getString("lng");
		String photo = rs.getString("photo"); // 파일의 url
		String facility = rs.getString("facility");
		deposit = rs.getString("deposit");
		}
	}finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
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
			center : new google.maps.LatLng(-33.8688, 151.2195),
			zoom : 8,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions);

		var input = document.getElementById('searchTextField');
		var autocomplete = new google.maps.places.Autocomplete(input);

		autocomplete.bindTo('bounds', map);

		var infowindow = new google.maps.InfoWindow();
		var marker = new google.maps.Marker({
			map : map
		});

		google.maps.event
				.addListener(
						autocomplete,
						'place_changed',
						function() {
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
								map.setZoom(8); // Why 17? Because it looks good.

							}
							var image = new google.maps.MarkerImage(place.icon,
									new google.maps.Size(71, 71),
									new google.maps.Point(0, 0),
									new google.maps.Point(17, 34),
									new google.maps.Size(35, 35));
							marker.setIcon(image);
							marker.setPosition(place.geometry.location);

							var address = '';
							if (place.address_components) {
								address = [
										(place.address_components[0]
												&& place.address_components[0].short_name || ''),
										(place.address_components[1]
												&& place.address_components[1].short_name || ''),
										(place.address_components[2]
												&& place.address_components[2].short_name || '') ]
										.join(' ');
							}

							infowindow.setContent('<div><strong>' + place.name
									+ '</strong><br>' + address);
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


	

		<form action="roomDBupdate.jsp" method="post"
			enctype="multipart/form-data">

			<fieldset>

				<div class="main_title">
					<h3 style="padding-left: 20px; margin-top: 50px">방기본정보</h3>
				</div>


				<div class="basic_information">

						<label>인근 대학<strong style="color: red"> *</strong></label> <select
						name="location">
						<option value=""></option>
						<option value="seoul">서울대</option>
						<option value="kaist">카이스트</option>
						<option value="pohang">포항공대</option>
						<option value="yonsei">연세대</option>
						<option value="koryo">고려대</option>
						<option value="seogang">서강대</option>
						<option value="seonggyun">성균관대</option>
						<option value="hanyang">한양대</option>
						<option value="foreign">한국외국어대</option>
						<option value="ehwa">이화여대</option>
						<option value="sirip">서울시립대</option>
						<option value="jungang">중앙대</option>
						<option value="kyunghye">경희대</option>
						<option value="busan">부산대</option>
						<option value="gyungbuk">경북대</option>
						<option value="inha">인하대</option>
						<option value="aju">아주대</option>
						<option value="gundae">건국대</option>
						<option value="dongkuc">동국대</option>
						<option value="hongdae">홍익대</option>
						<option value="junnam">전남대</option>
						<option value="kyowon">한국교원대</option>
						<option value="sucdae">숙명여대</option>
						<option value="kucmin">국민대</option>
						<option value="sungsil">숭실대</option>
						<option value="dandae">단국대</option>
						<option value="hangong">한국항공대</option>
						<option value="sejong">세종대</option>
						<option value="gwangun">광운대</option>
						<option value="chungnam">충남대</option>
						<option value="kadae">가톨릭대</option>
						<option value="myungji">명지대</option>
						<option value="sanmyung">상명대</option>
						<option value="chungbuk">충북대</option>					
						<option value="jungbuk">전북대</option>
						<option value="sungsin">성신여대</option>
						<option value="handong">한동대</option>
						<option value="seosan">서울산업대</option>
						<option value="yesul">한국예술종합대</option>
						<option value="ducsung">덕성여대</option>
						<option value="ulsan">울산대</option>
						<option value="haeyang">한국해양대</option>
						<option value="kangwon">강원대</option>
						<option value="incheon">인천대</option>
						<option value="dongduc">동덕여대</option>
						<option value="seoulyeo">서울여대</option>
						<option value="bukyung">부경대</option>
						<option value="yeongnam">영남대</option>					
						<option value="jaeju">제주대</option>
						<option value="kyungsang">경상대</option>
						<option value="josun">조선대</option>
						<option value="donga">동아대</option>
						<option value="gongju">공주대</option>
						<option value="hanbac">한밭대</option>
						<option value="gisul">한국기술교육대</option>
						<option value="kyunggi">경기대</option>
						<option value="hansung">한성대</option>
						<option value="kyungwon">경원대</option>					
						<option value="hangyung">한경대</option>
						<option value="seogyung">서경대</option>
						<option value="other">기타</option>
					</select>
				</div>

				<div class="basic_information">
					<label>거리(도보 기준) <strong style="color: red"> *</strong></label> 
				
					<input type="radio" name="distance" value="5">5분 이내 <input
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

				
								<%
								if(!deposit.equals("")){	
								%>
							<td><input type="button" id="price-btn" value="보증금 여부">
							<input style="display:none" type="text" id='price_'  placeholder="보증금 입력해 주세요" name ="deposit"  value = "<%=deposit %>"></td>
							
							<%} %>
					
							
							<td id="price_add"></td>
							<td><input type="text" name="price" value ="<%=price %>"
								placeholder="가격을 입력해 주세요">만원</td>
						</tr>
					</table>
				</div>

				<div class="main_title">
					<h3 style="padding-left: 20px">방 상세정보</h3>
				</div>

				<div class="basic_information">
					<label>방 이름<strong style="color: red"> *</strong></label> <input
						type="text" name="name" value=<%=name %>>

				</div>

				<div class="basic_information">
					<label>주소<strong style="color: red"> *</strong></label>
					<div id="container">
						<input id="searchTextField" name="address" value="<%=address%>" style="width: 80%;"
							title="목적지를 입력해주세요." />
						<div id="map_canvas"></div>

					</div>
				</div>

				<div class="basic_information">
					<label>시설</label>
					<table>
						<tr>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility " value="tv">TV</span></td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility " value="internet">인터넷</span></td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility " value="gas range">가스렌지</span>
							</td>
						</tr>

						<tr>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility " value="air_conditioner">
									에어컨 </span></td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility " value="refrigerator">냉장고
							</span></td>
							<td class="facilities_item"><span class="facilities">
									<input type="checkbox" name="facility " value="washing_machine">세탁기
							</span></td>
						</tr>

						<tr>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility " value="drying_rack">건조대</span>
							</td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility " value="parking">주차장</span></td>
							<td class="facilities_item"><span class="facilities"><input
									type="checkbox" name="facility " value="bathtub">욕조</span></td>
						</tr>
					</table>

				</div>
				
					

				<div class="basic_information">
				<div id='previewId'
 				style = "padding : 30px  70px;"
				 >
				</div>
					<label>사진 올리기</label> <input type="File" name="photo"  />
				</div>

				<div class="basic_information">
					<label>소개</label>
					<div>
						<textarea rows="5" name="description"  ><%=description %></textarea>
					</div>
				</div>

				
					<input type="hidden" name="lng" id="lng" value ="<%=lng%>" />
				<input type ="hidden" name="lat" id="lat" value ="<%=lat%>" />
			  	<input type ="hidden" name="roomid" id="roomid" value ="<%=roomid%>" />
			<input type="submit" class="btn btn-mini disabled" value="정보수정" />
			</fieldset>
			
		</form>




		<jsp:include page="share/footer.jsp"></jsp:include>

	</div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->


</body>

<script type="text/javascript">
       function previewImage(targetObj, previewId) {

        var preview = document.getElementById(previewId); //div id   
        var ua = window.navigator.userAgent;

        if (ua.indexOf("MSIE") > -1) {//ie일때

            targetObj.select();

            try {
                var src = document.selection.createRange().text; // get file full path 
                var ie_preview_error = document
                        .getElementById("ie_preview_error_" + previewId);

                if (ie_preview_error) {
                    preview.removeChild(ie_preview_error); //error가 있으면 delete
                }

                var img = document.getElementById(previewId); //이미지가 뿌려질 곳 

                img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                        + src + "', sizingMethod='scale')";
            } catch (e) {
                if (!document.getElementById("ie_preview_error_" + previewId)) {
                    var info = document.createElement("<p>");
                    info.id = "ie_preview_error_" + previewId;
                    info.innerHTML = "a";
                    preview.insertBefore(info, null);
                }
            }
        } else { //ie가 아닐때
            var files = targetObj.files;
            for ( var i = 0; i < files.length; i++) {

                var file = files[i];

                var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
                if (!file.type.match(imageType))
                    continue;

                var prevImg = document.getElementById("prev_" + previewId); //이전에 미리보기가 있다면 삭제
                if (prevImg) {
                    preview.removeChild(prevImg);
                }

                var img = document.createElement("img");
                img.id = "prev_" + previewId;
                img.classList.add("obj");
                img.file = file;
                img.style.width = '350px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
                img.style.height = '200px';
                
                preview.appendChild(img);

                if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                    var reader = new FileReader();
                    reader.onloadend = (function(aImg) {
                        return function(e) {
                            aImg.src = e.target.result;
                        };
                    })(img);
                    reader.readAsDataURL(file);
                } else { // safari is not supported FileReader
                    //alert('not supported FileReader');
                    if (!document.getElementById("sfr_preview_error_"
                            + previewId)) {
                        var info = document.createElement("p");
                        info.id = "sfr_preview_error_" + previewId;
                        info.innerHTML = "not supported FileReader";
                        preview.insertBefore(info, null);
                    }
                }
            }
        }
    }
</script>



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

	
	
	$(function() {
		$('select[name="location"]').val("<%=location%>");
		$('select[name="type"]').val("<%=type%>");
		$('select[name="kind"]').val("<%=kind%>");
		$("#ddl > option[name="+facility+"]").attr("selected", "true");
		
		
	
		$('input:radio[name="distance"][value=<%=distance%>]').attr('checked', true);
		$('#price').click(
				function() {
					$("tr input[type='checkbox']").each(
							function() {
								if ($(this).attr('checked')) {
									$("#tab").find("#price_add").append(
											"<tr>"
													+ $('#price_').find('tr')
															.html() + "</tr>");
								}
							});
				});
	});
	
	</script>
	
	
</html>


