<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>


<!DOCTYPE html>
<html lang="ko"> 

	<head>
	<meta charset="utf-8">
	<title>실습 3 - 테이블 만들기</title>
	 <link href="css/bootstrap.css " rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css " rel="stylesheet" type="text/css">
   <link href="css/main.css" rel="stylesheet">
	</head>

	<body>
		<table class="table table-bordered" style="text-align: center;width:130px;height:10px; position: fixed; top:40px; left:1000px;" >
			<tr class="success">
				<th class="info">그림</th><th>소개</th>
			</tr>
			<tr>
				<td rowspan="2"></td>
				<td>대학명</td>
			</tr>
			<tr class="success">
				<td>방이름</td>
		    </tr>
		    			<tr>
				<th>그림</th><th>소개</th>
			<tr class="success">
			<tr>
				<td rowspan="2"><img src="..." class="img-rounded"></td>
				<td>대학명</td>
			</tr>
			<tr>	
				<td>방이름</td>
		    </tr>
			
						<tr>
				<th>그림</th><th>소개</th>
			</tr>
			<tr>
				<td rowspan="2"><img src="..." class="img-rounded"></td>
				<td>대학명</td>
			</tr>
			<tr>	
				<td>방이름</td>
		    </tr>
			
			
		</table>
	</body>

</html>
