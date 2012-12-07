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

	<div class="container-narrow">

		<%@ include file="share/header.jsp"%>
		
			<div class="jumbotron">
			
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
		System.out.println("serchdistance" + serchdistance + "distance" + distance + "kind"+ kind );
		
try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			
			
			if(!serchdistance.equals("") && distance !=0  && !kind.equals("") ){
				stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms WHERE location = ? and distance <= ? and kind =? ;");	
				stmt.setString(1,location);
				stmt.setInt(2,distance);
				stmt.setString(3,kind);
				rs = stmt.executeQuery();
			}else if(serchdistance.equals("") && distance ==0  && !kind.equals("") ){
				stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms WHERE kind = ? ;");	
				stmt.setString(1,kind);
				rs = stmt.executeQuery();
			}
			
			else if(serchdistance.equals("") && distance !=0  && !kind.equals("") ){
				stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms WHERE distance <= ? and kind = ? ;");	
				stmt.setInt(1,distance);
				stmt.setString(2,kind);
				rs = stmt.executeQuery();
			}
			
			else if(!serchdistance.equals("") && distance ==0  && kind.equals("") ){
				stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms WHERE location = ? ;");	
				stmt.setString(1,location);
				rs = stmt.executeQuery();
				
			}
			else if(!serchdistance.equals("") && distance ==0  && !kind.equals("") ){
				stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms WHERE location = ? and kind =? ;");	
				stmt.setString(1,location);
				stmt.setString(2,kind);
				rs = stmt.executeQuery();
			}
			else if(!serchdistance.equals("") && distance !=0  && kind.equals("") ){
				stmt = conn.prepareStatement("SELECT COUNT(*) FROM rooms WHERE location = ? and distance <=? ;");	
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
				
				if(dblocation.equals("Seoul_Un")){
					dblocation = "서울대";
				}else if (dblocation.equals("Yonsei_Un" )){
					dblocation = "연세대";
				}else if (dblocation.equals("Myongji_Un" )){
					dblocation = "명지대";
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