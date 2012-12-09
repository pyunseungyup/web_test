<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
	
	
	<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">




<title>Errors</title>
</head>

<body>
	
<%



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
	
	//LacalEncrypter encrypter = new LocalEncrypter();
	
	//pwd = encrypter.returnDecryptCode(pwd);
	
	List<String> errorMsgs = new ArrayList<String>(); 
	//boolean result = false;
	int result =0;
	  
	if (userid == null || userid.trim().length() == 0) {
		errorMsgs.add("ID 반드시 입력해주세요.");
	}
	
	
	if (pwd == null || pwd.length() < 6 || !pwd.equals(pwd_confirm)) {
		
		errorMsgs.add("비밀번호는 다시 입력해주세요.");
	} 
	
	
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("Name 반드시 입력해주세요.");
	}
	
	if (phonenumber == null || phonenumber.trim().length() == 0) {
		errorMsgs.add("Phonenumber 반드시 입력해주세요.");
	}

	if (errorMsgs.size() == 0) {
	
  
	try {
		  try{
			Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement(
				"SELECT * FROM users WHERE userid =?");
		stmt.setString(1,  userid);		
		rs = stmt.executeQuery();
		if(rs.next()){%>
			  <h2>아이디가 중복입니다. 다른아이디를 입력해주세요!!!</h2>
			  <a href="join.jsp" class ="btn btn-small btn-primary">회원가입 창으로</a>
			<%rs.close();
			  stmt.close();
							
	  }else{	  
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
					
					//rs=stmt.executeQuery();

					result = stmt.executeUpdate();
					

					if (result == 0) {
						response.sendRedirect("join.jsp");
					}else
						response.sendRedirect("index.jsp");
					
				}finally {

					if (rs != null) try{rs.close();} catch(SQLException e) {}
					if (stmt != null) try{stmt.close();} catch(SQLException e) {}
					if (conn != null) try{conn.close();} catch(SQLException e) {}
				}
	 }
	
		
		
		
	}finally {

		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	}

		
	}
	else
	{
		%>


	<div class="container-narrow">



		<jsp:include page="share/header.jsp"></jsp:include>


		<div class="jumbotron">

			<div class="alert alert-error">
				<h3>Errors:</h3>
				<ul>
					<% for(String msg: errorMsgs) { %>
					<li style="list-style: none;"><%=msg %></li>
					<% } %>
				</ul>
			</div>
			<div class="form-action">
				<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
			</div>
		</div>





		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>



</body>
</html>
<%} %>
