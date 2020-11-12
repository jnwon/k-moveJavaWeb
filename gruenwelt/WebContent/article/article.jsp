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
  
</head>
<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
      <h2>ARTICLES</h2>
      <h5>Title description, Dec 7, 2017      
      </h5>

<section id="writeButton"> <a href="articleForm.jsp"><button type="submit" class="btn btn-primary">Post</button></a> </section><br>

    
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