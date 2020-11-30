<%@page import="event.controller.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	//String sid = null;
//로그인이 되지 않은 상태일 경우 로그인 페이지로 강제 이동 처리
/* 	if(session.getAttribute("sid") == null) {
		out.println("<script>");
		out.println("alert('This service requires a login')");
		out.println("location.href='LoginForm.me'");
		out.println("</script>");
	} else {// 로그인 된 상태일 경우 세션 ID 가져오기
		sid = (String)session.getAttribute("sid");
	} */
// 전달받은 request 객체에서 데이터 가져오기
	EventVO detailedEvent = (EventVO)request.getAttribute("detailedEvent");
	//EventVO detailedEvent2 = (EventVO)request.getAttribute("eventList");

	
%>
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
  <link rel="stylesheet" href="css/facebookstyle.css">
  
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
 
    <%-- Include this file to obtain server's root address wherever using ajax!! --%>
<%@ include file="/rootAddress.jsp" %>
<%-----------------------------------------------------------------------------%>
   <script type="text/javascript" language="javascript">

<%-- 	var rootAddress = "<%=rootAddress%>";
	var url = "http://" + rootAddress + "/testForKmove/EventDetailController?no="++;
	 --%>
	
 	</script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  .last {
float: right;
}

  .fixed {
color: rgba(255, 255, 255, 0.8);
}

.timeline-comment-box {
    /* background: #f2f3f4; */
    margin-left: -25px;
    margin-right: -25px;
    padding: 20px 25px;
}
.eventPic {
    height: 200px;
    background: #aaa;
}
.text{
color: white;
}

  </style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- /.navbar -->

 <!-- start -->
<div class="1">
 
 
<div class="container" style="margin-top:30px">
  <div class="row">
    <!-- EVENT TITLE START -->
    <div class="bounds bounds--wide">
		<div class="pageHead--wrapper">
			<div class="pageHead">
				<div class="flex flex--column atMedium_flex--row flex--alignBottom pageHead-pageTitle">
				<div class="flex-item flex-item--2 pageHead--titleArea">
					<p class="pageHead-pageTitleLabel text--medium text--secondary">
						<time class="eventStatusLabel" datetime="1606399200000">
							<span>
							Thursday, November 26, 2020
							</span>
						</time>
					</p>
				<h1 class="pageHead-headline text--pageTitle">
				<%=detailedEvent.getTitle()%></h1>
				<div class="flex flex--row flex--alignCenter event-host-info">
					<div class="flex-item flex-item--shrink">
					    <div class="timeline-header">
					       <span class="userimage">
					       <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
					       </span>
					
						<div class="flex-item event-info-hosts-text valign--middle">
							<a href="/hvhikers/events/274786161/attendees/">
						<span>
							<span class="">
								Hosted by
								 <span class="text--bold event-hosts-info-no-link">
								 <%=detailedEvent.getWriter()%>
								 </span>
							 
							</span>
						</span>
						</a>
						</div>
						</div>
				 	</div>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
    <!-- EVENT TITLE END -->

<!-- favorite and join starat with Sticky Navbar-->

   <!-- Navbar -->
   <nav class="navbar bg-dark navbar-expand-sm navbar-dark sticky-top" style="position: -webkit-sticky;position: sticky;top: 0;z-index: 1020; width: 100%;">
      <div class="fixed">
      <div>
               
        <div class="flex flex--row flex--spaceBetween flex--alignCenter _EventStickyFooter-module_footerContent__bOcM4" data-e2e="event-footer">
			<div class="flex-item flex-item--shrink col-sm-7">
				<div class="flex flex--column">
					<div class="flex-item" data-e2e="event-footer--date-time" data-e2e_timestamp="1606398300000">
						<div class="eventTimeDisplay">
							<time class="" datetime="1606398300000">
								<span class="eventTimeDisplay-startDate">
									<span>
									Thu, Nov 26 |||| ****Need to create the date of event****</span>
								 	· <span class="eventTimeDisplay-startDate">
									 <span>
									8:45 AM EST |||| ****Need time too ? ****</span>
									</span>
								</span>
							</time>
						</div>
					</div>
					<div class="flex-item">
						<span class="text--bold">
						<%=detailedEvent.getTitle()%></span>
					</div>
				</div>
			</div>
			
			<div class="flex-item flex-item--shrink  col-sm-5">
				<div class="flex flex--row flex--spaceBetween flex--alignCenter">
					<div class="flex-item flex-item--shrink  col-sm-8">
						<div class="flex flex--row flex--alignCenter">
							<div class="flex-item flex-item--shrink">
								<div class="flex flex--column">
									
									<div class="flex-item">
										<span>
										Joined / Max<br>
										&nbsp; &nbsp; &nbsp; &nbsp; <%=detailedEvent.getNumOfJoiningMembers()%> / <%=detailedEvent.getNumOfMaxMembers()%></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="flex-item flex-item--shrink _EventStickyFooter-module_eventActions__1dOQN">
						<div class="flex flex--row last">						
						<div class="flex-item flex-item--shrink ">
							<!-- <button data-swarm-button="neutral" data-swarm-size="large" data-icon="only" data-swarm-width="default" type="button" aria-label="Save event" class="saveButton _saveEventButton-module_saveButton__2eemT saveButton--save _saveEventButton-module_newStyle__1WGCV gtmEventFooter--save-btn" data-e2e="event-footer--save-btn">
								&nbsp; &nbsp; <span>
									<svg data-swarm-icon="true" height="24" width="24" viewBox="0 0 24 24">
										<path d="M5.458 22.004l1.25-7.284-5.293-5.16 7.314-1.062L12 1.87l3.271 6.628 7.314 1.063-5.292 5.159 1.249 7.284L12 18.564l-6.542 3.44zm1.328-1.828L12 17.436l5.214 2.74-.996-5.805 4.218-4.112-5.83-.847L12 4.13 9.393 9.412l-5.83.847 4.219 4.112-.996 5.805z">
										</path>
									</svg>
								</span>&nbsp; &nbsp; 
							</button> -->
							<button type="button" class="btn btn-block btn-default">
							<svg data-swarm-icon="true" height="24" width="24" viewBox="0 0 24 24">
										<path d="M5.458 22.004l1.25-7.284-5.293-5.16 7.314-1.062L12 1.87l3.271 6.628 7.314 1.063-5.292 5.159 1.249 7.284L12 18.564l-6.542 3.44zm1.328-1.828L12 17.436l5.214 2.74-.996-5.805 4.218-4.112-5.83-.847L12 4.13 9.393 9.412l-5.83.847 4.219 4.112-.996 5.805z">
										</path>
									</svg>
							</button>
						</div>
						<div class="flex-item flex-item--shrink">						
							<!-- <button data-swarm-button="primary" data-swarm-size="large" data-icon="left" data-swarm-width="default" type="button" data-e2e="event-footer--attend-btn" class="gtmEventFooter--attend-btn" style="color: rgba(0,0,0,.5);">
								<span>
								&nbsp; Attend &nbsp; </span>
							</button> -->
							<button type="button" class="btn btn-block btn-default">&nbsp; Join &nbsp;</button>
						</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
       </div>
      </div>
   </nav>

<!-- favorite and join end  -->

    <div class="col-sm-4">
      <p>
      							    <label for="exampleFormControlTextarea1">When</label><br>
      				<time class="" datetime="1606399200000">
					<span class="eventTimeDisplay-startDate">
						<span>
						Thursday, November 26, 2020 |||| *****need data for event date *****</span>
						<br>
						<span class="eventTimeDisplay-startDate-time">
							<span>
							9:00 AM ||| *****need data for start event time ? ? **** ||||</span>
						</span>
					</span>
				<span class="eventTimeDisplay-endDate">
					 <span>
					 to 
						<span class="eventTimeDisplay-endDate-partialTime">
							<span>
							1:00 PM EST ||| ****need data for end event time ?? ****</span>
						</span>
					</span>
				</span>
				</time>
				<address>
				    <label for="exampleFormControlTextarea1">Where</label>
				
				<p class="wrap--singleLine--truncate">
				Schunemunk Mountain |||| ****need address ? ? **** ||||</p>
				<p class="venueDisplay-venue-address text--secondary text--small text--wrapNice">
				339 Otterkill Road<span>
				 · Cornwall</span>
				 <span>
				, NY</span>
				</p>
				</address>
      
      
      </p>
      <hr class="d-sm-none">
    </div>   
    <!-- account side end --> <!-- account side end -->
    <div class="col-sm-8">
      <div class="eventPic" style="background: url('img/3.jpg') center no-repeat; background-size: cover; width: 100%;"></div>
      <br>
  </div>
</div>
 
 <!-- end -->
<br>
  <div class="form-group" class="username">
    <label for="exampleFormControlTextarea1">Detail</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="11" readonly="readonly"><%=detailedEvent.getContents() %></textarea>
    
  </div>
  
<!-- Comments  start -->
 <div class="timeline-body">
       <div class="timeline-likes">
          <div class="stats-right">
             <span class="stats-text">259 Shares</span>
             <span class="stats-text">21 Comments</span>
          </div>
          <div class="stats">
             <span class="fa-stack fa-fw stats-icon">
             <i class="fa fa-circle fa-stack-2x text-danger"></i>
             <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
             </span>
             <span class="fa-stack fa-fw stats-icon">
             <i class="fa fa-circle fa-stack-2x text-primary"></i>
             <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
             </span>
             <span class="stats-total">4.3k</span>
          </div>
       </div>
       <div class="timeline-footer">
          <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
          <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
          <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
       </div>
       <div class="timeline-comment-box">
          <div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar3.png"></div>
          <div class="input">
             <form action="">
                <div class="input-group">
                   <!-- <input type="text" class="form-control rounded-corner" placeholder="Write a comment..."> -->
                  <!--  <button class="btn btn-secondary f-s-12 rounded-corner" type="button">Comment</button> -->
                 <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                 <button type="submit" class="btn btn-secondary btn-sm last" style="text-align: right;">comments</button>
                   <span class="input-group-btn p-l-10">
                   </span>
                </div>
             </form>
          </div>
       </div>
    </div>
  <br>
<!-- Comments end -->

         <!-- end timeline-body -->
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
               <span class="username">Sean Ngu</span>
               <span class="pull-right text-muted">82 Views</span>
            </div>
            <div class="timeline-content">
               <p>Location: United States</p>
            </div>
           <!--  <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
            </div> -->
         </div>
         
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
               <span class="username">Sean Ngu</span>
               <span class="pull-right text-muted">82 Views</span>
            </div>
            <div class="timeline-content">
               <p>Location: United States</p>
            </div>
           <!--  <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
            </div> -->
         </div>
         
         <div class="timeline-body">
            <div class="timeline-header">
               <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
               <span class="username">Sean Ngu</span>
               <span class="pull-right text-muted">82 Views</span>
            </div>
            <div class="timeline-content">
               <p>Location: United States</p>
            </div>
           <!--  <div class="timeline-footer">
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
               <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
            </div> -->
         </div>
         <br>
         <!-- end timeline-body -->
 <!-- facebook style commend -->
    </div>
  </div>
</div>



<jsp:include page="../inc/bottom.jsp"></jsp:include>

</body>
</html>