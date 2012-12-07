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
	request.setCharacterEncoding("utf-8");	
	
	String dbcode = session.getAttribute("s_userid").toString();

	
	  
	
	  String wishid="";
		String name = "" ; // 방이름 
		String location = ""; // 대학별 위치
		String photo = ""; // 유저 아이디 저장
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


 <%
   
try{
 try {
		Class.forName("com.mysql.jdbc.Driver");
	 } catch (ClassNotFoundException e) {
		e.printStackTrace();
	 }
   conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
   stmt = conn.prepareStatement("SELECT * FROM wish WHERE wishid=?");
   
	 stmt.setString(1, dbcode);
   rs = stmt.executeQuery();   
   
   %>
   <ul>

  
   <%
   while(rs.next()){
    	  
	       wishid=rs.getString("wishid");
    	   name=rs.getString("name");
    	   location=rs.getString("location");
    	   photo=rs.getString("photo");
    	   
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
			}else{
				location = "기타";
			}
    	   %>
    	   
    	  <li class="span3" style="width: 210px">
			<div class="thumbnails">
				<a href="#">
			 	<img src="./upload/<%=photo%>"  alt="http://placehold.it/300x200"
					width="150" height="200"></a></div>
				
				<h3><%=location%></h3>
				<p>
					방이름:<%=name%><br /> 학교:
					<%=location%><br /> 
				<a href="deletelist.jsp?id=<%=rs.getInt("id")%>" class="btn btn-mini">삭제</a>
				
				</p>
		  	</li>
		<%
    }
   %>
   </ul>
   <%	
}
   finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
   %>


</div>

</body>
</html>