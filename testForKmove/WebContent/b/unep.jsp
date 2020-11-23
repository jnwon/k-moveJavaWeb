<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

<script type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
	var unepUrl = "http://" + rootAddress + "/testForKmove/UnepController";
 
	$(document).ready(function(){
    	
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : unepUrl,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            success : function(data){
            	console.log(data)

                var str = "";
            	
            	//if (data[i].date )
            	
            	for(var i = 0; i < data.length; i++) {
            		if (data[i].continent == "africa") {
                    	str += "<li><b>Africa</b></li>"
                   		str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>" + data[i].date;
            		}
            			
            		else if (data[i].continent == "asia") {
                   		str += "<li><b>Asia</b></li>"
                   		str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
            		}
            			
            		else if (data[i].continent == "europe") {
                   		str += "<li><b>Europe</b></li>"
                   		str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
            		}
            			
            		else if (data[i].continent == "america") {
                     	str += "<li><b>America</b></li>"
                    	str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
            		}
            	}
				
                $("#resultUnepList").append(str);
                
            } 
        });
    });
</script>

<!-- UNEP start -->

<div class="pane-content">
   <h2>UN Environment <br> Programme</h2>
	<div class="figure image mode-full" style="width:275px"><a href="https://www.unep.org/"><span class="figure image file file-image file-image-jpeg view-mode-full" style="width:280px;"><img alt="UNEP site" title="UN Environment Programme" height="153" width="280" class="media-element file-full" src="img/logo_unep.png"></span></a></div>
		<ul class="article3">
			<div id="resultUnepList"></div>
		</ul>
</div>

<!-- UNEP end -->
 