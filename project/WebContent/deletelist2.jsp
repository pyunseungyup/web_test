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
	  System.out.println(dbcode);
	  String wishid="";
		String name = "" ; // 방이름 
		String location = ""; // 대학별 위치
		String photo = ""; // 유저 아이디 저장
		String roomid= "";
		int id = 0;
	



%>	

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<title>마이페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">


<style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #fff;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 30px auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>

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
   
	 stmt.setString(1,dbcode);
   rs = stmt.executeQuery();   
   
   %>
   <ul>

  
   <%
   while(rs.next()){
    	  
	       wishid=rs.getString("wishid");
    	   name=rs.getString("name");
    	   location=rs.getString("location");
    	   photo=rs.getString("photo");
    	   roomid=rs.getString("roomid");
    	   %>
    	   
 	<li class="span3" style="width: 210px">
				<div class="thumbnails">
					<a href="show.jsp?roomid=<%=roomid%>"> <img
						src="./upload/<%=photo%>" alt="http://placehold.it/300x200"
						width="150" height="200"></a>
					<h3><%=location%></h3>
					<p>
						방이름:<%=name%><br /> 지역:
						<%=location%><br />
					</p>
					<a href="deletelist.jsp?id=<%=rs.getInt("id")%>"
						class="btn btn-mini">삭제</a> <a href="show.jsp?roomid=<%=roomid%>"
						class="btn btn-mini">보기</a>
				</div>
			</li>
		  	
		<%
		
   }
   %>
   </ul>

   <%	
}
   finally {

		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
   %>
		
		
		<jsp:include page="share/footer.jsp"></jsp:include>

	</div>
	

</body>
</html>