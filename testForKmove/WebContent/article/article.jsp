<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            	console.log(data);
        	}
    	});

    });
</script>
  
  
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  #writeButton { text-align: right; }

  </style>
  
  <!-- DataTable Initialising -->
  <script type="text/javascript">
    $(document).ready( function () {
      $('#listTable').DataTable();
    } );
  </script>
  <!-- End of DataTable Initialising -->
<style>
.last {
float: left;
}
</style>
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
      	<h2>ARTICLES</h2>
      </div>
	  <div class="col-sm-1 last">
		<section id="writeButton"> <a href="articleForm.jsp"><button type="submit" class="btn btn-primary">Post</button></a> </section><br>
	</div>
	</div> <!-- 버튼 나란히 하기 -->
	
		<table class="table" id="listTable">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">First</th>
		      <th scope="col">Last</th>
		      <th scope="col">Handle</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		    <tr>
		      <th scope="row">1</th>
		      <td><a href="articleDetail.jsp">Mark</a></td>
		      <td>Otto</td>
		      <td>@mdo</td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>Jacob</td>
		      <td>Thornton</td>
		      <td>@fat</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>@twitter</td>
		    </tr>
		    <tr>
		      <th scope="row">4</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>@twitter</td>
		    </tr>
		    <tr>
		      <th scope="row">5</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>@twitter</td>
		    </tr>
		    <tr>
		      <th scope="row">6</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>@twitter</td>
		    </tr>
		    <tr>
		      <th scope="row">7</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>@twitter</td>
		    </tr>
		    <tr>
		      <th scope="row">8</th>
		      <td>Larry</td>
		      <td>the Bird</td>
		      <td>@twitter</td>
		    </tr>
		  </tbody>
		</table>
		
		
    </div>
    

  
    
  </div>
</div>

<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>
