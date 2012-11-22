<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 
 
  <div class="masthead">
        <ul class="nav nav-pills pull-right">
          <li><a href="room.jsp">방올리기</a></li>
          <li><a href="join.jsp">회원가입</a></li>
          <%
          if (session.getAttribute("userId") == null) {
          %>
          <li><a href="login.jsp">login</a></li>
          <% } 
          else { %>
          
          
          <li class="dropdown item">
	      		<a href="#" class="dropdown-toggle item" data-toggle="dropdown">
	            		  안녕하세요, <%=session.getAttribute("userName") %>님
	          	<span style="font-size:6px;">▼</span>
	        	</a>
	        	<ul class="dropdown-menu">
	            <li><a href="#">회원정보</a></li>
	            <li><a href="#">my page</a></li>
	            <li class="divider"></li>
	            <li><a href="logout.jsp">로그아웃</a></li>            
	          </ul>    	
	      	</li>
          
          <%  } %>  
          
        </ul>
        <h3><a href ="index.jsp" class="muted">BnB UN</a></h3>   
 </div>
 
 

 

 
 