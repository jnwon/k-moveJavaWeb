<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="../rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>

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
  
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .last {
float: left;
}
  </style>
  
    <!-- DataTable Initialising -->
  <script type="text/javascript">
    $(document).ready( function () {
      $('#listTable').DataTable();
    } );
  </script>
  <!-- End of DataTable Initialising -->
  <script type="text/javascript" language="javascript">

	var rootAddress = "<%=rootAddress%>";
	var url = "http://" + rootAddress + "/testForKmove/EventListForMainController";
 
    $(document).ready(function(){
    	
        $.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : url,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            dataType : "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            success : function(data){
                console.log(data);
                          
                //var length = data.length > 3 ? 3 : data.length;
                for(i=0; i < data.length; i++){
                    var datetime = data[i].publishedDate.split(" ");
                    var date = datetime[0].split("-");
                    var month = "";
                    switch(Number(date[1])){
                    	case 1: month = 'Jan';
                    		break;
                    	case 2: month = 'Feb';
                			break;
                    	case 3: month = 'Mar';
            				break;
                    	case 4: month = 'Apr';
            				break;
                    	case 5: month = 'May';
        					break;
                    	case 6: month = 'Jun';
        					break;
                    	case 7: month = 'Jul';
        					break;
                    	case 8: month = 'Aug';
        					break;
                    	case 9: month = 'Sep';
        					break;
                    	case 10: month = 'Oct';
        					break;
                    	case 11: month = 'Nov';
        					break;
                    	case 12: month = 'Dec';
        					break;
                    }                	
                    
                  
    				html = '<tr>';
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
	        		
	                $("#eventAllList").append(html);	
                }
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
<table class="table" id="listTable">    <!-- Datatable id mapping -->
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Title</th>
	  <th scope="col">Locked</th>
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

<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>
