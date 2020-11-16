<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

<script type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
	var url = "http://" + rootAddress + "/testForKmove/EEA";
 
    $(document).ready(function(){
    /*	
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : url,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                alert("통신실패!!!!");
            },
            success : function(data){
                /$("#Parse_Area").html(data); //div에 받아온 값을 넣는다.
            }  
        });
    */
    	$.ajax({
        	type : "GET", //전송방식을 지정한다 (POST,GET)
        	url : "https://newsapi.org/v2/everything?q=bitcoin&apiKey=7f7ce0c864644f5bb96923e8e0272104",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        	dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        	error : function(){
            	console.log("connection down!!!!");
        	},
        	success : function(data){
            	//console.log(data);
        	}
    	});

    });
</script>

<!-- finn start -->

<div class="pane-content">
   <h2>European Environment <br> Agency</h2>
	<div class="figure image mode-full" style="width:275px"><a href="/radon/radon-resources-individuals-and-families"><span class="figure image file file-image file-image-jpeg view-mode-full" style="width:275px;"><img alt="Radon Resources for Individuals and Families" height="150" width="275" class="media-element file-full" src="../img/radon1.jpg"></span></a></div>
		<ul class="article3">
			<li><a href="/radon/health-risk-radon">Health Risk of Radon</a></li>
			<li><a href="/radon/citizens-guide-radon-guide-protecting-yourself-and-your-family-radon">Citizen's Guide to Radon</a></li>
			<li><a href="/radon/find-radon-test-kit-or-measurement-and-mitigation-professional">Find a Radon Test Kit or Measurement and Mitigation Professional</a></li>
			<li><a href="https://archive.epa.gov/water/archive/web/html/index-9.html">Radon in Drinking Water</a></li>
		</ul>  
</div>
	
<!-- finn end -->
	