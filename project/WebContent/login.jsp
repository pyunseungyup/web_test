<<<<<<< HEAD
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
	
	String userid="";
	String pwd="";
	
	request.setCharacterEncoding("utf-8");
	
	List<String> errorMsgs = new ArrayList<String>();	
	
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


<title>Project Main</title>
</head>

<body>



	<div class="container-narrow">



		<jsp:include page="share/header.jsp"></jsp:include>


		<div class="jumbotron">

			<h2>로그인</h2>


			<form action="registerlogin.jsp" method="post">
				<fieldset>
					<table class="body_imfor">
						<tr>
								<th class="contlor-label" for="userid">e-mail</th>
							<td colspan="3"><input type="text" name="userid"
								value="<%=userid%>" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd" value="<%=pwd %>" /></td>
						</tr>


					</table>

					<input type="checkbox" name="email_check">e-mail 저장 <input
						type="submit" value="로그인" />
				</fieldset>
			</form>

			<a href="">비밀번호 찾기</a><br />


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

<<<<<<< HEAD
=======
</body>
</html>
=======
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
	
	String userid="";
	String pwd="";
	
	request.setCharacterEncoding("utf-8");
	
	List<String> errorMsgs = new ArrayList<String>();	
	
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


<title>Project Main</title>
</head>

<body>



	<div class="container-narrow">



		<jsp:include page="share/header.jsp"></jsp:include>


		<div class="jumbotron">

			<h2>로그인</h2>


			<form action="registerlogin.jsp" method="post">
				<fieldset>
					<table class="body_imfor">
						<tr>
								<th class="contlor-label" for="userid">e-mail</th>
							<td colspan="3"><input type="text" name="userid"
								value="<%=userid%>" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd" value="<%=pwd %>" /></td>
						</tr>


					</table>

					<input type="checkbox" name="email_check">e-mail 저장 <input
						type="submit" value="로그인" />
				</fieldset>
			</form>

			<a href="">비밀번호 찾기</a><br />


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

>>>>>>> 22462c80488cf0b814815b4eabcb2bdcc84d1406
</body>
</html>
>>>>>>> 2c3a5148be34e192bbf3b783e4114e57a3423b71
