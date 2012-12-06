<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>


<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	String userid =request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String dbuserid="";
	String dbpwd="";
	String dbname = "";
	
	request.setCharacterEncoding("utf-8");
	
	List<String> errorMsgs = new ArrayList<String>();
	
	
	if (userid == null || userid.trim().length() == 0) {
		errorMsgs.add("ID 반드시 입력해주세요.");
	}
	if (pwd == null || pwd.length() < 6) {
		errorMsgs.add("비밀번호는 6자 이상 입력해주세요.");
	} 

	if (errorMsgs.size() == 0) {
	try {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		stmt = conn.prepareStatement("SELECT * FROM users WHERE userid =?");
		stmt.setString(1, userid);
		rs= stmt.executeQuery();
		rs.next();
		
		dbuserid=rs.getString("userid");
		dbpwd=rs.getString("pwd");
		dbname=rs.getString("name");		
		int dbid = rs.getInt("id"); 
	
		if(dbpwd.equals(pwd) && dbuserid.equals(userid)){
			session.setAttribute("s_userid", userid);	
			session.setAttribute("s_name", dbname);	
			response.sendRedirect("index.jsp");
	}else{		
			response.sendRedirect("login.jsp");		
	}
		
			
		}catch (SQLException e){
			errorMsgs.add("SQL 에러: " + e.getMessage());
		}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}
	else{
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
<link href="css/main.css" rel="stylesheet">


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->



<title>Errors</title>
</head>

<body>



	<div class="container-narrow">



		<jsp:include page="share/header.jsp"></jsp:include>


		<div class="jumbotron">

			<div class="alert alert-error">
				<h3>Errors:</h3>
				<ul>
					<% for(String msg: errorMsgs) { %>
					<li><%=msg %></li>
					<% } %>
				</ul>
			</div>
			<div class="form-action">
				<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
			</div>
		</div>





		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>

	<% //if (session.getAttribute("userid") == null) %>


	<% //if (session.getAttribute("userid") == null) { %>
	<% //<jsp:forward page="login.jsp"></jsp:forward> %>

	<% //} else { %>
	<%//if(request.getParameter("userid")==userid && request.getParameter("pwd")==pwd){%>
	<%//<jsp:forward page="index.jsp"></jsp:forward>
		//}%>

	<%//}%>


	<%
			/*
    if (request.getMethod().equals("POST")) {
	  //String id = request.getParameter("userid");
	  //String pwd = request.getParameter("pwd");
    
	  if (userid == null || pwd == null || userid.length() == 0 || pwd.length() == 0) {
		  response.sendRedirect("login.jsp");
	  }
	  
  }
			*/
  %>


	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>



<%
	}
		
		%>

