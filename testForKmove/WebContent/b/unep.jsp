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
	
            	for(var i = 0; i < data.length; i++) {
            		for (var j = 0; j < data.length; j++) {

                    	if (data[i].continent == "africa" && data[j].continent == "africa") {
                    			
                    		var date1 = new Date(data[i].date);
                           	var date2 = new Date(data[j].date);
                    			
                            if (date1.valueOf() > date2.valueOf()) {
                    			str += "<li><b>Africa</b></li>"
                   				str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
                    		}
                            	
                            else if (date1.valueOf() == date2.valueOf()) {
                            	if (data[i].no > data[j].no) {
                        			str += "<li><b>Africa</b></li>"
                       				str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
                            	}
                            }
                    	}
            				
            			else if (data[i].continent == "asia" && data[j].continent == "asia") {
            				
            				var date3 = new Date(data[i].date);
                           	var date4 = new Date(data[j].date);
                           	
                           	if (date3.valueOf() > date4.valueOf()) {
                           		str += "<li><b>Asia</b></li>"
                       			str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
                    		}
                           	
                           	else if (date3.valueOf() == date4.valueOf()) {
                            	if (data[i].no > data[j].no) {
                   					str += "<li><b>Asia</b></li>"
                   					str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
            					}
                           	}
            			}
            			
            			else if (data[i].continent == "europe" && data[j].continent == "europe") {
            					
            				var date5 = new Date(data[i].date);
                            var date6 = new Date(data[j].date);
                               	
                            if (date5.valueOf() > date6.valueOf()) {
                   				str += "<li><b>Europe</b></li>"
                   				str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
                            }
                            
                            else if (date5.valueOf() == date6.valueOf()) {
                            	if (data[i].no > data[j].no) {
                            		str += "<li><b>Europe</b></li>"
                           			str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
                            	}
                            }
            			}
            			
            			else if (data[i].continent == "america" && data[j].continent == "america") {
            				
            				var date7 = new Date(data[i].date);
                            var date8 = new Date(data[j].date);
                               	
                            if (date7.valueOf() > date8.valueOf()) {
                     			str += "<li><b>America</b></li>"
                    			str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
            				}
                            
                            else if (date7.valueOf() == date8.valueOf()) {
                            	if (data[i].no > data[j].no) {
                            		str += "<li><b>America</b></li>"
                            		str += "<a href = \"" + data[i].link + "\" target=\"_blank\">" + data[i].title + "</a></br>";
                            	}
                            }
            			}

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
 