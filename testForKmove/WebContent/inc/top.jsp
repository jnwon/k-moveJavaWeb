<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>   
<link rel="stylesheet" href="css/top.css">

<div class="jumbotron text-center" style="margin-bottom:0" id="mainPic" newsApi="off">	<!-- NewsAPI 이용하려면 on으로 -->
   <h1><a href="main.um" id="mainFont">GRÜNWELT</a></h1>
  <p id="mainFont">Herzlich willkommen zu unsere Website!</p> 
</div> 
    
<!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-light navbar-white">
    <div class="container">
      <a href="main.um" class="navbar-brand">
        <img src="img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8"> <!-- 이미지는 /빼고 새로지정해줘야 가상주소에서 작동함 -->
        <span class="brand-text font-weight-light">GRÜNWELT</span>
      </a>
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
        </li>

        <li class="nav-item d-none d-sm-inline-block">
          <a href="/testForKmove/ArticleBoardController" class="nav-link">Article</a> <!-- 가상주소에는 /를 붙여야 이동함 -->
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="/testForKmove/EventListController" class="nav-link">Community</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Help
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="../admin/faq.jsp">FAQ</a>
            <a class="dropdown-item" href="../admin/support.jsp">Support</a></div>
        </li>
      </ul>
      <!-- SEARCH FORM -->
      <div class="form-inline ml-3">
        <div class="input-group input-group-sm"> <!-- 70:검색창부분에서 placeholder에  --><!-- 71:key값이 아무것도 없을때 --><!-- 72:placeholder에서 메인에서 검색한 key값 가져와서 article에 적용되어 more클릭시 나머지도 보여줄수있도록하기 -->
        <c:choose> 
        <c:when test="${key != null }"> 
          <input class="form-control form-control-navbar" type="search" id="searchInput" placeholder=${key } aria-label="Search"> 
        </c:when>
        <c:otherwise>
          <input class="form-control form-control-navbar" type="search" id="searchInput" placeholder="Search" aria-label="Search">
        </c:otherwise>
        </c:choose>
          <div class="input-group-append">
            <button class="btn btn-navbar" type="submit" id="newsSearch">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
      </div>
      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto">
      <!-- Login and Logout -->
            
          <a class="nav-link" href="/testForKmove/LogController">login</a> | <a class="nav-link" href="/testForKmove/JoinController">join</a>

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
                <img src="img/user1.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
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
                <img src="img/user8.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                <img src="img/user4.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
            <a href="/testForKmove/MyAccountController" class="dropdown-item">
              <i class="fas fa-envelope mr-2"></i> Account
            </a>
            <div class="dropdown-divider"></div>
            <a href="/testForKmove/SaveController" class="dropdown-item">
              <i class="fas fa-users mr-2"></i> Saved
            </a>
            <div class="dropdown-divider"></div>
            <a href="/testForKmove/MyActivController" class="dropdown-item">
              <i class="fas fa-file mr-2"></i> My activities
            </a>
            <div class="dropdown-divider"></div>
            <a href="/testForKmove/ContactController" class="dropdown-item dropdown-footer">My Q&A</a>
          </div>
        </li>
        
      </ul>
    </div>
  </nav>
  <!-- /.navbar -->