<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  	<link href="css/room.css" rel="stylesheet">
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
<title>Project Main</title>
</head>  

  <body>
  
  <div class="container-narrow">
  
  
  	
  	<jsp:include page="share/header.jsp"></jsp:include>
  	

<% if (session.getAttribute("userId") == null) { %>
		
		 <jsp:forward page="login.jsp"></jsp:forward>

<% } else { %>
 <h1>방 올리기</h1>
      

	<form accept-charset="UTF-8" action="#" method="post">

  <fieldset>
    
    <div class="main_title"><h3 style="padding-left: 20px">방 기본정보</h3></div>
   

    <div class = "basic_information">

        <label>인근 대학<strong style="color:red"> *</strong></label>
          
          <select name="room">
            <option value=""></option>
            <option value="Seoul_Un">서울대</option>
            <option value="Yonsei_Un">연세대</option>
            <option value="Myongji_Un">명지대</option>
            <option value="other">등등 더추가</option>
          </select>
    </div>

    <div class = "basic_information">
    <label>거리(도보 기준) <strong style="color:red"> *</strong></label>

        <input type="radio" name="location" value="one">5분 이내
        <input type="radio" name="location" value="two">10분 이내
        <input type="radio" name="location" value="three">20분 이내
        <input type="radio" name="location" value="four">30분 이내
        <input type="radio" name="location" value="five">30분 이상 
    </div>
    <div class = "basic_information">
        <label>객실 타입<strong style="color:red"> *</strong></label>
         
          <select name="room">
          <option value=""></option>
          <option value="rented room">자취</option>
          <option value="boarding house">하숙</option>
          <option value="other">기타</option>
          </select>
    </div>
    <div class = "basic_information">
        <label>객실 종류<strong style="color:red"> *</strong></label>
          <select name="room">
            <option value=""></option>
            <option value="officetel">오피스텔</option>
            <option value="one_room">원룸</option>
            <option value="two_room">투룸</option>
            <option value="two_room">기타</option>
          </select>
    </div>

    <div class = "basic_information">
        <label>가격 정보<strong style="color:red"> *</strong></label>
       
          
          <input type = "checkbox" name = "price">보증금 <input type ="text" placeholder = "가격을 입력해 주세요">만원
    </div>

   
    
    <div class="main_title"><h3 style="padding-left: 20px">방 상세정보</h3></div>
   
     <div class = "basic_information">
        <label>방 이름<strong style="color:red"> *</strong></label>
        <input type ="text" placeholder="멋진 방이름을 지어주세요" >

      </div>

     <div class = "basic_information">
        <label>주소<strong style="color:red"> *</strong></label>
      <input type ="text" placeholder="우편번호" size ="4" > - <input type ="text" placeholder="우편번호" size ="4" > <input type ="text" placeholder="나머지 주소" >
      </div>

      <div class = "basic_information">
        <label>시설</label>
				<table>
				<tr>
				<td class = "facilities_item"> <span class = "facilities"><input type="checkbox" name="room_facilities" value="tv">TV</span> </td>
				<td class = "facilities_item"> <span class = "facilities"><input type="checkbox" name="room_facilities" value="internet">인터넷</span> </td>
				<td class = "facilities_item"> <span class = "facilities"><input type="checkbox" name="room_facilities" value="gas range">가스렌지</span> </td>				
				</tr>
				
				<tr>
				<td class = "facilities_item"> <span class = "facilities"><input type="checkbox" name="room_facilities" value="air_conditioner"> 에어컨	</span> </td>
				<td class = "facilities_item"> <span class = "facilities"><input type="checkbox" name="room_facilities" value="refrigerator">냉장고	</span> </td>
				<td class = "facilities_item"> <span class = "facilities"> <input type="checkbox" name="room_facilities" value="washing_machine">세탁기</span> </td>				
				</tr>
				
				<tr>
				<td class = "facilities_item"> <span class = "facilities"><input type="checkbox" name="room_facilities" value="drying_rack">건조대</span> </td>
				<td class = "facilities_item"> <span class = "facilities"><input type="checkbox" name="room_facilities" value="parking">주차장</span></td>
				<td class = "facilities_item"> <span class = "facilities"><input type="checkbox" name="room_facilities" value="bathtub">욕조</span></td>				
				</tr>
				</table>
      </div>
      
       <div class = "basic_information">
        <label>사진 올리기</label>
        <input type = "File">
      </div>

      <div class = "basic_information">
        <label>소개</label>
        <div>
        <textarea   rows="5" placeholder = "방을 멋지게 소개 해주세요.">
        </textarea>
        </div>
      </div>

     
  


 	 <input type="submit"  value="방 등록 하기">
  </fieldset>

	</form>
<% } %>
  
  
   
		
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
