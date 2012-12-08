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
<link href="css/showroom.css" rel="stylesheet">

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

	<div class="container-narrow">

		<%@ include file="share/header.jsp"%>
		
			<div class="jumbotron">
			
			<h2>당신이원하는자취방</h2>
			<h1>검색하나로!!</h1>
			
			<form action="searchroom.jsp" method="post">
				<div class="btn-group">
					<select name="school" id="select">
						<option value="">학교</option>		
						
						<!-- 대학순위별 1위~60위 sort -->
						
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
						
						
					</select>  <select name="kind" id="select">
						<option value="">방구조</option>
						<option value="one_room">원룸</option>
						<option value="two_room">투룸</option>
						<option value="officetel">오피스텔</option>
						<option value="other">기타</option>
					</select>
					
					
					<select name="distance" id="select">
						<option value="">거리</option>
						<option value="5">5분이내</option>
						<option value="10">10분이내</option>
						<option value="20">20분이내</option>
						<option value="30">30분이내</option>
						
						
					</select>
					
					
				</div>
				<input type="submit" class="btn btn-large btn-success" value="검색" />
			</form>
		</div>
		<hr>

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
	
		String serchdistance = "";	
		
		serchdistance = request.getParameter("distance");
		location=request.getParameter("school");	
		
		
		if(!serchdistance.equals("")){
		distance=Integer.parseInt(serchdistance);
		}
		
		kind=request.getParameter("kind");
		
	
		
try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			
			if(!serchdistance.equals("")){
				
			
				if(!location.equals("") && distance!=0   && !kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE location =? and distance <=? and kind =? ;");	
					stmt.setString(1,location);
					stmt.setInt(2,distance);
					stmt.setString(3,kind);
					rs = stmt.executeQuery();
				}else if(location.equals("") && distance==0  && !kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE kind =? ;");	
					stmt.setString(1,kind);
					rs = stmt.executeQuery();
				}
				
				else if(location.equals("") && distance!=0 && !kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE distance <=? and kind =? ;");	
					stmt.setInt(1,distance);
					stmt.setString(2,kind);
					rs = stmt.executeQuery();
				}
				
				else if(!location.equals("") && distance==0   && kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE location =? ;");	
					stmt.setString(1,location);
					rs = stmt.executeQuery();
					
				}
				else if(!location.equals("") && distance!=0   && !kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE location =? and kind =? ;");	
					stmt.setString(1,location);
					stmt.setString(2,kind);
					rs = stmt.executeQuery();
				}
				else if(location.equals("") && distance!=0   && kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE distance <=? ;");	
					stmt.setInt(1,distance);
				
					rs = stmt.executeQuery();
				}
				else if(!location.equals("") && distance!=0  && kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE location =? and distance <=? ;");	
					stmt.setString(1,location);
					stmt.setInt(2,distance);
					rs = stmt.executeQuery();
				}
				
				else {
				%>
					
					<h1>  검색결과가없습니다.</h1>
					<h2 > 다시검색해주세요</h2>
					
					<div class="form-action">
					<a href="index.jsp" class="btn btn-mini disabled" >뒤로 돌아가기</a>
					</div>
				<%

				stmt = conn.prepareStatement("SELECT * FROM rooms");			
				rs = stmt.executeQuery();
				}	
			}else {
		
				
				if(!location.equals("") && !kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE location =? and kind =? ;");	
					stmt.setString(1,location);
					stmt.setString(2,kind);
					rs = stmt.executeQuery();
				}else if(location.equals("") && !kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE kind =? ;");	
					stmt.setString(1,kind);
					rs = stmt.executeQuery();
				}
				
				else if(!location.equals("")  && kind.equals("") ){
					stmt = conn.prepareStatement("SELECT * FROM rooms WHERE location =? ;");	
					stmt.setString(1,location);
					rs = stmt.executeQuery();
					
				}else {
					
					%>
						
						<h1>  검색결과가없습니다.</h1>
						<h2 > 다시검색해주세요</h2>
						
						<div class="form-action">
						<a href="index.jsp" class="btn btn-mini disabled" >뒤로 돌아가기</a>
						</div>
					<%

					stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms");			
					rs = stmt.executeQuery();
					}
					
			}
		
			
			
			
			
			
			
			
		
			
			
			/*
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
			*/
			%>
			
			<div class="row-fluid marketing">
			
			<%
			
			if(location.equals("seoul")){
				location = "서울대";
			}	else if(location.equals("kaist")){
				location = "카이스트";
			}else if (location.equals("pohang" )){
				location = "포항공대";
			}else if (location.equals("yonsei" )){
				location = "연세대";
			}else if (location.equals("koryo" )){
				location = "고려대";
			}else if (location.equals("seogang" )){
				location = "서강대";
			}else if (location.equals("seonggyun" )){
				location = "성균관대";
			}else if (location.equals("hanyang" )){
				location = "한양대";
			}else if (location.equals("foreign" )){
				location = "한국외국어대";
			}else if (location.equals("ehwa" )){
				location = "이화여대";
			}else if (location.equals("sirip" )){
				location = "서울시립대";
			}else if (location.equals("jungang" )){
				location = "중앙대";
			}else if (location.equals("kyunghye" )){
				location = "경희대";
			}else if (location.equals("busan" )){
				location = "부산대";
			}else if (location.equals("gyungbuk" )){
				location = "경북대";
			}else if (location.equals("inha" )){
				location = "인하대";
			}else if (location.equals("aju" )){
				location = "아주대";
			}else if (location.equals("gundae" )){
				location = "건국대";
			}else if (location.equals("dongkuc" )){
				location = "동국대";
			}else if (location.equals("hongdae" )){
				location = "홍익대";
			}else if (location.equals("junnam" )){
				location = "전남대";
			}else if (location.equals("kyowon" )){
				location = "한국교원대";
			}else if (location.equals("sucdae" )){
				location = "숙명여대";
			}else if (location.equals("kucmin" )){
				location = "국민대";
			}else if (location.equals("sungsil" )){
				location = "숭실대";
			}else if (location.equals("dandae" )){
				location = "단국대";
			}else if (location.equals("hangong" )){
				location = "한국항공대";
			}else if (location.equals("sejong" )){
				location = "세종대";
			}else if (location.equals("gwangun" )){
				location = "광운대";
			}else if (location.equals("chungnam" )){
				location = "충남대";
			}else if (location.equals("kadae" )){
				location = "가톨릭대";
			}else if (location.equals("myungji" )){
				location = "명지대";
			}else if (location.equals("sanmyung" )){
				location = "상명대";
			}else if (location.equals("chungbuk" )){
				location = "충북대";
			}else if (location.equals("jungbuk" )){
				location = "전북대";
			}else if (location.equals("sungsin" )){
				location = "성신여대";
			}else if (location.equals("handong" )){
				location = "한동대";
			}else if (location.equals("seosan" )){
				location = "서울산업대";
			}else if (location.equals("yesul" )){
				location = "한국예술종합대";
			}else if (location.equals("ducsung" )){
				location = "덕성여대";
			}else if (location.equals("ulsan" )){
				location = "울산대";
			}else if (location.equals("haeyang" )){
				location = "한국해양대";
			}else if (location.equals("kangwon" )){
				location = "강원대";
			}else if (location.equals("incheon" )){
				location = "인천대";
			}else if (location.equals("dongduc" )){
				location = "동덕여대";
			}else if (location.equals("seoulyeo" )){
				location = "서울여대";
			}else if (location.equals("bukyung" )){
				location = "부경대";
			}else if (location.equals("yeongnam" )){
				location = "영남대";
			}else if (location.equals("jaeju" )){
				location = "제주대";
			}else if (location.equals("kyungsang" )){
				location = "경상대";
			}else if (location.equals("josun" )){
				location = "조선대";
			}else if (location.equals("donga" )){
				location = "동아대";
			}else if (location.equals("gongju" )){
				location = "공주대";
			}else if (location.equals("hanbac" )){
				location = "한밭대";
			}else if (location.equals("gisul" )){
				location = "한국기술교육대";
			}else if (location.equals("kyunggi" )){
				location = "경기대";
			}else if (location.equals("hansung" )){
				location = "한성대";
			}else if (location.equals("kyungwon" )){
				location = "경원대";
			}else if (location.equals("hangyung" )){
				location = "한경대";
			}else if (location.equals("seogyung" )){
				location = "서경대";
			}else if (location.equals("" )){
				location = "";
			}else{
				location = "기타";
			}
			
			if(kind.equals("officetel")){
				kind = "오피스텔";
			}else if (kind.equals("one_room" )){
				kind = "원룸";
			}else if (kind.equals("two_room" )){
				kind = "투룸";
			}else if (kind.equals("" )){
				kind = "";
			}else{
				kind = "기타";
			}

			
			if(distance==5){
				serchdistance = "5분 이내";
			}else if (distance==10){
				serchdistance = "10분 이내";
			}else if (distance==20){
				serchdistance = "20분 이내";
			}else if (distance==0){
				serchdistance = "";
			}else{
				serchdistance = "30분 이내";
			}
			
			%>
			
			<div>
			검색 결과 : <%=location%><%=kind%><%=serchdistance%>
			</div>

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
				
				if(dblocation.equals("seoul")){
					dblocation = "서울대";
				}	else if(dblocation.equals("kaist")){
					dblocation = "카이스트";
				}else if (dblocation.equals("pohang" )){
					dblocation = "포항공대";
				}else if (dblocation.equals("yonsei" )){
					dblocation = "연세대";
				}else if (dblocation.equals("koryo" )){
					dblocation = "고려대";
				}else if (dblocation.equals("seogang" )){
					dblocation = "서강대";
				}else if (dblocation.equals("seonggyun" )){
					dblocation = "성균관대";
				}else if (dblocation.equals("hanyang" )){
					dblocation = "한양대";
				}else if (dblocation.equals("foreign" )){
					dblocation = "한국외국어대";
				}else if (dblocation.equals("ehwa" )){
					dblocation = "이화여대";
				}else if (dblocation.equals("sirip" )){
					dblocation = "서울시립대";
				}else if (dblocation.equals("jungang" )){
					dblocation = "중앙대";
				}else if (dblocation.equals("kyunghye" )){
					dblocation = "경희대";
				}else if (dblocation.equals("busan" )){
					dblocation = "부산대";
				}else if (dblocation.equals("gyungbuk" )){
					dblocation = "경북대";
				}else if (dblocation.equals("inha" )){
					dblocation = "인하대";
				}else if (dblocation.equals("aju" )){
					dblocation = "아주대";
				}else if (dblocation.equals("gundae" )){
					dblocation = "건국대";
				}else if (dblocation.equals("dongkuc" )){
					dblocation = "동국대";
				}else if (dblocation.equals("hongdae" )){
					dblocation = "홍익대";
				}else if (dblocation.equals("junnam" )){
					dblocation = "전남대";
				}else if (dblocation.equals("kyowon" )){
					dblocation = "한국교원대";
				}else if (dblocation.equals("sucdae" )){
					dblocation = "숙명여대";
				}else if (dblocation.equals("kucmin" )){
					dblocation = "국민대";
				}else if (dblocation.equals("sungsil" )){
					dblocation = "숭실대";
				}else if (dblocation.equals("dandae" )){
					dblocation = "단국대";
				}else if (dblocation.equals("hangong" )){
					dblocation = "한국항공대";
				}else if (dblocation.equals("sejong" )){
					dblocation = "세종대";
				}else if (dblocation.equals("gwangun" )){
					dblocation = "광운대";
				}else if (dblocation.equals("chungnam" )){
					dblocation = "충남대";
				}else if (dblocation.equals("kadae" )){
					dblocation = "가톨릭대";
				}else if (dblocation.equals("myungji" )){
					dblocation = "명지대";
				}else if (dblocation.equals("sanmyung" )){
					dblocation = "상명대";
				}else if (dblocation.equals("chungbuk" )){
					dblocation = "충북대";
				}else if (dblocation.equals("jungbuk" )){
					dblocation = "전북대";
				}else if (dblocation.equals("sungsin" )){
					dblocation = "성신여대";
				}else if (dblocation.equals("handong" )){
					dblocation = "한동대";
				}else if (dblocation.equals("seosan" )){
					dblocation = "서울산업대";
				}else if (dblocation.equals("yesul" )){
					dblocation = "한국예술종합대";
				}else if (dblocation.equals("ducsung" )){
					dblocation = "덕성여대";
				}else if (dblocation.equals("ulsan" )){
					dblocation = "울산대";
				}else if (dblocation.equals("haeyang" )){
					dblocation = "한국해양대";
				}else if (dblocation.equals("kangwon" )){
					dblocation = "강원대";
				}else if (dblocation.equals("incheon" )){
					dblocation = "인천대";
				}else if (dblocation.equals("dongduc" )){
					dblocation = "동덕여대";
				}else if (dblocation.equals("seoulyeo" )){
					dblocation = "서울여대";
				}else if (dblocation.equals("bukyung" )){
					dblocation = "부경대";
				}else if (dblocation.equals("yeongnam" )){
					dblocation = "영남대";
				}else if (dblocation.equals("jaeju" )){
					dblocation = "제주대";
				}else if (dblocation.equals("kyungsang" )){
					dblocation = "경상대";
				}else if (dblocation.equals("josun" )){
					dblocation = "조선대";
				}else if (dblocation.equals("donga" )){
					dblocation = "동아대";
				}else if (dblocation.equals("gongju" )){
					dblocation = "공주대";
				}else if (dblocation.equals("hanbac" )){
					dblocation = "한밭대";
				}else if (dblocation.equals("gisul" )){
					dblocation = "한국기술교육대";
				}else if (dblocation.equals("kyunggi" )){
					dblocation = "경기대";
				}else if (dblocation.equals("hansung" )){
					dblocation = "한성대";
				}else if (dblocation.equals("kyungwon" )){
					dblocation = "경원대";
				}else if (dblocation.equals("hangyung" )){
					dblocation = "한경대";
				}else if (dblocation.equals("seogyung" )){
					dblocation = "서경대";
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
	</div>
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