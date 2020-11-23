<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>GRÜNWELT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">   <!-- DataTable CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>       <!-- DataTable CDN -->
  
  <%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="/rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>
  <script type="text/javascript">
    $(document).ready( function () {        
        $("#toEventWrite").click(function(){
      	  window.location.href="/testForKmove/EventWriteController";
        	});
      });
  </script>
  <!-- End of DataTable Initialising -->
  <script type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
	var url = "http://" + rootAddress + "/testForKmove/EventListForMainController";
 	
    $(document).ready(function(){
    	
    	ajaxExecute();
    	
    	function ajaxExecute(){
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : url,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            
            
            success : function(data){
                console.log(data);
                   
	            	for(i=0; i < data.length; i++){ //article가져온 수만큼 돌리기
	            		temp = data[i].publishedDate.split(' '); //시간부분이 조금 길어서 T를 중심으로 나눠주기
	            		data[i].publishedDate = temp[0]; // 나눈것 콘솔 확인해보면 인덱스 번호가 매겨져있고 T를 중심으로 나눠진것을 볼수있는데 거기에서 필요한 날짜부분은 0가져온것임
	            	}

                    //DataTable Initialising 
                    $('#eventlistTable').DataTable({
                    	data: data,
                    	"aaSorting": [],
                    	columns: [
                    		{ data: 'title' },
                    		{ data: 'writer' },
                    		{ "width": "15%", data: 'publishedDate' }
                    	]
                    }); 
                  
	            	//테이블에 title부분에 링크주소 달아주는 작업
	            	tr = $('#eventAllList').children(); //newsAllList:135 아이디준곳(테이블전체)tbody의 자식태그인 tr의 모든 다음줄 돌림(for문처럼=each)
	            	tr.each(function(i){ // 기사한개줄당
	            		title = tr.eq(i).children().eq(0).html(); //tr의 i번째의 자식td의 0번째 즉 title일때 HTML을 적용시키는데 들어오는 새로운? 인자값이 없으면 아무처리안함 (새로운 검색을 하지않았을경우를 말하는듯)
	            		//console.log(articles[i].url);
	            		tr.eq(i).children().eq(0).html('<a href ="' + data[i].url +'" target="_blank">'+title+'</a>'); // 마찬가지로 인자값이 있으면 a태그지정해줌
	            	});
	            	//페이지가 1이상인경우에 a태그를 1페이지에서만 불러온다. 그래서 위는 1페이지에만해당이된다. 총 게시글은 20개만 불러옴으려 2페이지까지 적용시켜주면된다
	        		$('#listTable_next').trigger("click"); // next를 자동으로 클릭하는 트리거 실행 =  페이지를 로드할때 트리거가 발생하여 저절로 next & previous를 실행시켜주어 a태그를 모두 적용시킨다
	        		
	        		tr = $('#eventAllList').children();
	            	tr.each(function(i){
	            		title = tr.eq(i).children().eq(0).html();
	            		//console.log(articles[i].url);
	            		tr.eq(i).children().eq(0).html('<a href ="'+ data[i+10].url +'" target="_blank">'+title+'</a>'); //여기서 아티클에 i+10은 다음페이지에 적용시켜야하기에 +10을 하여 앞의 10개이후의 값 즉 2페이지 부터 적용시키다
	            	});
	            	
	            	$('#listTable_previous').trigger("click"); //previous버튼도 클릭시켜준다( 여기서 listTable_previous,listTable_next는 현제페이지에 없고 데이터테이블에서 저절로 만들기에 웹상에서 개발자보기로가서 참고하여 가져올수있다)

/*     				html = '<tr>';
				  		html += '<th scope="row">1</th>';
			  			html += '<td><a href="eventDetail.jsp">'+ data[i].title +'</a></td>';
			  			if(data[i].isLocked){
	   						html += '<td> ᛄ </td>';
	   					} else {
	   						html += '<td></td>';
	   					}
	  					html += '<td>'+ data[i].writer +'</td>';
   						html += '<td>'+ date[2] + '. ' + month +'</td>';
   					html += '</tr>';
	        		
	                $("#eventAllList").append(html); */	
                //}

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

.last {
float: left;
}
</style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="/inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
    <div> <!-- 버튼 나란히 하기 --><!-- style="border: 1px solid #212529;" --> 
	  <div class="col-sm-11 last">
      <h2>COMMUNITIES</h2>
      </div>
	  <div class="col-sm-1 last">
      <section id="writeButton"><button type="submit" class="btn btn-primary" id="toEventWrite">Post</button></section><br>
	</div>
	</div> <!-- 버튼 나란히 하기 -->
    <!-- <table class="table">  -->  
<table class="table" id="eventlistTable">    <!-- Datatable id mapping -->
  <thead>
    <tr>

 	 <!--  <th scope="col">#</th>  -->

      <th scope="col">Title</th>
<!-- 	  <th scope="col">Locked</th> -->
      <th scope="col">Organizer</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody id="eventAllList">
    <!-- <tr>
      <th scope="row">1</th>
      <td><a href="eventDetail.jsp">Environment meeting</a></td>
      <td>2020.11.12</td>
      <td>2/10</td>
    </tr> -->
    
  </tbody>
</table>
    </div>
  </div>
</div>

<jsp:include page="/inc/bottom.jsp"></jsp:include>

</body>
</html>
