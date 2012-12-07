<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%


	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	// 사용자 정보를 위한 변수 초기화
	
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
<link href="css/main.css" rel="stylesheet">


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->


<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<title>update</title>
</head>

<body>

	<div class="container-narrow">



		<jsp:include page="share/header.jsp"></jsp:include>

		<div class="jumbotron">

			<h2>정보수정</h2>



			<div class="basic_information">
				<form action="userupdate.jsp" method="post">
					<fieldset>
						<table class="body_imfor">
							<tr>
								<th>e-mail</th>
								<td><input type="email" name="userid" value="<%=userid%>" />
								</td>

							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan="2"><input type="password" name="pwd"
									value="<%=pwd%>"></td>
							</tr>
							<tr>
								<th>확인</th>
								<td colspan="2"><input type="password" name="pwd_confirm"
									value="<%=pwd%>" /></td>
							</tr>
							<tr>
								<th>이름</th>
								<td colspan="2"><input type="text" name="name"
									value="<%=name%>" /></td>
							</tr>
							<tr>
								<th>PHONE-NUMBER</th>
								<td colspan="2"><input type="text" name=phonenumber
									value="<%=phonenumber%>" /></td>
							</tr>
						</table>
						
						<input type="submit" class="btn btn-mini disabled" value="정보수정" />
				    <a href="delete.jsp?id=<%=id%>"class="btn btn-mini disabled" >탈   퇴 </a>
					</fieldset>
				</form>
				 
			</div>


		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>

	</div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->


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
