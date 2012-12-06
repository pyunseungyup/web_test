<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	request.setCharacterEncoding("utf-8");
	
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String pwd_confirm = request.getParameter("pwd_confirm");
	String name = request.getParameter("name");
	String phonenumber = request.getParameter("phonenumber");
	
	List<String> errorMsgs = new ArrayList<String>(); 
	
	if (userid == null || userid.trim().length() == 0) {
		errorMsgs.add("ID 반드시 입력해주세요.");
	}
	
	
	if (pwd == null || pwd.length() < 6 || pwd.equals("pwd")!=pwd_confirm.equals("pwd_confirm")) {
		
		errorMsgs.add("비밀번호는 다시 입력해주세요.");
	} 
	
	
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("Name 반드시 입력해주세요.");
	}
	
	if (phonenumber == null || phonenumber.trim().length() == 0) {
		errorMsgs.add("Phonenumber 반드시 입력해주세요.");
	}

	if (errorMsgs.size() == 0) {
		
		
	

  int result = 0;
	

		try {
			try{
				Class.forName("com.mysql.jdbc.Driver");
				}catch(ClassNotFoundException e){
					e.printStackTrace();
				}
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO users(userid, pwd, name, phonenumber) " +
					"VALUES(?, ?, ?, ?)"
					);
			stmt.setString(1,  userid);
			stmt.setString(2,  pwd);
			stmt.setString(3,  name);
			stmt.setString(4,  phonenumber);

			result = stmt.executeUpdate();
			

			if (result == 0) {
				response.sendRedirect("join.jsp");
	    }else{
	    	response.sendRedirect("index.jsp");
			}
		 
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}
	else
	{
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
