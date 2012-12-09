<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%



	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	
	
	String userid = "";
	String pwd = "";
	String name = "";
	String phonenumber = "";
	int id = 0;
	userid = session.getAttribute("s_userid").toString();
	
	
 try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		stmt = conn.prepareStatement("SELECT * FROM users WHERE userid =?");
		stmt.setString(1, userid);
		rs = stmt.executeQuery();
		rs.next();
		pwd = rs.getString("pwd");
		name = rs.getString("name");
		phonenumber = rs.getString("phonenumber");
		id = rs.getInt("id");
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
<link href="css/index.css" rel="stylesheet">



<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>

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
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
    
     <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">



<title>update</title>
</head>

<body>

	<div class="container-narrow">



		<jsp:include page="share/header.jsp"></jsp:include>

			<form class ="form-signin" action="userupdate.jsp" method="post">
			<h2 class="form-signin-heading">정보수정</h2>
				<input type="text" class="input-block-level" placeholder="Email address" name="userid" value="<%=userid%>">
        <input type="password" class="input-block-level" placeholder="Password" name="pwd">
        <input type="password" class="input-block-level" placeholder="Password 확인" name="pwd_confirm">
        <input type="text" class="input-block-level" placeholder="이름" name="name"value="<%=name%>">
        <input type="text" class="input-block-level" placeholder="핸드폰 번호" name="phonenumber"value="<%=phonenumber%>">
        <button class="btn btn-large btn-primary" type="submit">정보수정</button> 
   	    <a href="delete.jsp"class="btn btn-large btn-primary" >탈   퇴 </a>

				</form>
				 




		<jsp:include page="share/footer.jsp"></jsp:include>

	</div>



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
