<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생부</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400')
	;

* {
	font-family: 'Noto Sans KR', sans-serif;
}

body, ul {
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
	border: none;
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
	width: 330px;
	margin: 0 auto;
}

table {
	font-size: 17px;
	border-collapse: collapse;
	width: 330px;
	margin-bottom: 20px;
}

.table_title {
	background-color: yellowgreen;
	height: 25px;
	color: white;
	border: 0px;
}

.table_data {
	background-color: white;
	height: 25px;
	font-size: 17px;
}

.table_data:hover {
	background-color: #F6F6F6;
}

th {
	padding: 5px;
}

td {
	text-align: center;
}

tr {
	border-bottom: 1px dashed #dadada;
}

.uBtn {
	color: skyblue;
}

.dBtn {
	color: tomato;
}

/*modal*/
.modal_dBtn {
	background-color: salmon;
}

.back {
	background-color: yellowgreen;
	margin-left: 10px;
}

.modal_all {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.1);
	z-index: 3;
	display: flex;
	align-items: center;
	justify-content: center;
	display: none;
}

.modal_content {
	background-color: white;
	width: 300px;
	height: 350px;
	border-radius: 5px;
}

.text_wrap {
	display: flex;
	justify-content: center;
	text-align: center;
	margin-top: 10px;
	color: gray;
}

.btn_wrap {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

.icon {
	display: flex;
	justify-content: center;
	font-size: 100px;
	text-align: center;
	margin-top: 50px;
	color: lightgray;
}
.name{

}
.table_data {
	color: lightgray;
	font-weight: 300;
}
</style>
</head>
<body>
	<div class="modal_all">
		<div class="modal_content">
			<i class="far fa-sad-tear icon"></i><br>
			<span class="text_wrap">
				"<span class="name"></span>"학생을 삭제합니다.<br> 정말로 삭제하시겠습니까?<br>
			</span>
			<div class="btn_wrap">
				<a href="#" class="btn_index modal_dBtn">삭제</a> <a
					href="#" class="btn_index back">뒤로가기</a>
			</div>
		</div>
	</div>
	<div class="content">
		<a href="index.jsp">
			<div class="shs_title">
				JAVA 기반 스마트하이브리드<br> 개발자과정 2기
			</div>
		</a>
		<div class="shs_manager">-출석부-</div>
		<div class="in_content">
			<!-- jstl/el태그: HTML안에서(화면단에서) 자바 코드를 쉽게 쓸 수 있도록 해주는 태그이다. 이 태그들은 라이브러리에 추가해 주어야 쓸 수 있다.
			 el태그 : 정보를 출력(뿌려줌)하는 역할 
			 jstl태그 : 제어(if, for, while등)문 관련해서 쓸 때, 포맷팅(일정한 형식:날짜라면 2019.10.23또는2019-10-23또는2019년10월23일)해 줄 때.-->
			<table>
				<tr class="table_title">
					<th>ID</th>
					<th>NAME</th>
					<th>Tel.</th>
					<th></th>
					<th></th>
				</tr>
				<c:if test="${shslist.size()==0}">
					<tr class="table_data">
						<td colspan="5">등록된 학생이 없습니다.</td>
					</tr>
				</c:if>

				<c:forEach items="${ shslist }" var="mDto">
					<!-- ${ shslist }=>el태그이다. el태그로 데이터를 담아오고, 계속 el태그로 데이터를 담아오면 힘드니까 이름을 붙여준다.(var="mDto") -->
					<tr class="table_data">
						<td class="sid">${mDto.sid}</td>
						<td class="sname">${mDto.sname}</td>
						<td>${mDto.sphone}</td>
						<td><a href="SHSUpdate?id=${mDto.sid}" class="uBtn">수정</a></td>
						<td><a href="#" class="dBtn">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="div_index">
			<a href="index" class="btn_index btn3">뒤로가기</a>
		</div>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var id, name;
			$('.dBtn').click(function() {
				id = $(this).closest('tr').find('.sid').text();
				name = $(this).closest('tr').find('.sname').text();
				// 조건에 맞는 녀석중 나에게서 가장 가까운 부모를 선택
				/* alert(id+","+name); */
				$('.name').text(name);
				$('.modal_all').css('display','flex');
			});
			$('.back').click(function() {
				$('.modal_all').css('display', 'none');
			});
			$('.modal_dBtn').click(function() {
				location.href="SHSDelete?id="+id;
				
			});
		});
	</script>
</body>
</html>