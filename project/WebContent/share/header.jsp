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
          
          	<li><%=session.getAttribute("userName") %>님 환영합니다.</li>
          	<li><a href="logout.jsp" data-action="logout"  >logout</a></li>
          	<li><a href="#">my page</a></li>
          	
          
          <%  } %>  
          
        </ul>
        <h3><a href ="index.jsp" class="muted">BnB UN</a></h3>   
 </div>
 
 

 

 
 