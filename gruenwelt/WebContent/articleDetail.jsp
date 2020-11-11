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
  
  #writeButton { text-align: right;

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
      <h2>ARTICLES</h2>
      <h5>Title description, Dec 7, 2017</h5>

<form>
  <div class="form-group">
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" placeholder="User info" readonly="readonly">
    </div>
    <div class="col">
      <input type="text" class="form-control" placeholder="Last name" readonly="readonly">
    </div>
  </div>
  </div>
  
    <div class="form-group">
    <label for="exampleFormControlInput1">Subject</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Subject" readonly="readonly">
  </div>
  
      <div class="form-group">
    <label for="exampleFormControlInput1">attached file</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Subject" readonly="readonly">
  </div>
 
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Content</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="11" readonly="readonly"></textarea>
    
  </div>
  
 
<!--
  <div class="custom-control custom-checkbox mb-3">
    <input type="checkbox" class="custom-control-input" id="customControlValidation1" required>
    <label class="custom-control-label" for="customControlValidation1">Check this custom checkbox</label>
    <div class="invalid-feedback">Example invalid feedback text</div>
  </div>

  <div class="custom-control custom-radio">
    <input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" required>
    <label class="custom-control-label" for="customControlValidation2">Toggle this custom radio</label>
  </div>
  <div class="custom-control custom-radio mb-3">
    <input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked" required>
    <label class="custom-control-label" for="customControlValidation3">Or toggle this other custom radio</label>
    <div class="invalid-feedback">More example invalid feedback text</div>
  </div>
  <div class="mb-3">
    <select class="custom-select" required>
      <option value="">Choose...</option>
      <option value="1">One</option>
      <option value="2">Two</option>
      <option value="3">Three</option>
    </select>
    <div class="invalid-feedback">Example invalid custom select feedback</div>
  </div>
-->

  <div class="form-group">
    <label for="exampleFormControlTextarea1">Comments</label>   <button type="button" class="btn btn-secondary btn-sm" style="text-align: right;">comments</button>
      
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>



<ul class="list-unstyled">
  <li class="media">
    <img src="img/comments.png" class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">List-based media object</h5>
      Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
    </div>
  </li>
  <br>
  
  <li class="media my-4">
    <img src="img/comments.png" class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">List-based media object</h5>
      Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
    </div>
  </li>
  <br>
  
  <li class="media">
    <img src="img/comments.png" class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">List-based media object</h5>
      Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
    </div>
  </li>
</ul>

<br>

  
<!--
  <div class="mb-3">
    <div class="input-group is-invalid">
      <div class="input-group-prepend">
        <span class="input-group-text" id="validatedInputGroupPrepend">@</span>
      </div>
      <input type="text" class="form-control is-invalid" aria-describedby="validatedInputGroupPrepend" required>
    </div>
    <div class="invalid-feedback">
      Example invalid input group feedback
    </div>
  </div>

  <div class="mb-3">
    <div class="input-group is-invalid">
      <div class="input-group-prepend">
        <label class="input-group-text" for="validatedInputGroupSelect">Options</label>
      </div>
      <select class="custom-select" id="validatedInputGroupSelect" required>
        <option value="">Choose...</option>
        <option value="1">One</option>
        <option value="2">Two</option>
        <option value="3">Three</option>
      </select>
    </div>
    <div class="invalid-feedback">
      Example invalid input group feedback
    </div>
  </div>

  <div class="input-group is-invalid">
    <div class="custom-file">
      <input type="file" class="custom-file-input" id="validatedInputGroupCustomFile" required>
      <label class="custom-file-label" for="validatedInputGroupCustomFile">Choose file...</label>
    </div>
    <div class="input-group-append">
       <button class="btn btn-outline-secondary" type="button">Button</button>
    </div>
  </div>
  <div class="invalid-feedback">
    Example invalid input group feedback
  </div>
 -->
 
   <div class="form-group row">
    <div class="col-sm-1">
      <button type="submit" class="btn btn-primary">Modify</button>
    </div>
    
        <div class="col-sm-1">
      <button type="submit" class="btn btn-primary"><a href="articleDelete.html">Delete</a></button>
    </div>
    
        <div class="col-sm-1">
      <button type="submit" class="btn btn-primary"><a href="article.html">List</a></button>
    </div>
    
  </div>
  
</form>



    </div>
  </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>

</body>
</html>
