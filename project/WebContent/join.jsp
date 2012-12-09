<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<title>로그인</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">


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
     <!-- Fav and touch icons -->
 
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>

<body>


	<div class="container-narrow">


		<jsp:include page="share/header.jsp"></jsp:include>



				<form class ="form-signin" action="register.jsp" method="post">
			<h2 class="form-signin-heading">회원가입</h2>
				<input type="email" class="input-block-level" placeholder="Email address" name="userid">
        <input type="password" class="input-block-level" placeholder="Password" name="pwd">
        <input type="password" class="input-block-level" placeholder="Password 확인" name="pwd_confirm">
        <input type="text" class="input-block-level" placeholder="이름" name="name">
        <input type="text" class="input-block-level" placeholder="핸드폰 번호" name="phonenumber">
        <button class="btn btn-large btn-primary" type="submit">JoIn</button>
      </form>


		<jsp:include page="share/footer.jsp"></jsp:include>

	</div>


</body>
</html>
