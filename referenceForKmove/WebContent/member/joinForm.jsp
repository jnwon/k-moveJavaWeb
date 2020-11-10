<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인이 되어있을 경우 메인페이지로 강제 이동 처리
   	if(session.getAttribute("sid") != null) {
//     		out.println("<script>");
//     	    out.println("alert('잘못된 접근입니다!')");
//     	    out.println("location.href='index.jsp'");
//     	    out.println("</script>");
   		response.sendRedirect("index.jsp");
   	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Board</title>
<style type="text/css">
#joinFormArea{
	margin: auto;
	width: 400px;
	height: 250px;
	border: 2px double purple;
	border-radius: 10px;	
	text-align: center;
}
fieldset {
	text-align: center;
	border: none;
}
#selectButton {
	margin-top: 10px;
}
table {
	width: 380px;
	margin: auto;
}
.td_left {
 	width: 180px;
	text-align: right;
 	
}
.td_right {
	width: 200px;
}
</style>
<script type="text/javascript">
function checkId(id) {
	// 4 ~ 12자리 아이디 영문,숫자 조합 유효성 검사
	// => 영문자로 시작하고 영문자 또는 숫자의 조합으로 4 ~ 12 자리
	// 1. 정규표현식 지정
	var regex = /^[A-Za-z][A-Za-z0-9]{3,11}$/;
	// 2. 체크 후 메세지 표시할 공간의 태그 id 값 가져오기
	// checkIdResult 값을 ID 로 갖는 태그 찾기
	var element = document.getElementById('checkIdResult');
	// 3. 정규표현식을 통한 유효성 검사 수행(정규표현식 저장 변수명.exec() 를 사용)
	// 함수 호출 시 전달받은 파라미터(id) 의 값을 정규표현식으로 검사
	// 유효성 검사를 통과했을 경우
//			alert('유효성 검사 통과');	
	if(regex.exec(id.value)){
		element.innerHTML = "usable ID";
	} else {
		element.innerHTML = "unusable ID"
	}
		// 지정된 태그 내에 메세지 표시
// 유효성 검사를 통과하지 못했을 경우
//			alert('유효성 검사 탈락');
}
function checkPass(pass) {
	// 8 ~ 16자리 패스워드 영문,숫자,특수문자 조합 유효성 검사
	// 1. 정규표현식 지정
	// 1) 길이 체크 : 8 ~ 16자리. 영문 대문자&소문자&숫자&특수문자(!@#$%^_)
	var lengthRegex = /^[A-Za-z0-9!@#$%^_]{8,16}$/;
	// 2) 대문자 체크
	var upperCaseRegex = /[A-Z]/;
	// 3) 소문자 체크
	var lowerCaseRegex = /[a-z]/;
	// 4) 숫자 체크
	var digitRegex = /[0-9]/;
	// 5) 특수문자 체크
	var specCharRegex = /[!@#$%^_]/;
	
//		// 2. 체크 후 메세지 표시할 공간의 태그 id 값 가져오기
	var element = document.getElementById('checkPassResult')
	// checkPasswdResult 값을 ID 로 갖는 태그 찾기
	
//		// 3. 정규표현식을 통한 유효성 검사 수행(정규표현식 저장 변수명.exec() 를 사용)
//		// 함수 호출 시 전달받은 파라미터(id) 의 값을 정규표현식으로 검사
	// 길이, 대문자, 소문자, 숫자, 특수문자 체크를 모두 통과했을 경우
	if(lengthRegex.exec(pass.value) && upperCaseRegex.exec(pass.value) &&
			lowerCaseRegex.exec(pass.value) && digitRegex.exec(pass.value) &&
			specCharRegex.exec(pass.value)) {
// 		alert('유효성 검사 통과');	
		// 지정된 태그 내에 메세지 표시
		element.innerHTML = "Suitable password";
	} else {// 유효성 검사를 통과하지 못했을 경우
//			alert('유효성 검사 탈락');
		element.innerHTML = "Invalid password";
	}
		
}
</script>
</head>
<body>
	<section id="joinFormArea">
		<h1>Join The Membership</h1>
		<form action="JoinPro.me" method="post" name="joinForm" onsubmit="return checkForm()">
			<fieldset>
				<table>
					<tr>
						<td class="td_left">NAME : </td>
						<td class="td_right"><input type="text" name="name" required="required"></td>
					</tr>
					<tr>
						<td class="td_left">ID : </td>
						<td class="td_right">
							<!-- 키를 눌렀다 뗄 경우 checkId() 함수 호출(입력중인 텍스트 전달) -->
							<input type="text" name="id" required="required"
							placeholder="combinations 4 ~ 12 alphabet, number" onkeyup="checkId(this)">
							<span id="checkIdResult"></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">PASSWORD : </td>
						<td class="td_right">
						<input type="password" name="pass" required="required"
							placeholder="combination 8 ~ 16 alphabet, special alphabet" onkeyup="checkPass(this)">
							<span id="checkPassResult"></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">E-MAIL : </td> 
						<td class="td_right"><input type="email" name="email" required="required"></td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="submit" value="JOIN" />
						<input type="reset" value="CANCEL" onclick="history.back()"></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</section>
</body>
</html>