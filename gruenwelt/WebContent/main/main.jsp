<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Umwalt</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  
/* 기사 나란히 정렬 */
@media screen and (min-width: 45em), print and (min-width: 45em)
.row>.col {
    float: left;
}

/* 기사 나란히 정렬 */
@media screen and (min-width: 45em), print and (min-width: 45em)
.cols-3.row>.col {
    width: 33.33334%;
}

/* 기사 정렬부분 */
.col {
    padding: 0 1em;
}
/* 기사 정렬부분 */
.article3 {
    padding-left: 3ch;
    width: 275px;
}
.last {
float: left;
}


/* 페이지 크기다를때 정렬바뀌는부 */
@media screen and (min-width: 40em), print and (min-width: 40em)
.cols-3>.col:first-child {
    width: 100%;
}

/* 페이지 크기다를때 정렬바뀌는부 */
@media screen and (min-width: 40em), print and (min-width: 40em)
.cols-3>.col {
    float: left;
    width: 50%;
}

/* 버튼 오른쪽정렬 */
  #writeButton { text-align: right; }

  </style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<!-- global news [emilia] start -->
<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
      <h2>INTERNATIONAL ENVIRONMENT NEWS</h2>
		<jsp:include page="../e/globalNews.jsp"></jsp:include>
<br>
<!-- global news [emilia] end -->

<!-- 광고3개시작 -->
		<!-- eea [Finn] start -->
		<div class="row row-b cols-3">          
		<div class="col">      
			<div class="panel-pane pane-epa-core-html-pane">
				<jsp:include page="../f/eea.jsp"></jsp:include>
			</div>
     	 </div>              
		<!-- eea [Finn] end -->

		<!-- usepa [Dambi] start -->
	      <div class="col">      
			<div class="panel-pane pane-epa-core-html-pane">
				<jsp:include page="../d/usepa.jsp"></jsp:include>

				</div>
		 	 </div>              
		<!-- usepa [Dambi] end -->
      
      	<!-- unep [Benedict] start -->
			<div class="col">      
				<div class="panel-pane pane-epa-core-html-pane">
					<jsp:include page="../b/unep.jsp"></jsp:include>
				</div>
				</div>          
			</div>
      	<!-- unep [Benedict] end -->
<!-- 광고3개끝 -->

<!-- 이벤트시작 -->
 <div class="last col-sm-6">
      <h2>EVENTS</h2>
            <h5>Title description, Dec 7, 2017</h5>
<div>		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="../img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
<div>		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="../img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
<div>		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="../img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
<div>		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="../img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
</div>
<!-- 이벤트끝 -->

<!-- 맵시작 -->
<div class="last col-sm-6">
	<!-- korea climate map [stefan] start -->
	<jsp:include page="../s/koreaClimateMap.jsp"></jsp:include>
	<!-- korea climate map [stefan] end -->
 </div>
 
    </div>
  </div>
</div>
<!-- 맵끝 -->

<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>