<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생검색</title>
<link rel="stylesheet" href="css/common.css?v=1">
<!-- ?v=1 -> 페이지를 불러올 때 방문기록을 초기화 해서 불러옴. 즉각적인 css옵션 적용을 위해서 한다. -->
<style type="text/css">
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
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	margin: 50px auto 0;
	/*background-color: #d8e9ef;*/
	/*border-radius: 5px; */
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
	background-color: lightgray;
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
.table_data {
	color: lightgray;
	font-weight: 300;
}
.search_wrap {
	margin-bottom: 15px;
	width: 100%; 
	height: 40px;
	position: relative;
}
.input_search {
	height: 100%;
	width: 100%;
	padding: 0 10px;
	border: 2px solid mediumpurple;
	outline: none;
	color: #515151;
	font-size: 16px;
	border-radius: 50px;
}
.search_btn {
	width: 40px;
	height: 100%;
	background-color: mediumpurple;
	display: inline-flex;
	font-size: 13px;
	position: absolute;
	top: 0;
	right: 0;
	border-radius: 50px;
	justify-content: center;
	align-items: center;
}
.search_btn:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16),
				0 2px 10px 0 rgba(0, 0, 0, .12);
}
.search_btn > i {
	font-size: 14px;
	color: white;
	
}
.search_result {
	color: gray;
	font-size: 15px;
	padding-left: 10px;
}
.err_msg {
	display: block;
	color: tomato;
	margin-top: -15px;
	padding-left: 10px;
	display: none;
}
.point {
	 color: dodgerblue;
}
.cnt {
	color: tomato;
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
		<%@ include file="include/header.jsp" %>
		<div class="shs_manager">-학생검색-</div>
		<div class="in_content">
			<div class="search_wrap">
				<input type="text" placeholder="검색할 이름을 입력해주세요" id="input_search" class="input_search" name="input_search" maxlength="4">
				<a href="#" class="search_btn"><i class="fas fa-search"></i></a>
			</div>
			<span class="err_msg"></span>
		</div> 
		
		<div class="in_content">
			<c:if test="${cnt  > 0}">
				<span class="search_result">
						"<span class="point">${name}</span>"으로 검색한 결과 총 <span class=cnt>${cnt}</span>건이 검색되었습니다.
				</span>
			</c:if>
		</div>
		
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
					<!-- 처음값을 0으로 인식시키기 위해 SearchAction에서 빈 리스트를 보내준다. 따라서처음부터 '검색결과가 없습니다'를 띄울 수 있다. -->
						<td colspan="5">검색결과가 없습니다</td>
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
			
			
			// 학생검색버튼 클릭시 동작하는 기능
			$('.search_btn').click(function() {
				var name = $.trim($('#input_search').val());
				//이름값을 받아와서 name이라는 변수에 담음.
				var regEmpty = /\s/g;
				// 숫자가 들어오지못하게체크 
				var regNum = /[~0-9]/g;
			
				if (name == '' || name.length == 0) {
					// name == ''=>값이 공백이거나  name.length ==0 =>값의 길이가 0인경우(스페이스바만 들어오는경우)
					$('.err_msg').css('display', 'block').css('color', 'tomato')
							.text('필수 정보입니다');
					return false;
				} else if (regNum.test(name)) {
					$('.err_msg').css('display', 'block').css('color', 'tomato')
							.text('숫자는 들어올 수 없습니다');
					return false;
				} else if (name.match(regEmpty)) {
					$('.err_msg').css('display', 'block').css('color', 'tomato')
							.text('공백 없이 작성해주세요');
					return false;
				} else if (name.length > 4 || name.length < 2) {
					$('.err_msg').css('display', 'block').css('color', 'tomato')
							.text('2~4글자 사이의 이름을 작성해주세요');
					return false;
				}
				
				location.href="searchPlay.shs?name="+name;
			});
		});
	</script>
</body>
</html>