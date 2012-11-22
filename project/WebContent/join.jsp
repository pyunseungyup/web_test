<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lan = "ko">
<head>

  	<meta charset="utf-8">
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
  	<link href="css/main.css" rel="stylesheet">
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
 		
 		<script src="js/jquery-1.8.2.min.js"></script>
	  <script src="js/bootstrap.min.js"></script>
	  
	  
<title>Project Main</title>
</head>  

  <body>
  
  <div class="container-narrow">
  
  
  	
 	<jsp:include page="share/header.jsp"></jsp:include>
  	
  <div class="jumbotron">
  
   <h2>회  원  가  입</h2>

<form accept-charset="UTF-8" action="#" method="post">

  <fieldset>
  
    <div class = "basic_information">
      <form action="#" method="post">
      <table class = "body_imfor" border="0">
        <tr>
          <th>e-mail</th>
          <td>
            <input type="email"/>
          </td>
           <td>
            <input type="button" value="중복조회"/>
          </td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td colspan = "2">
            <input type="password"/>
          </td>
        </tr>
        <tr>  
          <th>확인</th>
          <td colspan = "2">
            <input type="password"/>
          </td>
        </tr>
        <tr>
          <th>이름</th>
          <td colspan="3">
            <input type="text"/>
          </td>
        </tr>
        <tr>
          <th>PHONE-NUMBER</th>
          <td colspan="3">
            <input type="text"/>
          </td>
        </tr>
        </table>
    <input type="submit"  value="회원가입" />
  </fieldset> 
</form>
   
		</div>
     <jsp:include page="share/footer.jsp"></jsp:include>
    
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script>

  </body>
</html>
