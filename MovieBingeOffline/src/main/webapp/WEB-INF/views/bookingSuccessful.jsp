<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!doctype html>
<html>
<head>
	<%@ page isELIgnored="false" %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="<c:url value="/resources/css/index.css" />">
	<link rel="stylesheet" href="<c:url value="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
 	<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.4.0/css/bootstrap.min.css"/> ">
 	<style>
 		img{
 			box-shadow: -3px -3px 6px 6px rgba(255,255,255,.5)
 		}
 		h4,h6{
 			font-weight: 700;
 			font-family: 'PT Sans', sans-serif;
 		}
 	</style>
</head>
<body>
<!-- First container for movies -->
<div class="container-fluid bg-grad">
	
	<nav class="navbar navbar-expand-sm" style="background-color: rgba(0,0,0,0.5);">
		
		<div class="container-fluid">
		
		<a href="#"><span class="logo">movieBinge</span></a>
		
		<!-- Toggles/collapsible Button -->
		<button class="navbar-toggle navbar-toggle-right collapsed" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"
		 data-label-expanded="Close" style="color:#0CBEEA;">
		  
			<span class="navbar-toggle-label">Menu</span>
		    <span class="sr-only">(toggle)</span>
		
		    <span class="fa fa-toggle-down">
		    </span>
		</button>  
		
	    <div class="collapse navbar-collapse" id="collapsibleNavbar">
	      <ul class="nav navbar-nav">
	        <li class="nav-item"><a href="#now-Playing-Title"><i class="fa fa-caret-square-o-right nav-icons" aria-hidden="true"></i>&nbsp;Now Playing</a></li>
	        <li class="nav-item"><a href="#upcoming-Title"><i class="fa fa-calendar nav-icons" aria-hidden="true"></i>&nbsp;Upcoming</a></li>
	        <li class="nav-item"><a href="#"><i class="fa fa-map-marker nav-icons" aria-hidden="true"></i>&nbsp;Theaters</a></li>    
	      </ul>
	      <!-- <ul class="nav navbar-nav navbar-center">
	        <span>
				<input type="search" >
			</span>	
		  </ul> -->
	      <form class="navbar-form navbar-left" action="/search">
		      <div class="input-group">
		        <input type="text" class="form-control" placeholder="Search" name="search">
		        <div class="input-group-btn">
		          <button class="btn btn-default" type="submit">
		            <i class="glyphicon glyphicon-search"></i>
		          </button>
		        </div>
		      </div>
		    </form>
		    <c:choose>
		    	<c:when test="${checkLogin}">
	      		<ul class="nav navbar-nav navbar-right">
		        	<li class="nav-item"><a href="#" class="cred"><i class="fa fa-user nav-icons" aria-hidden="true"></i>&nbsp;Welcome, ${user.username}</a></li>
		        	<li class="nav-item"><a onclick="$.removeCookie('JSESSIONID', { path: '/' });" href="/MovieBingeOffline/user/logout" class="cred"><i class="fa fa-sign-out nav-icons" aria-hidden="true"></i>&nbsp;Logout</a></li>    
		      	</ul>	
	      		</c:when>      		
	      		<c:otherwise>
		      	<ul class="nav navbar-nav navbar-right">
		        	<li class="nav-item"><a href="/MovieBingeOffline/user/signin" class="cred"><i class="fa fa-user nav-icons" aria-hidden="true"></i>&nbsp;Login</a></li>
		        	<li class="nav-item"><a href="/MovieBingeOffline/user/signup" class="cred"><i class="fa fa-users nav-icons" aria-hidden="true"></i>&nbsp;Register</a></li>    
		      	</ul>
		      </c:otherwise>
		   </c:choose>
	  	</div>
	</div>
</nav>

<div id="img_success">
<center>
	<img src="<c:url value="/resources/images/movie.png"/>" height="300" width="450" >
</center>
</div>

</div>
<br>

<h4 class="text-center">Enjoy your movie !<br><br> Your tickets have been booked successfully</h4>
<br>
<br>
<h6 class="text-center"><a href="/MovieBingeOffline/">Click Here</a> to check out new movies to buy tickets for.</h6>
<h6 class="text-center"><strong>OR</strong></h6>
<h6 class="text-center"><a href="/MovieBingeOffline/summary">Click Here</a> to check your bookings.</h6>

</body>
</html>