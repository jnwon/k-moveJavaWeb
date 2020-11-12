<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<style>
a {
    color: rgba(0,0,0,.5);
    text-decoration: none;
    background-color: transparent;
}

#mainPic {
    width: 100%;
    height: 300px;
    background: url(../img/1.jpg) center no-repeat;
    background-size: cover;
    /* margin: 0; */
}

#mainFont{
    color: #e9ecef;
    text-decoration: none;
    background-color: transparent;
    
    }
    

</style>


<div class="jumbotron text-center" style="margin-bottom:0" id="mainPic">
   <h1><a href="../main/main.jsp" id="mainFont">GRUENT WELT</a></h1>
  <p id="mainFont">Herzlich willkommen zu unsere Website!</p> 
</div> 
    
<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-light navbar-white">
    <div class="container">
      <a href="../main/main.jsp" class="navbar-brand">
        <img src="../img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">GRUENTWELT</span>
      </a>
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
        </li>

        <li class="nav-item d-none d-sm-inline-block">
          <a href="../article/article.jsp" class="nav-link">Article</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="../event/community.jsp" class="nav-link">Community</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Help
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="../admin/faq.jsp">FAQ</a>
            <a class="dropdown-item" href="../admin/support.jsp">Support</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="../mem/contact.jsp">Contact</a>
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
            
          <a class="nav-link" href="../mem/login.jsp">login</a> | <a class="nav-link" href="../mem/join.jsp">join</a>

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
                <img src="../img/user1.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
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
                <img src="../img/user8.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                <img src="../img/user4.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
          <a class="nav-link" data-toggle="dropdown" href="../mem/myhome.jsp">My Info
            <i class="far fa-bell"></i>
            <span class="badge badge-warning navbar-badge">15</span> 
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <span class="dropdown-header">Setting</span>
            <div class="dropdown-divider"></div>
            <a href="../mem/myAccount.jsp" class="dropdown-item">
              <i class="fas fa-envelope mr-2"></i> Account
            </a>
            <div class="dropdown-divider"></div>
            <a href="../mem/favorites.jsp" class="dropdown-item">
              <i class="fas fa-users mr-2"></i> Saved
            </a>
            <div class="dropdown-divider"></div>
            <a href="../mem/meetup.jsp" class="dropdown-item">
              <i class="fas fa-file mr-2"></i> My activities
            </a>
            <div class="dropdown-divider"></div>
            <a href="../mem/contact.jsp" class="dropdown-item dropdown-footer">My Q&A</a>
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