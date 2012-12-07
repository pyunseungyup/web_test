<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	
	int roomid =0;
	String roomname = "" ; // 방이름 
	String location = ""; // 대학별 위치
	String userid = ""; // 유저 아이디 저장
	String username = "" ; // 유저 네임 저장
	String stringdistance="";
	int distance =0; // 도보거리 기준 
	String type = "" ; // 자취하숙등 타입
	String kind = "" ; // 원룸투룸등
	String price = "" ; // 가격
	String address = ""; // 주소

	String description = "" ; // 설명
	String photo = "" ; // 사진 	
  String phonenumber = ""; 
	
	
	
	int pageNo = 1;

	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {
	}

	int numInPage = 9; // 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; // 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;
	
	
	
	request.setCharacterEncoding("utf-8");	

%>
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
    <%@ include file="share/fixed.jsp"%>


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
						
						
					</select> <select name="distance" id="select">
						<option value="">거리</option>
						<option value="5">5분이내</option>
						<option value="10">10분이내</option>
						<option value="20">20분이내</option>
						<option value="30">30분이내</option>
						
						
					</select> <select name="kind" id="select">
						<option value="">방구조</option>
						<option value="one_room">원룸</option>
						<option value="two_room">투룸</option>
						<option value="officetel">오피스텔</option>
						<option value="other">기타</option>
					</select>
				</div>
				<input type="submit" class="btn btn-large btn-success" value="검색" />
			</form>
		</div>
		<hr>



		<%
    try {

				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}

				request.setCharacterEncoding("utf-8");

				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword); //DB 접속 
				stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms");
				rs = stmt.executeQuery();
				rs.next();
				numItems = rs.getInt(1);
				numPages = (int) Math.ceil((double) numItems
						/ (double) numInPage);
				rs.close();
				stmt.close();

				stmt = conn
						.prepareStatement("SELECT * FROM rooms ORDER BY roomid DESC LIMIT "
								+ startPos + ", " + numInPage);
				rs = stmt.executeQuery();
				
				 /*
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
			     

		        }*/%>

		<div class="row">
			<div class="span12 page-info">
				<div class="pull-left">
					Total <b><%=numItems%></b> boards
				</div>
			</div>
		</div>


		<div class="row-fluid marketing">


			<ul class="thumbnails">

				<% while(rs.next()){
       
    			roomid = rs.getInt("roomid");
					roomname = rs.getString("name");
					userid = rs.getString("userid");
				  location = rs.getString("location");
					distance = rs.getInt("distance");
					type = rs.getString("type");
					kind = rs.getString("kind");
					price = rs.getString("price");
					address = rs.getString("address");
					String facility[] = request.getParameterValues("facility");
					description = rs.getString("description");
					photo = rs.getString("photo");
			  	
					if(location.equals("kaist")){
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
       
       %>

				<li class="span3" style="width: 210px">
					<div class="thumbnails">
						<a href="show.jsp?roomid=<%=roomid%>">
						<img src="./upload/<%=photo%>" alt="http://placehold.it/300x200"
							width="150" height="200"></a>
						<h3><%=location%></h3>
						<p>
							방이름:<%=roomname%><br /> 학교에서의 거리:
							<%=stringdistance%><br /> 방 종류:
							<%=type%>
						</p>
					</div>
				</li>
				<%} %>

			</ul>


		</div>


		<div class="pagination pagination-centered">
			<ul>
				<%
					// 페이지 네비게이션을 위한 준비
						int startPageNo, endPageNo;
						int delta = 5;
						startPageNo = (pageNo <= delta) ? 1 : pageNo - delta;
						endPageNo = startPageNo + (delta * 2) + 1;

						if (endPageNo > numPages) {
							endPageNo = numPages;
						}

						// 이전 페이지로
						if (pageNo <= 1) {
				%>
				<li class="disabled"><a href="#">&laquo;</a></li>
				<%
					} else {
				%>
				<li><a href="index.jsp?page=<%=pageNo - 1%>">&laquo;</a></li>
				<%
					}

						// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
						String className = "";
						for (int i = startPageNo; i <= endPageNo; i++) {
							className = (i == pageNo) ? "active" : "";
							out.println("<li class='" + className + "'>");
							out.println("<a href='index.jsp?page=" + i + "'>" + i
									+ "</a>");
							out.println("</li>");
						}

						// 다음 페이지로
						if (pageNo >= numPages) {
				%>
				<li class="disabled"><a href="#">&raquo;</a></li>
				<%
					} else {
				%>
				<li><a href="index.jsp?page=<%=pageNo + 1%>">&raquo;</a></li>
				<%
					}
				%>
			</ul>
		</div>



		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
	<!-- /container -->

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
