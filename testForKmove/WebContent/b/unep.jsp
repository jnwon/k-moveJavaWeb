<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style>
	.ca { text-transform: capitalize; }
</style>
</head>

<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

<script type="text/javascript" language="javascript"> 

	var rootAddress = "<%=rootAddress%>";
	var crawlUrl = "http://" + rootAddress + "/testForKmove/CrawlController";
	//var unepUrl = "http://" + rootAddress + "/testForKmove/UnepController";
	
	$(document).ready(function(){
    	
        $.ajax({
            type: "GET", //전송방식을 지정한다 (POST,GET)
            url: crawlUrl,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error: function(){
                console.log("connection down!!!!");
            },
            success: function(data){
            	console.log(data);

                var str = "";
                
                var AfricaMaxDate = new Date(data[0].date).valueOf();
                var AsiaMaxDate = new Date(data[10].date).valueOf();
                var EuropeMaxDate = new Date(data[20].date).valueOf();
                var AmericaMaxDate = new Date(data[30].date).valueOf();
                
                for(var i = 0; i < data.length; i++) {
            		if (data[i].continent == "africa") {
            			var africaContinent = "Africa";
            			if (AfricaMaxDate == new Date(data[i].date).valueOf()) {
            				continue;
            			}
            			else if (AfricaMaxDate < new Date(data[i].date).valueOf()) {
            				AfricaMaxDate = new Date(data[i].date).valueOf();
            				var africaTitle = data[i].title;
            				var africaLink = data[i].link;
            			}
            			else if (AfricaMaxDate > new Date(data[i].date).valueOf()) {
            				var africaTitle = data[0].title;
            				var africaLink = data[0].link;
            			}
            		}
               
            		else if (data[i].continent == "asia") {
            			var asiaContinent = "Asia";
            			if (AsiaMaxDate == new Date(data[i].date).valueOf()) {
            				continue;
            			}
            			else if (AsiaMaxDate < new Date(data[i].date).valueOf()) {
            				AsiaMaxDate = new Date(data[i].date).valueOf();
            				var asiaTitle = data[i].title;
            				var asiaLink = data[i].link;
            			}
            			else if (AsiaMaxDate > new Date(data[i].date).valueOf()) {
            				var asiaTitle = data[10].title;
            				var asiaLink = data[10].link;
            			}
            		}
               		
            		else if (data[i].continent == "europe") {
            			var europeContinent = "Europe";
            			if (EuropeMaxDate == new Date(data[i].date).valueOf()) {
            				continue;
            			}
            			else if (EuropeMaxDate < new Date(data[i].date).valueOf()) {
            				EuropeMaxDate = new Date(data[i].date).valueOf();
            				var europeTitle = data[i].title;
            				var europeLink = data[i].link;
            			}
            			else if (EuropeMaxDate > new Date(data[i].date).valueOf()) {
            				var europeTitle = data[20].title;
            				var europeLink = data[20].link;
            			}
            		}
            		
            		else if (data[i].continent == "america") {
            			var americaContinent = "America";
            			if (AmericaMaxDate == new Date(data[i].date).valueOf()) {
            				continue;
            			}
            			else if (AmericaMaxDate < new Date(data[i].date).valueOf()) {
            				AmericaMaxDate = new Date(data[i].date).valueOf();
            				var americaTitle = data[i].title;
            				var americaLink = data[i].link;
            			}
            			else if (AmericaMaxDate > new Date(data[i].date).valueOf()) {
            				var americaTitle = data[30].title;
            				var americaLink = data[30].link;
            			}
            		}
                }
				//africaContinent.charAt(0).toUpperCase() + africaContinent.slice(1, continent.length)
                str += "<li><b>" + africaContinent + "</b></li>"
                str += "<a href = \"" + africaLink + "\" target=\"_blank\">" + africaTitle + "</a></br>";
                
                str += "<li><b>" + asiaContinent + "</b></li>"
                str += "<a href = \"" + asiaLink + "\" target=\"_blank\">" + asiaTitle + "</a></br>";
                
                str += "<li><b>" + europeContinent + "</b></li>" 
                str += "<a href = \"" + europeLink + "\" target=\"_blank\">" + europeTitle + "</a></br>";
                
                str += "<li><b>" + americaContinent + "</b></li>"
                str += "<a href = \"" + americaLink + "\" target=\"_blank\">" + americaTitle + "</a></br>";
				
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
 