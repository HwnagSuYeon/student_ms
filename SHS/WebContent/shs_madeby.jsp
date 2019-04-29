<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만든이</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400')
	;

* {
	font-family: 'Noto Sans KR', sans-serif;
}

body, ul {
	/*height: 100vh;
			display: flex;
			align-items: center;
			justify-content: center;*/
	margin: 0;
	padding: 0;
}

a {
	color: inherit;
	text-decoration: none;
}

ul {
	list-style: none;
}

.content {
	width: 390px;
	height: 600px;
	border: 2px solid #4C4C4C;
	/*border-top: 2px solid black;*/
	margin: 50px auto 0;
	background-color: #F6F6F6;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12);
	border-radius: 5px;
}

.shs_title {
	padding-top: 50px;
	text-align: center;
	font-size: 30px;
	color: black;
}

.shs_manager {
	padding-top: 20px;
	padding-bottom: 65px;
	text-align: center;
	color: #454552;
	font-size: 20px;
}

.btn_index {
	padding: 17px 12px;
	background-color: yellowgreen;
	color: white;
	width: 140px;
	display: inline-block;
	border-radius: 5px;
	font-size: 22px;
}

.btn_index:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12);
}

.div_index {
	padding-bottom: 30px;
	text-align: center;
}

.name_img {
	width: 200px;
	height: 180px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: 95px;
}

.name_img>img {
	width: 100%;
}
.btn_index {
	padding: 10px 12px;
	background-color: yellowgreen;
	color: white;
	width: 110px;
	display: inline-block;
	border-radius: 5px;
	font-size: 22px;
}

.btn_index:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12)
}
.btn3 {
	background-color: salmon;
}
</style>
</head>
<body>
	<div class="content">
		<a href="index.jsp">
			<div class="shs_title">
				JAVA 기반 스마트하이브리드<br> 개발자과정 2기
			</div>
		</a>
		<div class="shs_manager">-Made By-</div>
		<div class="name_img">
			<img src="img/hwnag_logo.png">
		</div>
		<div class="div_index">
			<a href="index" class="btn_index btn3">뒤로가기</a>
		</div>
	</div>
</body>
</html>