//product 

function productDetail(action) {
	document.detail.type.value = action;
	document.detail.submit();
}
//회원 로그인,수정,탈퇴
function login() {
	window.open('login.jsp', "login", "width=520, height=580");
}
function member() {
	window.open('member.jsp', "member", "width=620, height=900");
}

function my() {
	window.open('my.jsp', "my", "width=620, height=900");
}

function logout() {
	alert('로그아웃 되었습니다.');
	location.href = "main.jsp";
}

function submit() {
	var f = document.find;

	if (f.pass.value == "") {
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	f.submit();
}

function begin() {
	document.myform.passwd.focus();
}
/*로그인시 입력 유무에따른 출력*/
function loginCheck() {
	if (document.loginFrm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.loginFrm.id.focus();
		return;
	}
	if (document.loginFrm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.loginFrm.pwd.focus();
		return;
	}
	document.loginFrm.submit();
}

function memberReg() {
	document.location = "member.jsp";
}
/*회원 가입시 공란확인*/
function inputCheck() {
	if (document.regForm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();
		return;
	}
	if (document.regForm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regForm.pwd.focus();
		return;
	}
	if (document.regForm.repwd.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.regForm.repwd.focus();
		return;
	}
	if (document.regForm.pwd.value != document.regForm.repwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.repwd.focus();
		return;
	}
	if (document.regForm.name.value == "") {
		alert("이름을 입력해 주세요.");
		document.regForm.name.focus();
		return;
	}
	if (document.regForm.birthday.value == "") {
		alert("생년월일를 입력해 주세요.");
		document.regForm.birthday.focus();
		return;
	}
	if (document.regForm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.regForm.email.focus();
		return;
	}
	if (document.regForm.zipcode.value == "") {
		alert("우편번호를 입력해 주세요.");
		document.regForm.zipcode.focus();
		return;
	}
	if (document.regForm.address.value == "") {
		alert("주소를 입력해 주세요.");
		document.regForm.address.focus();
		return;
	}
	if (document.regForm.hp.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.regForm.hp.focus();
		return;
	}
	/*email 형식 확인*/
	var str = document.regForm.email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;
	if (atPos > 1 && atPos == atLastPos &&
		dotPos > 3 && spacePos == -1 && commaPos == -1
		&& atPos + 1 < dotPos && dotPos + 1 < eMailSize);
	else {
		alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
		document.regForm.email.focus();
		return;
	}

	document.regForm.submit();
}
/*회원 가입시 아이디 유무 확인*/
function idCheck(id) {
	if (id == "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();
	} else {
		url = "idCheck.jsp?id=" + id;
		window.open(url, "post", "width=300,height=150");
	}
}

function zipCheck() {
	url = "zipSearch.jsp?search=n";
	window.open(url, "post", "toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
}

function win_close() {
	self.close();
}


//Product
function productDetail(pid) {
	document.detail.pid.value = pid;
	document.detail.submit();
}

function totalPrice(form){
	document.flag.value="totalPrice";
	document.submit();
}

//Cart
function cartUpdate(form) {
	form.flag.value = "update"
	form.submit();
}

function cartDelete(form) {
	form.flag.value = "delete";
	form.submit();
}

function heart(pid) {
			document.frm.action = "pUpHCnt";
			document.frm.pid.value=pid;
			document.frm.submit();
		}
	function goURL(url,id) {
		document.frm1.action = url;
		document.frm1.id.value=id;
		document.frm1.submit();
	}
//OrderList
