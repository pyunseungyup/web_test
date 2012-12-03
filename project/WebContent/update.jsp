<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"
    %>


<% 
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	// 사용자 정보를 위한 변수 초기화

	


	String userid ="" ;
	String dbpwd = "";
	String dbname = "";
	String dbphonenumber = "";
  String id ="";

	
	 try {
		 id = request.getParameter("id");
		
	 }catch (Exception e) {}
	 
		try{
			Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
			stmt.setString(1 , id);
			rs = stmt.executeQuery();
			
			rs.next();
			dbuserid = rs.
			dbpwd = rs.getString("pwd");
			dbname = rs.getString("name");
			dbphonenumber = rs.getString("phonenumber");
			
			
			

	
%>

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
  	
  <div class="jumbotron">
  
   <h2>정 보 수 정</h2>

  
  
    <div class = "basic_information">
      <form action="userupdate.jsp?id=<%=id%>" method="post">
      <fieldset>
      <table class = "body_imfor">
        <tr>
          <th>e-mail</th>
          <td>
            <input type="text" name="userid" value="<%=userid%>"/>
          </td>
           <td>
            <input type="button" value="중복조회"/>
          </td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td colspan = "2">
            <input type="password" name="pwd" value="<%=dbpwd%>" />
          </td>
        </tr>
        <tr>  
          <th>확인</th>
          <td colspan = "2">
            <input type="password" name="pwd_confirm" value="<%=dbpwd%>"/>
          </td>
        </tr>
        <tr>
          <th>이름</th>
          <td colspan="3">
            <input type="text" name="name" value="<%=dbname %>"/>
          </td>
        </tr>
        <tr>
          <th>PHONE-NUMBER</th>
          <td colspan="3">
            <input type="text" name=phonenumber value="<%=dbphonenumber%>"/>
          </td>
        </tr>
        </table>
    <input type="submit"  value="정보 수정" />
   </fieldset> 
	</form>
	</div> 

   
		</div>
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


	
	<%
	
		
		
		
		
	}finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}
			 
%> 
