<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Gruen Welt</title> 
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
    
		var keyword = 'global warming'; //API 기본 키워 지정한
		keyword = $('#searchInput').attr("placeholder");
		console.log(keyword);
		var newsApi = 'https://newsapi.org/v2/everything?q="'+ keyword +'"&apiKey=7f7ce0c864644f5bb96923e8e0272104'; //키워드뽑아서 기사가져올수있게할수있는 URL
		//$('#linkToArticleController').attr("href", "http://" + rootAddress + "/testForKmove/ArticleBoardController"); //ArticleBoardController로 키워드와 함께 보낼수있도록하기위한 주소지
		var articles;
		ajaxExecute(); // 
		
		// 뉴스 상단에 검색할수있는 기능구현 (클릭으로)
    	$("#newsSearch").click(function(){
    		  keyword = $('#searchInput').val(); //키워드에 검색한 input에 적은 값 넣기 
    		  console.log(keyword); // 키워드 출력해보기 
    		  var newUrl = "http://" + rootAddress + "/testForKmove/ArticleBoardController"; // 더보기를 클릭시 3개뿐아닌 나머지도 불러오기위한 컨트롤러 처리 주소
    		  newUrl += '?keyword="' + keyword + '"'; //검색한 키워드를 같이 받아서 가져가기위한 키워드 전달
    		  console.log(newUrl); //주소가 전달이 잘되었는지 확인위해 출력해보기
    		  window.location.href=newUrl;
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
	            	
	            	articles = data.articles; //newsapi에서 가져와진 articles데이터가져오기
	            	console.log(articles); // articles 데이터 콜솔에 출력해보기 (잘가져왔는지확인을위해)
	            	for(i=0; i < articles.length; i++){ //article가져온 수만큼 돌리기
	            		temp = articles[i].publishedAt.split('T'); //시간부분이 조금 길어서 T를 중심으로 나눠주기
	            		articles[i].publishedAt = temp[0]; // 나눈것 콘솔 확인해보면 인덱스 번호가 매겨져있고 T를 중심으로 나눠진것을 볼수있는데 거기에서 필요한 날짜부분은 0가져온것임
	            	}
	            	$('#listTable').DataTable({ // 데이터 테이블 지정한것 (CSS를 저절로 ? 생성해서 실제 HTML은 이곳에서 확인할수는 없다)
	      	    	  data: articles, //API에서 가져온 자료를 데이터 테이블가져온것에 각각의 자리에 해당 자료를 넣어주기 위한 작업
	      	    	  "aaSorting": [], //datatable 기본 정렬옵션 해
	      	    	    columns: [ 
	      	    	        { data: 'title' }, //title부분지정
	      	    	        { data: 'source.name' }, //출처가져오기
	      	    	        { "width": "15%", data: 'publishedAt' } //시간가져오기 (시간표시부분의 간격이 좁아서 시간이 잘려서 길이 조절을 위한 스타일조절해준것추가)
	      	    	    ]
	      	    	});
	            	
	            	tr = $('#newsAllList').children();
	            	tr.each(function(i){
	            		title = tr.eq(i).children().eq(0).html();
	            		//console.log(articles[i].url);
	            		tr.eq(i).children().eq(0).html('<a href ="'+articles[i].url+'" target="_blank">'+title+'</a>');
	            	});
	            	 
	        		$('#listTable_next').trigger("click");
	        		
	        		tr = $('#newsAllList').children();
	            	tr.each(function(i){
	            		title = tr.eq(i).children().eq(0).html();
	            		//console.log(articles[i].url);
	            		tr.eq(i).children().eq(0).html('<a href ="'+articles[i+10].url+'" target="_blank">'+title+'</a>');
	            	});
	            	
	            	$('#listTable_previous').trigger("click");
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
