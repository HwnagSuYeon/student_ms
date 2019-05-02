<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- jstl 라이브러리를 사용하기 위한 선언문 -->
<!-- 다음의 선언문으로 jstl, el태그를 사용해 자바코드를 쓸 수 있음 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 수정</title>
<link rel="stylesheet" href="css/common.css">
<style type="text/css">
a {
	color: inherit;
	text-decoration: none;
}

ul {
	list-style: none;
}

input {
	outline: none;
	border: none;
}

.content {
	width: 390px;
	height: 600px;
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	margin: 50px auto 0;
	/*background-color: #d8e9ef;*/
	/*border-radius: 5px; */
}

.shs_title {
	padding-top: 30px;
	text-align: center;
	font-size: 30px;
	color: black;
}

.shs_manager {
	padding-top: 10px;
	padding-bottom: 20px;
	text-align: center;
	color: #454552;
	font-size: 20px;
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

.in_content {
	text-align: right;
}

.div_input {
	padding: 3px 20px;
	position: relative;
}

.div_input>label {
	float: left;
	line-height: 40px;
}

.shs_input {
	width: 270px;
	display: inline-block;
	height: 40px;
	font-size: 16px;
	outline: none;
	border-bottom: 1.3px solid #dadada;
	height: 40px;
	transition: .5s;
}

.btn_wrap {
	display: flex;
	padding: 15px 0;
	justify-content: space-evenly;
}

hr {
	margin: 2px 0;
	border: 1px dashed #dadada;
}

#input_id {
	background-color: lightyellow;
	border: 1px solid #aaa !important;
	cursor: not-allowed;
}
.err_msg {
	color: tomato;
	font-size: 13px;
	font-weight: 400;
	text-align: left;
	padding-left: 80px;
	display: none;
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
		<div class="shs_manager">-학사 수정-</div>
		<form action="SHSUpdate" id="frm_update" name="frm_update" method="POST">
			<div class="in_content">
				<hr>
				<div class="div_input">
					<label for="input_id">아이디:</label> <input type="text" id="input_id"
						name="input_id" class="shs_input" placeholder="ID를 입력하세요"
						readonly="readonly" value="${memInfo.sid}"><br>
				</div>
				<hr>

				<div class="div_input">
					<label for="input_name">이름:</label>
					<input type="text" id="input_name" name="input_name" class="shs_input" placeholder="이름을 입력하세요" value="${memInfo.sname}"><br>
					<span class="err_msg"></span>
				</div>

				<div class="div_input">
					<label for="input_age">나이:</label> 
					<input type="text" id="input_age" name="input_age" class="shs_input" placeholder="나이를 입력하세요" value="${memInfo.sage}"><br>
					<span class="err_msg"></span>
				</div>

				<div class="div_input">
					<label for="input_major">전공:</label> 
					<input type="text" id="input_major" name="input_major" class="shs_input" placeholder="전공을 입력하세요" value="${memInfo.smajor}"><br>
					<span class="err_msg"></span>
				</div>

				<div class="div_input">
					<label for="input_phone">전화번호:</label> 
					<input type="text" id="input_phone" name="input_phone" class="shs_input" placeholder="핸드폰번호를 입력하세요" value="${memInfo.sphone}"><br>
					<span class="err_msg"></span>
				</div>
			</div>
			<div class="div_index btn_wrap">
				<a href="SHSSelect" class="btn_index btn3">취소</a>
				<a href="#" class="btn_index btn1 submit_btn">수정</a>
			</div>
		</form>

	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.shs_input').focus(function() {
				$(this).css('border-bottom', '1.3px solid orange');
			});
			$('.shs_input').blur(function() {
				$(this).css('border-bottom', '1.3px solid #dadada');
			});
			
			/* keyup()을 활용한 유효성체크(input값) */
			$('#input_name').keyup(function() {
				nameCheck();
			});
			
			$('#input_age').keyup(function() {
				ageCheck();
			});
			
			$('#input_major').keyup(function() {
				majorCheck();
			});
			
			$('#input_phone').keyup(function() {
				phoneCheck();
			});
			// 유효성 체크(이름, 나이, 전공, 핸드폰번호)
			// 유효값일경우 => submit
			$('.submit_btn').click(function(){
				if(!nameCheck()){
					// !nameCheck(name)=함수를 실행했을 때 true로 반환 된 것을 반대로 해야 if문을 타니까 변환
					$('#input_name').focus();
					return false;
				}
				if(!ageCheck()){
					$('#input_age').focus();
					return false;
				}
				if(!majorCheck()){
					$('#input_major').focus();
					return false;
				}
				if(!phoneCheck()){
					$('#input_phone').focus();
					return false;
				}
				//유효한 값 인증!
				$('#frm_update').submit();
			});
		});
	</script>
</body>
</html>