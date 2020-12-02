<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

<script type="text/javascript" language="javascript">


$(document).ready(function(){
	
	  $.ajax({
          type : "GET", //전송방식을 지정한다 (POST,GET)
          url : "/<%=projectName%>/Eea.do",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
          dataType : "json", //호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
          error : function(){    alert("통신실패!!!!");   },
          success : function(data){      
        	  var num = 10;
        	  console.log(data);
        	  $("#link1").attr("href", data[0].link);
        	  $("#link1").text(data[0].title);
        	  
        	  $("#link2").attr("href", data[1].link);
        	  $("#link2").text(data[1].title);
        	  
        	  $("#link3").attr("href", data[2].link);
        	  $("#link3").text(data[2].title);
        	  
        	  $("#link4").attr("href", data[3].link);
        	  $("#link4").text(data[3].title);
          }  
      });
 
});


</script>

<!-- finn start -->

<div class="pane-content">
   <h2>European Environment <br> Agency</h2>
	<div class="figure image mode-full" style="width:275px"><a href="/radon/radon-resources-individuals-and-families"><span class="figure image file file-image file-image-jpeg view-mode-full" style="width:275px;"><img alt="Radon Resources for Individuals and Families" height="150" width="275" class="media-element file-full" src="img/radon1.jpg"></span></a></div>
		<ul class="article3">
			<li><a href="#" target="_blank" id="link1">loading..</a></li>
			<li><a href="#" target="_blank" id="link2">loading..</a></li>
			<li><a href="#" target="_blank" id="link3">loading..</a></li>
			<li><a href="#" target="_blank" id="link4">loading..</a></li>
		</ul>  
</div>
	
<!-- finn end -->
	