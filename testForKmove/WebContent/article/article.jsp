<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap 4 Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">		<!-- DataTable CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>       <!-- DataTable CDN -->
  
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

<script type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
	//var url = "http://" + rootAddress + "/testForKmove/EEA";
 
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
    
		var keyword = 'global warming'; //API 기본 키워 지정한
		var newsApi = 'https://newsapi.org/v2/everything?q="'+ keyword +'"&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //키워드뽑아서 기사가져올수있게할수있는 URL
		//$('#linkToArticleController').attr("href", "http://" + rootAddress + "/testForKmove/ArticleBoardController"); //ArticleBoardController로 키워드와 함께 보낼수있도록하기위한 주소지
		var articles;
		ajaxExecute(); // 
		
		// 뉴스 상단에 검색할수있는 기능구현 (클릭으로)
    	/* $("#newsSearch").click(function(){
    		  keyword = $('#searchInput').val(); //키워드에 검색한 input에 적은 값 넣기 
    		  console.log(keyword); // 키워드 출력해보기
    		  newsApi = 'https://newsapi.org/v2/everything?q="'+ keyword +'"&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //뉴스 API 주소 가져오기
    		  $('#newsIndicators').empty(); // 창 다른거볼수있게 창 넘어가는 수 초기화 (검색시 조회되는 글의 수가 1개면 1개남고 2개면 2개만 보일수있도록하기위함)
    		  $("#newsList").empty(); //검색하면 메인페이지에서 글 수가 바뀌는데 이전에 초기기본으로 지정해준 글 3개를 비워주어야함 
    		  ajaxExecute(); // ajaxExecute() 실행시키기 
    		  var newUrl = "http://" + rootAddress + "/testForKmove/ArticleBoardController"; // 더보기를 클릭시 3개뿐아닌 나머지도 불러오기위한 컨트롤러 처리 주소
    		  newUrl += '?keyword="' + keyword + '"'; //검색한 키워드를 같이 받아서 가져가기위한 키워드 전달
    		  console.log(newUrl); //주소가 전달이 잘되었는지 확인위해 출력해보기
    		  $('#linkToArticleController').attr("href", newUrl); // 컨트롤러에 키워드 검색하여 얻은 자료를 넘겨주기위한 URL 연결
    	}); */
    	function ajaxExecute(){

	    	$.ajax({
	        	type : "GET", //전송방식을 지정한다 (POST,GET)
	        	url : "https://newsapi.org/v2/everything?q=bitcoin&apiKey=7f7ce0c864644f5bb96923e8e0272104",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	        	dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
	        	error : function(){
	            	console.log("connection down!!!!");
	        	},
	        	success : function(data){
	            	
	            	articles = data.articles;
	            	console.log(articles);
	            	for(i=0; i<articles.length; i++){
	            		temp = articles[i].publishedAt.split('T');
	            		articles[i].publishedAt = temp[0];
	            	}
	            	$('#listTable').DataTable({
	      	    	  data: articles,
	      	    	    columns: [
	      	    	        { data: 'title' },
	      	    	        { data: 'source.name' },
	      	    	        { "width": "15%", data: 'publishedAt' }
	      	    	    ]
	      	    	});	
	                
	    	    }  
	    	});	
		}
    });
</script>
  
  
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  #writeButton { text-align: right; }

  </style>
  
<style>

</style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
    <div> 
	  <div class="col-sm-11 last">
      	<h2>ARTICLES</h2>
      </div>
	</div> 
	
		<table class="table" id="listTable">
		  <thead>
		    <tr>
		      <!-- <th scope="col">#</th> -->
		      <th scope="col">Title</th>
		      <th scope="col">Fountain</th>
		      <th scope="col">Date</th>
		    </tr>
		  </thead>
		  <tbody id="newsAllList">
		  
		   <!--  <tr>
		     <th scope="row">1</th>
		      <td><a href="articleDetail.jsp">Mark</a></td>
		      <td>Otto</td>
		      <td>@mdo</td>
		    </tr> -->
		    
		  </tbody>
		</table>
    </div>
  </div>
</div>

<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>
