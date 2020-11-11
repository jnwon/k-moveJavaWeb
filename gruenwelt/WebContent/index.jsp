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
@media screen and (min-width: 45em), print and (min-width: 45em)
.row>.col {
    float: left;
}
@media screen and (min-width: 45em), print and (min-width: 45em)
.cols-3.row>.col {
    width: 33.33334%;
}

.col {
    padding: 0 1em;
}
.article3 {
    padding-left: 3ch;
    width: 275px;
}
.last {
float: left;
}



@media screen and (min-width: 40em), print and (min-width: 40em)
.cols-3>.col:first-child {
    width: 100%;
}


@media screen and (min-width: 40em), print and (min-width: 40em)
.cols-3>.col {
    float: left;
    width: 50%;
}


  </style>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
   <h1><a href="index.html">Umwelt</a></h1>
  <p>Herzlich willkommen zu unsere Website!</p> 
</div>

<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-light navbar-white">
    <div class="container">
      <a href="index.html" class="navbar-brand">
        <img src="img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">AdminLTE 3</span>
      </a>
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
        </li>

        <li class="nav-item d-none d-sm-inline-block">
          <a href="article.html" class="nav-link">Article</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="community.html" class="nav-link">Community</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Help
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="faq.html">FAQ</a>
            <a class="dropdown-item" href="support.html">Support</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="contact.html">Contact</a>
          </div>
        </li>
      </ul>
      <!-- SEARCH FORM -->
      <form class="form-inline ml-3">
        <div class="input-group input-group-sm">
          <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-navbar" type="submit">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
      </form>
      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto">
      <!-- Login and Logout -->
            
          <a class="nav-link" href="login.html">login</a> | <a class="nav-link" href="join.html">join</a>

        <!-- Messages Dropdown Menu -->
 		<li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">Hello, Emaila
            <i class="fas fa-comments"></i>
            <span class="badge badge-danger navbar-badge">3</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    Brad Diesel
                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">Call me whenever you can...</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    John Pierce
                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">I got your message bro</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    Nora Silvester
                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">The subject goes here</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
          </div>
        </li>
        <!-- Notifications Dropdown Menu -->
 		<li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="myhome.html">My Info
            <i class="far fa-bell"></i>
            <span class="badge badge-warning navbar-badge">15</span> 
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <span class="dropdown-header">Setting</span>
            <div class="dropdown-divider"></div>
            <a href="myAccount.html" class="dropdown-item">
              <i class="fas fa-envelope mr-2"></i> Account
            </a>
            <div class="dropdown-divider"></div>
            <a href="favorites.html" class="dropdown-item">
              <i class="fas fa-users mr-2"></i> Saved
            </a>
            <div class="dropdown-divider"></div>
            <a href="meetup.html" class="dropdown-item">
              <i class="fas fa-file mr-2"></i> My activities
            </a>
            <div class="dropdown-divider"></div>
            <a href="contact.html" class="dropdown-item dropdown-footer">My Q&A</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button"><i
              class="fas fa-th-large"></i></a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- /.navbar -->

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-12">
      <h2>INTERNATIONAL</h2>
		<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/fakeimage.png" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		<p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
<br>

<!-- 광고3개시작 -->
		<div class="row row-b cols-3">          
		<div class="col">      
			<div class="panel-pane pane-epa-core-html-pane">
			  <div class="pane-content">
			    <h2>Individuals and<br> Families</h2>
				<div class="figure image mode-full" style="width:275px"><a href="/radon/radon-resources-individuals-and-families"><span class="figure image file file-image file-image-jpeg view-mode-full" style="width:275px;"><img alt="Radon Resources for Individuals and Families" height="150" width="275" class="media-element file-full" src="img/radon1.jpg"></span></a></div>
					<ul class="article3">
						<li><a href="/radon/health-risk-radon">Health Risk of Radon</a></li>
						<li><a href="/radon/citizens-guide-radon-guide-protecting-yourself-and-your-family-radon">Citizen's Guide to Radon</a></li>
						<li><a href="/radon/find-radon-test-kit-or-measurement-and-mitigation-professional">Find a Radon Test Kit or Measurement and Mitigation Professional</a></li>
						<li><a href="https://archive.epa.gov/water/archive/web/html/index-9.html">Radon in Drinking Water</a></li>
						<li><a href="/radon/radon-hotlines-and-information-resources">Radon Hotlines and Resources</a>&nbsp;</li>
						<li><a href="/radon/publications-about-radon">Radon Publications</a>&nbsp;(<a href="https://espanol.epa.gov/cai/publicaciones-sobre-calidad-del-aire-interior#tab-5">En Español</a>)</li>
						<li><a href="/radon/radon-media-resources-partners-and-stakeholders">Radon Media Resources for Partners and Stakeholders</a></li>
						<li><a href="https://espanol.epa.gov/cai#tab-4">En Español -&nbsp;Acerca del radón</a></li>
					</ul>  
				</div>
			</div>
     	 </div>              

	      <div class="col">      
			<div class="panel-pane pane-epa-core-html-pane">
			  <div class="pane-content">
			    <h2>Home Buyers and Sellers</h2>
				<div class="figure image mode-full" style="width:280px"><a href="/radon/radon-resources-home-buyers-and-sellers"><img alt="Radon Resources for Home Buyers and Sellers" src="img/radon2.jpg?itok=c2yuBYsm"></a></div>
					<ul class="article3">
						<li><a href="/radon/how-protect-your-family-radon-when-buying-newly-built-home">Radon Protection: Buying a Home</a></li>
						<li><a href="/radon/building-new-home-have-you-considered-radon">Radon Protection: Building a Home</a></li>
						<li><a href="/radon/radon-resistant-new-construction-home-buyers">Radon-Resistant New Construction</a></li>
						<li><a href="/radon/radon-and-real-estate-resources">Radon and Real Estate Resources</a></li>
						<li><a href="/radon/home-buyers-and-sellers-guide-radon">Home Buyer's/Seller's Guide to Radon</a></li>
						<li><a href="/radon/consumers-guide-radon-reduction-how-fix-your-home">Consumer's Guide to Radon Reduction:&nbsp;How to Fix your Home</a></li>
						<li><a href="/radon/find-radon-test-kit-or-measurement-and-mitigation-professional#who">Who is Qualified to Test or Fix My Home?</a></li>
						<li><a href="/radon/radon-guide-tenants">Radon Guide for Tenants</a></li>
					</ul>  
				</div>
				</div>
		 	 </div>              
      
			<div class="col">      
				<div class="panel-pane pane-epa-core-html-pane">
				  <div class="pane-content">
				    <h2>Builders and Contractors</h2>
					<div class="figure image mode-full" style="width:275px"><a href="/radon/radon-resources-builders-and-contractors"><span class="figure image file file-image file-image-jpeg view-mode-full" style="width:280px;"><img alt="Radon Resources for Builders and Contractors" title="Radon - Builders and Contractors" height="153" width="280" class="media-element file-full" src="img/rodon3.jpg"></span></a></div>
						<ul class="article3">
							<li><a href="/radon/radon-resistant-construction-basics-and-techniques">Radon-Resistant Construction Basics and Techniques</a></li>
							<li><a href="/radon/builder-and-contractor-resources-radon-resistant-new-construction-rrnc">Resources for Builders and Contractors</a></li>
							<li><a href="/radon/radon-standards-practice">Radon Standards of Practice</a></li>
						</ul>  
					</div>
				</div>
				</div>          
			</div>

<!-- 광고3개끝 -->

<!-- 이벤트시작 -->
 <div class="last col-sm-6">
      <h2>EVENTS</h2>
            <h5>Title description, Dec 7, 2017</h5>
<div>		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
<div>		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
<div>		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
<div>		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  			<div class="carousel-inner">
   				<div class="carousel-item active">
   					<img src="img/fakeimage.png" class="d-block w-100" alt="...">
    			</div>

 			 </div>

		</div>
</div>
<br>
</div>
<!-- 이벤트끝 -->
<!-- 맵시작 -->

<div class="last col-sm-6">
<h2>MAP</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <div class=""><img src="img/map.png" hight=""></div>
<br>
 </div>
 
    </div>
  </div>
</div>
<!-- 맵끝 -->

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>

</body>
</html>
