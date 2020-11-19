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
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>
  
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .last {
float: left;
}
#eventListTable {
    width: 100%;
}
  </style>
  
    <!-- DataTable Initialising -->
<!--   <script type="text/javascript">
	$(document).ready( function () {
	      $('#listTable').DataTable();
	    } );
  </script> -->
  <!-- End of DataTable Initialising -->
  <script type="text/javascript" language="javascript">
  	
	var rootAddress = "<%=rootAddress%>";
	var url = "http://" + rootAddress + "/testForKmove/EventListForMainController";
  	
    $(document).ready(function(){
    	var eventArticles;
		
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : url,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            success : function(data){

                console.log(data);
                console.log(eventArticles);                          
                //var length = data.length > 3 ? 3 : data.length;
            	$('#eventListTable').DataTable({ // 데이터 테이블 지정한것 (CSS를 저절로 ? 생성해서 실제 HTML은 이곳에서 확인할수는 없다)
	      	    	  data: eventArticles, //API에서 가져온 자료를 데이터 테이블가져온것에 각각의 자리에 해당 자료를 넣어주기 위한 작업
	      	    	  "aaSorting": [], //datatable 기본 정렬옵션 해
	      	    	  columns: [ 
	      	    	        { data: 'title' }, //title부분지정
	      	    	        { data: 'isLocked' }, //title부분지정
	      	    	        { data: 'writer' }, //출처가져오기
	      	    	        { "width": "15%", data: 'publishedDate' } //시간가져오기 (시간표시부분의 간격이 좁아서 시간이 잘려서 길이 조절을 위한 스타일조절해준것추가)
	      	    	    ]
	      	    	});
                 
   				/* html = '<tr>';
			  		html += '<th scope="row">1</th>';
		  			html += '<td><a href="eventDetail.jsp">'+ data[i].title +'</a></td>';
		  			if(data[i].isLocked){
   						html += '<td> ᛄ </td>';
   					} else {
   						html += '<td></td>';
   					}
  					html += '<td>'+ data[i].writer +'</td>';
  						html += '<td>'+ date[2] + '. ' + month +'</td>';
  					html += '</tr>'; */
        		
                //$("#eventAllList").append(html);	
            }  
        });
    	
    });
</script>
  
</head>
<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
    <div> <!-- 버튼 나란히 하기 --><!-- style="border: 1px solid #212529;" --> 
	  <div class="col-sm-11 last">
      <h2>COMMUNITIES</h2>
      </div>
	  <div class="col-sm-1 last">
      <section id="writeButton"> <a href="eventForm.jsp"><button type="submit" class="btn btn-primary">Post</button></a> </section><br>
	</div>
	</div> <!-- 버튼 나란히 하기 -->
    <!-- <table class="table">  -->  
<table class="table" id="eventListTable" style="width: 100%;">    <!-- Datatable id mapping -->
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Title</th>
	  <th scope="col">Locked</th>
      <th scope="col">Organizer</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody id="">
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

<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>
