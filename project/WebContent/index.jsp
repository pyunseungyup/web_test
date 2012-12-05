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
	
	
	String userid ="";
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
	int roomid =0;
	
	int pageNo = 1;

	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {
	}

	int numInPage = 10; // 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; // 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;
	
	
	
	request.setCharacterEncoding("utf-8");	

%>
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
        <h2>당신이 원하는 자취방</h2>
        <h1>검색하나로!!</h1>
        <form action="searchroom.jsp" method="post" enctype="multipart/form-data	">
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
              <option value="5">5분이내</option>
              <option value="10">10분이내</option>
              <option value="20">20분이내</option>
              <option value="30">30분이내</option>
            </select>      
         
            <select name="kind" id="select">
              <option value="kind">방구조</option>
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

       <% while(rs.next()){%>      
    
		    <li class="span3">
              <div class="thumbnails" >
                 
                <a href = "show.jsp?roomid=<%=rs.getInt("roomid")%>"><img src="http://placehold.it/300x200" alt=""></a>
                  <h3><%=rs.getString("location")%></h3>
                  <p>방이름:<%= rs.getString("name") %><br/> 
			                                   학교에서의 거리: <%=rs.getString("distance")%><br/>
			                                   방 종류: <%=rs.getString("type")%>
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
    </div>     <!-- /container -->

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
