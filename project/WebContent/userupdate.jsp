<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>

<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	request.setCharacterEncoding("utf-8");
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun?characterEncoding=utf8";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	
	int id = 0;
	String userid = "" ; 
	String s_userid="";
	String pwd = "";
	String name = "" ;  
	String phonenumber = "" ; 
	String pwd_confirm = "";
	//Date date;
	
	//id = request.getParameter("id");		
	s_userid=session.getAttribute("s_userid").toString();
	userid = request.getParameter("userid");
	pwd = request.getParameter("pwd");
	pwd_confirm = request.getParameter("pwd_confirm");
	name = request.getParameter("name");
	phonenumber = request.getParameter("phonenumber");
	
	
	
	List<String> errorMsgs = new ArrayList<String>();
	
	int result = 0;
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
				
		
		conn =DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		
		stmt = conn.prepareStatement(
				"UPDATE users " +
				"SET userid=?, pwd=?, name=?, phonenumber=?"+
						"WHERE userid =?");
		
		stmt.setString(1,  userid);
		stmt.setString(2,  pwd);
		stmt.setString(3,  name);
		stmt.setString(4,  phonenumber);
		stmt.setString(5, s_userid);
		
		
				  
		session.setAttribute("s_userid", userid);	
		session.setAttribute("s_name", name);
		
		result = stmt.executeUpdate();
		
	
		if (result == 0) {
			response.sendRedirect("update.jsp");
		}else
		{
			response.sendRedirect("index.jsp");
			
		}
	
	} finally {
		// 무슨 일이 있어도 리소스를 제대로 종료
		if (rs != null) try{rs.close();} catch(SQLException e) {}
		if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		if (conn != null) try{conn.close();} catch(SQLException e) {}
	
	}
	}
	
	else {
		%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<title>update Error</title>

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

		<%@ include file="share/footer.jsp"%>
		<!-- /container -->
	</div>

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->



</body>


</html>



<% 
}
%>

