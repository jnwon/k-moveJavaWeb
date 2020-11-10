<%@page import="vo.BoardBean"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Action 클래스에서 request 객체의 setAttibute() 메서드로 저장되어 전달된 객체 가져오기(Object 타입이므로 형변환 필요)
	ArrayList<BoardBean> articleList = (ArrayList<BoardBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	// PageInfo 객체로부터 페이징 정보 가져오기
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage(); 
	int startPage = pageInfo.getStartPage(); 
	int endPage = pageInfo.getEndPage(); 
	int maxPage = pageInfo.getMaxPage();

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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Board</title>
<style type="text/css">
#	#registForm {
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 800px;
		border: 1px solid darkgray;
	}
	
	a {
		text-decoration: none;
	}

	#tr_top {
		background: orange;
		width: 800px; 
		text-align: center;
	}
	
	#writeButton {
		margin: auto;
		width: 800px;
		text-align: right;
	}
	
	#pageList {
		margin: auto;
		width: 800px;
		text-align: center;
	}
	
	#emptyArea {
		margin: auto;
		width: 800px;
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
	
	<!-- 게시판 리스트 -->
	<section>
		<h2>Board List</h2>
		<table>
		<%if(articleList != null & listCount > 0) {%>
			<tr id="tr_top">
				<td width="100">Number</td>
				<td width="400">Subject</td>
				<td width="150">Name</td>
				<td width="150">Date</td>
				<td width="100">Read Count</td>
			</tr>
		<%for(int i = 0; i < articleList.size(); i++) {%>
				<tr>
					<td align="center"><%=articleList.get(i).getBoard_num() %></td>
					<td>
					<!-- 답글일 경우 들여쓰기를 위해 들여쓰기 레벨(board_re_lev)에 따른 표시 -->
					<%if(articleList.get(i).getBoard_re_lev() != 0) {%>
							<%for(int j = 0; j <= articleList.get(i).getBoard_re_lev() * 2; j++) {%>
									&nbsp;
							<%} %>▶
					<%} else {%>
							▶
					<%} %>
						<a href="BoardDetail.bo?board_num=<%=articleList.get(i).getBoard_num()%>&page=<%=nowPage%>">
							<%=articleList.get(i).getBoard_subject() %>
						</a>
					</td>
					<td align="center"><%=articleList.get(i).getBoard_name() %></td>
					<td align="center"><%=articleList.get(i).getBoard_date() %></td>
					<td align="center"><%=articleList.get(i).getBoard_readcount() %></td>
				</tr>
			<%} %>
		</table>
	</section>
	<section id = "writeButton">
		<a href="BoardWriteForm.bo"><input type="button" value="Post"></a>
	</section>
	
	<!-- 페이지 목록 버튼 표시 -->
	<!-- 이전 페이지 또는 다음 페이지가 존재할 경우에만 해당 하이퍼링크 활성화 -->
	<!-- 존재하는 페이지 번호만 표시(현재 페이지는 번호만 표시하고, 나머지 페이지는 하이퍼링크 활성화) -->
	<section id="pageList">
	<%if(nowPage <= 1) {%>
			[BEFORE]&nbsp;
	<%} else {%>
			<a href="BoardList.bo?page=<%=nowPage - 1%>">[BEFORE]</a>&nbsp;
	<%} %>
	
	<%for(int i = startPage; i <= endPage; i++) {
			if(i == nowPage) {%>
					[<%=i %>]
		<%} else { %>
				<a href="BoardList.bo?page=<%=i %>">[<%=i %>]</a>&nbsp;
		<%} %>
	<%} %>
	
	<%if(nowPage >= maxPage) {%>
			&nbsp;[NEXT]
	<%} else {%>
			<a href="BoardList.bo?page=<%=nowPage + 1%>">&nbsp;[NEXT]</a>
	<%} %>
	</section>
<%} else {%>
	<section id="emptyArea">There's no registered post yet.</section>
<%} %>
</body>
</html>