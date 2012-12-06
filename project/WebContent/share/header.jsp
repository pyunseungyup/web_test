<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>

<%
/*
//DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	String Suserid ="";
	String Sname="";
	String Sid = "";
	request.setCharacterEncoding("utf-8");
	
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		session.getAttribute("s_userid")
		stmt = conn.prepareStatement("SELECT id,name FROM users WHERE userid = ?");
		
		Suserid = stmt.setString(1, userid);	
		rs= stmt.executeQuery();
		rs.next();
		Sname= rs.getString("name");	
		Sid = rs.getString("id");
*/

%>
<div class="masthead">
	<ul class="nav nav-pills pull-right">
		<li><a href="room.jsp">방올리기</a></li>
		<li><a href="join.jsp">회원가입</a></li>
		<%
          if (session.getAttribute("s_userid")==null) {
          %>
		<li><a href="login.jsp">login</a></li>
		<% } 
          else {   	         
        	  %>
		<li class="dropdown item"><a href="#"
			class="dropdown-toggle item" data-toggle="dropdown"> 안녕하세요, <%=session.getAttribute("s_name")%>님
				<span style="font-size: 6px;">▼</span>
		</a>
			<ul class="dropdown-menu">
				<li><a href="update.jsp">회원정보</a></li>
				<li><a href="#">my page</a></li>
				<li class="divider"></li>
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul></li>
		<%    
          /*  }catch (SQLException e){
  			errorMsgs.add("SQL 에러: " + e.getMessage());
  		}finally {
  			// 무슨 일이 있어도 리소스를 제대로 종료
  			if (rs != null) try{rs.close();} catch(SQLException e) {}
  			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
  			if (conn != null) try{conn.close();} catch(SQLException e) {}
  		} 
      */
	}	
  		%>

	</ul>
	<h3>
		<a href="index.jsp" class="muted">BnB UN</a>
	</h3>
</div>






=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>

<%
/*
//DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/bnbun";
	String dbUser = "bnb";
	String dbPassword = "bnbun";
	
	String Suserid ="";
	String Sname="";
	String Sid = "";
	request.setCharacterEncoding("utf-8");
	
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);		
		session.getAttribute("s_userid")
		stmt = conn.prepareStatement("SELECT id,name FROM users WHERE userid = ?");
		
		Suserid = stmt.setString(1, userid);	
		rs= stmt.executeQuery();
		rs.next();
		Sname= rs.getString("name");	
		Sid = rs.getString("id");
*/

%>
<div class="masthead">
	<ul class="nav nav-pills pull-right">
		<li><a href="room.jsp">방올리기</a></li>
		<li><a href="join.jsp">회원가입</a></li>
		<%
          if (session.getAttribute("s_userid")==null) {
          %>
		<li><a href="login.jsp">login</a></li>
		<% } 
          else {   	         
        	  %>
		<li class="dropdown item"><a href="#"
			class="dropdown-toggle item" data-toggle="dropdown"> 안녕하세요, <%=session.getAttribute("s_name")%>님
				<span style="font-size: 6px;">▼</span>
		</a>
			<ul class="dropdown-menu">
				<li><a href="update.jsp">회원정보</a></li>
				<li><a href="#">my page</a></li>
				<li class="divider"></li>
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul></li>
		<%    
          /*  }catch (SQLException e){
  			errorMsgs.add("SQL 에러: " + e.getMessage());
  		}finally {
  			// 무슨 일이 있어도 리소스를 제대로 종료
  			if (rs != null) try{rs.close();} catch(SQLException e) {}
  			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
  			if (conn != null) try{conn.close();} catch(SQLException e) {}
  		} 
      */
	}	
  		%>

	</ul>
	<h3>
		<a href="index.jsp" class="muted">BnB UN</a>
	</h3>
</div>






>>>>>>> 2c3a5148be34e192bbf3b783e4114e57a3423b71
