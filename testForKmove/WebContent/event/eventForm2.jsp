<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GRÜNWELT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- datetimepicker -->
<script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
  <!-- datetimepicker -->
    <!-- for open event -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
 -->  <!-- for open event -->

  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
 /* for open event */ 
  #radioBtn .notActive{
    color: #3276b1;
    background-color: #fff;
}
  </style> 
  <script type="text/javascript">
  $(document).ready( function () {        
      $("#toEventList").click(function(){
    	  window.location.href="/testForKmove/EventListController";
      	});
    });
  
  </script> 
<!-- datetimepicker start -->
<script type="text/javascript">
$(function () {
	$('#dtpickerdemo').datetimepicker();
});
</script>
<!-- datetimepicker end -->
</head>
<body>

<!-- Navbar --> 
<jsp:include page="../inc/top.jsp"></jsp:include>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-8">

<form action="" method="post" enctype="multipart/form-data" name="">
    <!-- datetimepicker : 
    real demo: https://www.jquery-az.com/boots/demo.php?ex=20.0_1 
    ref site :https://www.jquery-az.com/bootstrap-datetimepicker-managing-with-date-and-time-in-bootstrap/-->
		  <div class="form-group">
		    <label for="dtpickerdemo" class="control-label"><h5>Select date/time:</h5></label>
		    <div class='col-sm-4 input-group date' id='dtpickerdemo'>
		         <input type='text' class="form-control" />
		         <span class="input-group-addon">
		             <span class="glyphicon glyphicon-calendar"></span>
		         </span>
		     </div>
		  </div>    
        <script type="text/javascript">
            $(function () {
                $('#dtpickerdemo').datetimepicker();
            });
        </script>

		     <!-- open or private -->
    <label class="radio-inline">
      <input type="radio" name="optradio" checked>Public Event
    </label>
    <label class="radio-inline">
      <input type="radio" name="optradio">Private Event
    </label>
<br>
		     <!-- open or private -->

    <!-- datetimepicker end -->
  
<!--   <div class="form-group">
        <label for="happy" class="col-sm-4 col-md-4 control-label text-right">Will you open this event to everyone ?</label>
        <div class="col-sm-7 col-md-7">
          <div class="input-group">
            <div id="radioBtn" class="btn-group">
              <a class="btn btn-primary btn-sm active" data-toggle="happy" data-title="Y">YES</a>
              <a class="btn btn-primary btn-sm notActive" data-toggle="happy" data-title="N">NO</a>
            </div>
            <input type="hidden" name="happy" id="happy">
          </div>
</div>
  </div> -->
       <!-- for open event start -->
<!-- 	  <script type="text/javascript">
		$('#radioBtn a').on('click', function(){
		    var sel = $(this).data('title');
		    var tog = $(this).data('toggle');
		    $('#'+tog).prop('value', sel);
		     
		    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
		    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
		})
	  </script> -->
       <!-- for open event end -->
    
    <div class="form-group">
  <div class="row">
    <div class="col">
      <label for="exampleFormControlInput1"><h5>open to everyone</h5></label>
      <input type="text" class="form-control" placeholder="User info">
    </div>
    <div class="col">
      <label for="exampleFormControlInput1"><h5>password</h5></label>
      <input type="password" class="form-control" placeholder="hits number">
    </div>
  </div>
  </div>
  
    <div class="form-group">
    <label for="exampleFormControlInput1"><h5>your event location</h5></label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="your event location">
  </div>
   
      <div class="form-group">
    <label for="exampleFormControlInput1"><h5>your event title</h5></label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="your event name">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">
    <div class="chunk flush--all _descriptionStep-module_body__3o5uS">
    <h5>describe what your event will be about</h5>
		<p class="text--body">
		<span>
		People will see this when we promote your group, but you’ll be able to add to it later, too.</span>
		</p>
		<ul class="_descriptionStep-module_descriptionConsiderations__34Nb4">
		<li>
		<span>
		What's the purpose of the group?</span>
		</li>
		<li>
		<span>
		Who should join?</span>
		</li>
		<li>
		<span>
		What will you do at your events?</span>
		</li>
		</ul>
	</div>
    </label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="11" placeholder="describe what your group will be about"></textarea>
  </div>
  
  <div class="custom-file mb-3">
    <input type="file" class="custom-file-input" id="validatedCustomFile" required>
    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div>
 
<input type="hidden" name="writer" value="board">
<input type="hidden" name="isOpened" value="board">
<input type="hidden" name="numOfAttachLinks" value="board">
<input type="hidden" name="numOfJoiningMembers" value="board">
<input type="hidden" name="numOfComment" value="board">
<input type="hidden" name="numOfViews" value="board">
<input type="hidden" name="numOfLikes" value="board">
 
   <div class="form-group row">
    <div class="col-sm-1">
      <button type="submit" class="btn btn-primary">Register</button>
    </div>
    
        <div class="col-sm-1">
      <button type="submit" class="btn btn-primary" id="toEventList">List</button>
    </div>
    
  </div>
  
</form>



    </div>
  </div>
</div>

<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>
