<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.btn-outline-info {
    color: #17a2b8;
    border-color: #17a2b8;
}
.last {
float: left;
}

</style> 
<script type="text/javascript" language="javascript">
 
    $(document).ready(function(){
    /*	
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : url,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "text", //호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                alert("통신실패!!!!");
            },
            success : function(data){
                /$("#Parse_Area").html(data); //div에 받아온 값을 넣는다.
            }  
        });
    */
    	var keyword = 'global warming';
    	var newsApi = 'https://newsapi.org/v2/everything?q="'+ keyword +'"&apiKey=7f7ce0c864644f5bb96923e8e0272104';
    
    	ajaxExecute();
    	
    	$("#newsSearch").click(function(){
    		  keyword = $('#searchInput').text();
    		  console.log(keyword);
    		  ajaxExecute();
    	});
    	
    	
    	function ajaxExecute(){
    		$.ajax({
            	type : "GET", //전송방식을 지정한다 (POST,GET)  
            	url : newsApi,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            	dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            	error : function(){
                	console.log("connection down!!!!");
            	},
            	success : function(data){
                	console.log(data);
                	var articles = data.articles;
                	var length = articles.length > 3 ? 3 : articles.length;
                    for(i=0; i<length; i++){
                        
                    	/* if(i == 0){
    			  		html = '<a href ="'+ articles[i].url +'" target=”_blank” ><div class="carousel-item active">';
                    	}
                    	else{
                    		html = '<a href ="'+ articles[i].url +'" target=”_blank” ><div class="carousel-item">';	
                    	} */
                    	if(i == 0){
        			  		html = '<div class="carousel-item active">';
                        }
                       	else{
                       		html = '<div class="carousel-item">';	
                       	}
    			  			html += '<a href ="'+ articles[i].url +'" target=”_blank” ><img src="'+ articles[i].urlToImage +'" class="d-block w-100" alt="..."></a>';
    			  				html += '<div class="carousel-caption d-none d-md-block">';
    		   						html += '<h5>'+ articles[i].title +'</h5>';
    		   						html += '<p>'+ articles[i].source.name + ' | ' + articles[i].author + '|' + articles[i].publishedAt + '</p>';
    	   						html += '</div>';
    					html += '</div>';
    					        		
            		console.log(html);
                    $("#newsList").append(html);	
    	            }
        	    }  
        	});	
    	}
    	

    });
</script>
   
  
<!-- emilia start -->
<div class="row"> <!-- 버튼 나란히 하기 --><!-- style="border: 1px solid #212529;" --> 
  <div class="col-sm-11 last">
  	<h2>INTERNATIONAL ENVIRONMENT NEWS</h2>
  </div>
   <div class="col-sm-1 last">
    <section id="writeButton"><a href="../article/article.jsp"><button type="submit" class="btn btn-outline-info">more...</button></a> </section><br>
  </div>
</div> <!-- 버튼 나란히 하기 -->

<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner" id="newsList">
    <!-- <div class="carousel-item active">
      <img src="../img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="../img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="../img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
      </div>
    </div> -->
	<!-- <div class="carousel-item active"><img src="https://static01.nyt.com/images/2020/11/03/climate/00CLI-LEGACY1/00CLI-LEGACY1-facebookJumbo.jpg" class="d-block w-100" alt="..."><div class="carousel-caption d-none d-md-block"><h5>Trump's Climate Policies Accelerated Global Warming</h5><p>New York Times | Coral Davenport|2020-11-09T18:33:36Z</p></div></div>
	<div class="carousel-item"><img src="https://static01.nyt.com/images/2020/11/10/climate/10CLI-HURRICANES1/10CLI-HURRICANES1-facebookJumbo.jpg" class="d-block w-100" alt="..."><div class="carousel-caption d-none d-md-block"><h5>5 Things We Know About Climate Change and Hurricanes</h5><p>New York Times | Veronica Penney|2020-11-10T15:18:00Z</p></div></div>
	<div class="carousel-item"><img src="https://static01.nyt.com/images/2020/11/06/climate/00CLI-METHANE1/00CLI-METHANE1-facebookJumbo.jpg" class="d-block w-100" alt="..."><div class="carousel-caption d-none d-md-block"><h5>New Technology Claims to Pinpoint Even Small Methane Leaks From Space</h5><p>New York Times | Paul Tullis|2020-11-11T19:10:13Z</p></div></div> -->    
    
  </div>
  
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div> 
<br>

<!-- emilia end -->
