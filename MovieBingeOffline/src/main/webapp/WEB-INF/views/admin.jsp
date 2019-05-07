<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%
  response.addHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
  response.setDateHeader("Expires", 0);

	if(session.getAttribute("loggedInAdmin")==null){
		response.sendRedirect("/MovieBingeOffline/adminSignin");
 	}
%>

<!-- A grey horizontal navbar that becomes vertical on small screens -->
<nav class="navbar navbar-expand-sm navbar-dark">
	<div class="container-fluid">
	<div class="navbar-header">
	  <a class="navbar-brand" href="#"><span class="logo">movieBinge Admin</span></a>		
	</div>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="/MovieBingeOffline/admin/logout"><span class="glyphicon glyphicon-user"></span>Logout</a></li>
	</ul>	
   </div>
  
  <!-- Toggle/collapse Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

</nav>

<!-- Container -->
<div class="container-fluid">
  <div class="row">
	<div class="col-sm-2" id="sidebar">
	  <ul class="sidebar">
	  	<li><a href="/MovieBingeOffline/dashboard" target="target_admin"><i class="fa fa-tachometer" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;Dashboard</a></li>
	  	<li><a href="/MovieBingeOffline/purchases" target="target_admin"><i class="fa fa-credit-card-alt"></i>&nbsp;&nbsp;&nbsp;&nbsp;Purchases</a></li>
	  	<li><a data-toggle="collapse" href="#collapse1"><i class="fa fa-ticket"></i>&nbsp;&nbsp;&nbsp;&nbsp;Movies
	  	&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-plus-square"></i></a>
	  	</li>
	  	<ul class="sub-list collapse" id="collapse1">
	  		<li><a href="/MovieBingeOffline/addNewMovie" target="target_admin">
	  		  <i class="fa fa-plus" aria-hidden="true"></i>
	  		  &nbsp;&nbsp;Add New
	  		</a>
	  		</li>
	  		<li><a href="/MovieBingeOffline/updateMovies" target="target_admin">
	  		  <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
	  		  &nbsp;&nbsp;Update Movie
	  		</a></li>
	  		<li><a href="/MovieBingeOffline/deleteMovies" target="target_admin">
	  		  <i class="fa fa-trash-o" aria-hidden="true"></i>
	  		  &nbsp;&nbsp;Delete Movie
	  		</a></li>
	  		<li><a href="/MovieBingeOffline/showAllMovies" target="target_admin">
	  		  <i class="fa fa-eye" aria-hidden="true"></i>
	  		  &nbsp;&nbsp;Show All</a>
	  		</li>
		</ul>
		<li><a data-toggle="collapse" href="#collapse2"><i class="fa fa-users"></i>&nbsp;&nbsp;&nbsp;&nbsp;Users
	  	&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-plus-square"></i></a>
	  	</li>
	  	<ul class="sub-list collapse" id="collapse2">
	  		<li><a href="new_user.jsp" target="target_admin">Add New User</a></li>
	  		<li><a href="#">Update User</a></li>
	  		<li><a href="#">Delete User</a></li>
	  		<li><a href="#">Show All Users</a></li>
		</ul>
	  </ul>
	</div>
	<div class="col-sm-10" id="pane">
		<iframe name="target_admin" src="/MovieBingeOffline/showAllMovies"></iframe>
	</div>
  </div>
</div>

<script src="<c:url value="/resources/js/popper.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/core/jquery.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/core/popper.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/core/bootstrap-material-design.min.js" />" type="text/javascript"></script>
</body>
</html>