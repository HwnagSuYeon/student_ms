function nameCheck() {
	var name = $.trim($('#input_name').val());
	// $trim =>값의 앞, 뒤로공백을 없애준다.
	// 공백문자 체크
	var regEmpty = /\s/g;
	// 숫자가 들어오지못하게체크 
	var regNum = /[~0-9]/g;

	if (name == '' || name.length == 0) {
		// name == ''=>값이 공백이거나  name.length ==0 =>값의 길이가 0인경우(스페이스바만 들어오는경우)
		$('.err_msg').eq(0).css('display', 'block').css('color', 'tomato')
				.text('필수 정보입니다');
		return false;
	} else if (regNum.test(name)) {
		$('.err_msg').eq(0).css('display', 'block').css('color', 'tomato')
				.text('숫자는 들어올 수 없습니다');
		return false;
	} else if (name.match(regEmpty)) {
		$('.err_msg').eq(0).css('display', 'block').css('color', 'tomato')
				.text('공백 없이 작성해주세요');
		return false;
	} else if (name.length > 4 || name.length < 2) {
		$('.err_msg').eq(0).css('display', 'block').css('color', 'tomato')
				.text('2~4글자 사이의 이름을 작성해주세요');
		return false;
	} else {
		$('.err_msg').eq(0).css('display', 'block').css('color', 'dodgerblue')
				.text('멋진 이름이에요!');
		return true;
	}
}

function ageCheck() {
	var age = $.trim($('#input_age').val());
	if (age == '' || age.length == 0) {
		$('.err_msg').eq(1).css('display', 'block').css('color', 'tomato')
						   .text('필수 정보입니다');
		return false;
	} else if (isNaN(age)) {
		$('.err_msg').eq(1).css('display', 'block').css('color', 'tomato')
		   .text('숫자만 입력해 주세요');
		return false;
	} else if (age > 99 || age < 19) {
		$('.err_msg').eq(1).css('display', 'block').css('color', 'tomato')
		   .text('19세~99세까지만 회원등록이 가능합니다');
		return false;
	} else {
		$('.err_msg').eq(1).css('display', 'block').css('color', 'dodgerblue')
		   .text('o_<~★');
		return true;
	}
}

function majorCheck() {
	var major = $.trim($('#input_major').val());
	var regEmpty = /\s/g;
	var regNum = /[~0-9]/g;
	if (major.length == 0) {
		$('.err_msg').eq(2).css('display', 'none');
		return true;
	} else if (regNum.test(major)) {
		$('.err_msg').eq(2).css('display', 'block').css('color', 'tomato')
					.text('문자만 입력해주세요');
		return false;
	} else if (major.match(regEmpty)) {
		$('.err_msg').eq(2).css('display', 'block').css('color', 'tomato')
					.text('공백 없이 작성해주세요');
		return false;
	} else {
		$('.err_msg').eq(2).css('display', 'block').css('color', 'dodgerblue')
		.text('멋진 전공이에요!');
		return true;
		
	}
}

function phoneCheck() {
	var phone = $.trim($('#input_phone').val());
	var regEmpty = /\s/g;
	var regNum = /[~0-9]/g;
	var regPhone = RegExp(/^[0-9]{8,11}$/);
	if (phone == '' || phone.length == 0) {
		// name == ''=>값이 공백이거나  name.length ==0 =>값의 길이가 0인경우(스페이스바만 들어오는경우)
		$('.err_msg').eq(3).css('display', 'block').css('color', 'tomato')
				.text('필수 정보입니다');
		return false;
	} else if (isNaN(phone)) {
		$('.err_msg').eq(3).css('display', 'block').css('color', 'tomato')
		.text('숫자만 입력해주세요');
		return false;
	} else if (!regPhone.test(phone)) {
		$('.err_msg').eq(3).css('display', 'block').css('color', 'tomato')
		.text('올바른 값을 입력해주세요');
		return false;
	} else {
		$('.err_msg').eq(3).css('display', 'block').css('color', 'dodgerblue')
		.text('유효한 전화번호입니다');
		return true;
	}
}