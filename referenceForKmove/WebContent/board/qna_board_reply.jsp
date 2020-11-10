<%@page import="vo.BoardBean"%>
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
	BoardBean article = (BoardBean)request.getAttribute("article");
	String nowPage = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Board</title>
<style type="text/css">
#writeForm{
	width: 500px;
	height: 610px;
	border: 1px solid red;
	margin: auto;
}
h2 {
	text-align: center;
}
table{
	margin: auto;
	width: 450px;
	border: 1px solid darkgray;
}
textarea{
	resize: none;
}
.td_left{
	width: 150px;
	background: orange;
}
.td_right{
	width: 300px;
	background: skyblue;
}
#commandCell{
	text-align: center;
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
	<!-- 게시판 글 답변 -->
	<section id="writeForm">
		<h2>Board Reply</h2>
		<form action="BoardReplyPro.bo" method="post" name="replyForm">
			<input type="hidden" name="page" value="<%=nowPage%>">
			<input type="hidden" name="board_num" value="<%=article.getBoard_num()%>">
			<input type="hidden" name="board_re_ref" value="<%=article.getBoard_re_ref()%>"> 
			<input type="hidden" name="board_re_lev" value="<%=article.getBoard_re_seq()%>">
			<input type="hidden" name="board_re_seq" value="<%=article.getBoard_re_seq()%>">
			<table>
				<tr>
					<td class="td_left"><label for="board_name">Writter</label></td>
					<td class="td_right"><input type="text" name="board_name" id="board_name" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_pass">Password</label></td>
					<td class="td_right"><input type="password" name="board_pass" id="board_pass" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_subject">Subject</label></td>
					<td class="td_right"><input type="text" name="board_subject" id="board_subject" required="required" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_content">Content</label></td>
					<td class="td_right">
						<textarea type="text" name="board_content" id="board_content" cols="40" rows="15" required="required"></textarea></td>
				</tr>
			</table>
			<section ID="commandCell">
				<input type="submit" value="Register reply" />&nbsp;&nbsp;
				<input type="reset" value="Rewrite" />
			</section>
		</form>
	</section>
</body>
</html>