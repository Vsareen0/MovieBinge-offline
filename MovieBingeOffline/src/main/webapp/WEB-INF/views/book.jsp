<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ page isELIgnored="false" %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Book Tickets for ${movie.title}</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/material.css" />" rel="stylesheet">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	<style>
 		
		@import url('https://fonts.googleapis.com/css?family=PT+Sans');
 		
 		body{
	 		margin: 0;
 		}
 		.back,.soc{	
 			text-decoration: none;
 			font-weight: 700;
			font-family: 'PT Sans', sans-serif;	
 		}
 		.back:after{
 			content: " |";
 			padding-left: 2em;
 			font-weight: 700px;
 		}
 		.datepicker{
 			color: #567580;
 			width: 80%;
 		}
 		.date-time{
 			background-color: #104476;
 			height: 100%;
 			width: 100%;
 		}
 		.date-time h5, .seats-purchase h5{
 			color: #ededed;
 			font-weight: 700;
			font-family: 'PT Sans', sans-serif;	
 		}
 		.seats-purchase{
 			background-color: #03213F;
 			height: 500px;
 		}
 		.poster{
 			margin-top: -50%;
 			height: 300px;
 			width: 200px;
 			border-radius: 3px;
 			box-shadow: 0px -2px 3px 2px rgba(0, 0, 0, 0.5);
 		}
 		.time{	
 			color: #567580;
 			vertical-align: bottom;
 			display: inline-block;
 			font-weight: 700;
 			padding-top: 20px;
 			padding-left: 20px;
 			cursor: pointer;
			font-family: 'PT Sans', sans-serif;
 		}
 	</style>
</head>
<body>

<div class="container-fluid" 
	style="height: 350px;width: 100%;background-image: url('http://image.tmdb.org/t/p/original/${movie.backdrop_path}');background-size: cover;">
	
	<nav class="navbar navbar-expand-sm">
		
		<div class="container-fluid">
		
		<a href="/MovieBingeOffline/" style="text-decoration:none"><span class="back"><i class="fa fa-arrow-left"></i>&nbsp;&nbsp; Back</span></a>
		
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
	        <li class="nav-item soc"><a href="#">&nbsp;SEATING OF CHOICE</a></li>
	      </ul>

		    <c:choose>
		    	<c:when test="${checkLogin}">
	      		<ul class="nav navbar-nav navbar-right">
		        	<li class="nav-item soc"><a href="#" class="cred"><i class="fa fa-user nav-icons" aria-hidden="true"></i>&nbsp;Welcome, ${user.username}</a></li>
		        	<li class="nav-item soc"><a href="/MovieBingeOffline/user/logout" class="cred"><i class="fa fa-sign-out nav-icons" aria-hidden="true"></i>&nbsp;Logout</a></li>    
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

</div>

<div class="container-fluid date-time">
<div class="row">
	<div class="col-sm-4">
		<img src="http://image.tmdb.org/t/p/original/${movie.poster_path}" class="poster">
	</div>
	<div class="col-sm-4">
		<h5>DATE</h5>
		<div class="form-group bmd-form-group">
		  <label class="bmd-label-floating">Select Date</label>
		  <input name="release_date" type="text" class="form-control datepicker" value="00/00/2019">
		</div>
	</div>
	<div class="col-sm-4">
		<h5>AVAILABLE TIMES</h5>
		<c:forEach items="${show}" var="show">
			<div class="time" id="${show}">
				${show}
			</div>
		</c:forEach>
		
	</div>
</div>
</div>

<div class="container-fluid seats-purchase">
	<div class="row">
		<div class="col-sm-8 seats-left">
		<br>
			<h5 class="text-center">PLEASE SELECT YOUR SEATS</h5>
		</div>
		<div class="col-sm-4 seats-right">
		<br>
		<h5>SELECTED SEATS</h5>
		</div>
	</div>
</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/assets/js/core/jquery.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/core/popper.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/core/bootstrap-material-design.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/plugins/bootstrap-tagsinput.js"/>"> </script>
<script src="<c:url value="/resources/assets/js/plugins/moment.min.js"/>"> </script>
<script src="<c:url value="/resources/assets/js/plugins/bootstrap-datetimepicker.js"/>"> </script>

<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="<c:url value="/resources/assets/js/material-kit.js?v=2.1.1"/>" type="text/javascript"></script>



<script>
    $(document).ready(function() {
      //init DateTimePickers
      materialKit.initFormExtendedDatetimepickers();

      // Sliders Init
      materialKit.initSliders();
    });
</script>

<script>
$(function() {
    $('.time').click(function() { 
    	var list = document.getElementsByClassName("time");
    	for(var i=0;i<list.length;i++){
    		list[i].style.color = "#567580";	
    	}
    	document.getElementById(this.id).style.color = "#000";
    });
});
</script>

</body>
</html>