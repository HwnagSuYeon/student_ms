<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입환영</title>
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

.btn2 {
	background-color: orange;
}

.btn3 {
	background-color: salmon;
}

.container {
	height: 250px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
}

.text1 {
	font-size: 30px;
}

.text2 {
	font-size: 20px;
}

#rCnt {
	font-size: 20px;
	color: salmon;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="content">
			<div class="shs_title">
				<a href="index.jsp">
					JAVA 기반 스마트하이브리드<br> 개발자과정 2기
				</a>
			</div>
		
		<div class="shs_manager">-환영합니다-</div>


		<div class="container">
			<div class="welcome_text text1">등록해주셔서 감사합니다!</div>
			<div class="welcome_text text2">
				<span id="rCnt">3</span>초후에 메인 페이지로 이동합니다
			</div>
		</div>


	</div>

	<script type="text/javascript">
		var cnt=2;
		function countDown(){
			if (cnt == 0) {
				clearInterval(s);
				location.href="index";
			}
			document.getElementById("rCnt").innerHTML=cnt;
			cnt--;
		}
		var s = setInterval(countDown,1000); // 1초 단위로 countdown()실행
	</script>
</body>
</html>