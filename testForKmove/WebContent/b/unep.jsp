<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = " java.util.*,b.controller.*"
    pageEncoding="UTF-8"
    isELIgnored = "false"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<!-- Benedikt start -->
<body>
<div class="pane-content">
   <h2>UN Environment <br> Programme</h2>
	<div class="figure image mode-full" style="width:275px"><a href="https://www.unep.org/"><span class="figure image file file-image file-image-jpeg view-mode-full" style="width:280px;"><img alt="UNEP site" title="UN Environment Programme" height="153" width="280" class="media-element file-full" src="../img/logo_unep.png"></span></a></div>
		<ul class="article3">
		<br>
		<table border = "1">
			<tr align = "center">
				<td><b>제목</b></td>
				<td><b>링크</b></td>
			</tr>
			<c:choose>
				<c:when test = "${linksList == null}">
				<tr>
				<td colspan = 2>
					<b>NOT FOUND</b>
				</td>
				</tr>
				</c:when>
				<c:when test = "${linksList != null}">
					<c:forEach var = "seit" items = "${linksList}">
						<tr>
							<td>${seit.title}</td>
							<td>${seit.link}</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</ul>
</div>
</body>
</html>
<!-- Benedikt end -->
 