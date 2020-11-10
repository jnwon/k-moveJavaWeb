<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = null;
//로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
	if(session.getAttribute("sid") == null) {
		out.println("<script>");
		out.println("alert('This service requires a login')");
		out.println("location.href='LoginForm.me'");
		out.println("</script>");
	} else {// 로그인 된 상태일 경우 세션 ID 가져오기
		sid = (String)session.getAttribute("sid");
	}
// 전달받은 request 객체로부터 게시물 번호(board_num)와 페이지번호(page) 가져오기
	int board_num = Integer.parseInt(request.getParameter("board_num"));
	String nowPage = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Board</title>
<style type="text/css">
#passForm {
	width: 300px;
	margin: auto;
	border: 1px solid orange;
}
header {
	text-align: right;
}
</style>
</head>
<body>
	<header>
		<!-- 세션ID(sId) 가 없을 경우 로그인(LoginForm.me), 회원가입(JoinForm.me) 링크 표시 -->
		<!-- 세션ID(sId) 가 있을 경우 회원ID, 로그아웃(Logout.me)링크 표시 -->
		<%if(sid == null) {%>
			<a href="LoginForm.me">Login</a> | <a href="JoinForm.me">Join</a>
		<%} else { %>
			Welcome <%=sid %> :D | <a href="Logout.me">Logout</a>
		<%} %>
	</header>
	<section id="passForm">
		<form name="deleteForm" action="BoardDeletePro.bo?board_num=<%=board_num %>&page=<%=nowPage %>" method="post">
<!-- 		<form name="deleteForm" action="BoardDeletePro.bo" method="post"> -->
<%-- 			<input type="hidden" name="board_num" value="<%=board_num %>" /> --%>
<%-- 			<input type="hidden" name="page" value="<%=nowPage %>" /> --%>
			<table>
				<tr>
					<td>
						<label>Post password</label><br>
						<input type="password" name="board_pass" required="required" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="Delete" />
						&nbsp;&nbsp;<input type="reset" value="Back" onclick="history.back()" />
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>