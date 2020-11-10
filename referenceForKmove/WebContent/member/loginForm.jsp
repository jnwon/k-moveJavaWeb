<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("sid") != null) {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Board</title>
<style type="text/css">
#loginFormArea {
	margin: auto;
	width: 400px;
	height: 200px;
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
	width: 380;
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
</head>
<body>
	<section id="loginFormArea">
		<h1>Login</h1>
		<form action="LoginPro.me" method="post" name="loginForm">
			<fieldset>
				<table>
					<tr>
						<td class="td_left">
							<label for="id">ID : </label>
						</td>
						<td class="td_right">
							<input type="text" name="id">
						</td>
					</tr>
					<tr>
						<td class="td_left">
							<label for="pass">PASSWORD : </label>
						</td>
						<td class="td_right">
							<input type="password" name="pass">
						</td>
					</tr>
				</table>
				<input type="submit" value="LOGIN">
			</fieldset>
		</form>
	</section>
</body>
</html>