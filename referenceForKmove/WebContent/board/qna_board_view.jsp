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
// 전달받은 request 객체에서 데이터 가져오기
	BoardBean article = (BoardBean)request.getAttribute("article"); 
	String nowPage = (String)request.getAttribute("page");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Board</title>
<style type="text/css">
#articleForm{
	width: 500px;
	height: 500px;
	border: 1px solid red;
	margin: auto;
	}
h2{
	text-align: center;
	}
#basicInfoArea{
	height: 40px;
	text-align: center;
	}
#articleContentArea{
	background: orange;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;/* 지정 영역 크기 이상일 경우 자동으로 스크롤바 생성*/
	}
#commandList{
	margin: auto;
	width: 500px;
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
	<!-- 게시판 글 조회 -->
	<section id="articleForm">
		<h2>View post detail</h2>
		<section id="basicInfoArea">
			Subject : <%=article.getBoard_subject() %><br>
			Attachments : 
			<%if(article.getBoard_file() != null) { %>
				<a href="BoardFileDown.bo?file_name=<%=article.getBoard_file()%>" target="blank"><%=article.getBoard_file() %></a>
			<%} %>
		</section>
		<section id="articleContentArea">
			<%=article.getBoard_content() %>
		</section>
	</section>
	<section id="commandList">
		<a href="BoardReplyForm.bo?board_num=<%=article.getBoard_num()%>&page=<%=nowPage %>"><input type="button" value="Reply"></a>
		<a href="BoardModifyForm.bo?board_num=<%=article.getBoard_num()%>&page=<%=nowPage %>"><input type="button" value="Modify"></a>
		<a href="BoardDeleteForm.bo?board_num=<%=article.getBoard_num()%>&page=<%=nowPage %>"><input type="button" value="Delete"></a>
		<a href="BoardList.bo?page=<%=nowPage%>"><input type="button" value="List"></a>
	</section>
</body>
</html>