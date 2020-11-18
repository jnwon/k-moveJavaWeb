<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = " java.util.*,unep.controller.*"
    pageEncoding="UTF-8"
    isELIgnored = "false"%>

<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

<script type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
	var u_url = "http://" + rootAddress + "/testForKmove/UnepController";
 
    $(function(){
    	
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : u_url,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            success : function(args){
            	console.log(args)

                var str = ""; 
				for(var i = 0; i < args.length; i++) {
               		str += "<a href = \"" + args[i].link + "\"><li><b>" + args[i].title + "</b></li></a>";
				}
				
                $("#result_list").append(str);
                
            }
        });
    });
</script>

<!-- UNEP start -->

<div class="pane-content">
   <h2>UN Environment <br> Programme</h2>
	<div class="figure image mode-full" style="width:275px"><a href="https://www.unep.org/"><span class="figure image file file-image file-image-jpeg view-mode-full" style="width:280px;"><img alt="UNEP site" title="UN Environment Programme" height="153" width="280" class="media-element file-full" src="../img/logo_unep.png"></span></a></div>
		<ul class="article3">
			<div id = "result_list">
		</ul>
</div>

<!-- UNEP end -->
 