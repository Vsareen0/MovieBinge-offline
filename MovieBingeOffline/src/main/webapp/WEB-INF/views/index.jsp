<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!doctype html>
<html>
<head>
	<%@ page isELIgnored="false" %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="/resources/images/movie.png">
	<link rel="stylesheet" href="<c:url value="/resources/css/index.css" />">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 	<style>
 		.alert {
		position: fixed;
		bottom: 10px;
		background-color: #f44336;
		color: white;
		}
		
		.closebtn {
		  margin-left: 15px;
		  color: white;
		  font-weight: bold;
		  float: right;
		  font-size: 22px;
		  line-height: 20px;
		  cursor: pointer;
		  transition: 0.3s;
		}
		
		.closebtn:hover {
		  color: black;
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
	        <li class="nav-item"><a href="#"><i class="fa fa-caret-square-o-right nav-icons" aria-hidden="true"></i>&nbsp;Now Playing</a></li>
	        <li class="nav-item"><a href="#"><i class="fa fa-calendar nav-icons" aria-hidden="true"></i>&nbsp;Upcoming</a></li>
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
<div class="row" id="addMoviesContent">
<c:set scope="session" var="counter" value="${0}"/>
<c:forEach items="${popular_movies}" var="movie" begin="${counter}" end="${counter}">
	<div class="col-sm-5 movie-box-2">
		<h4>&#x2728;Currently running in cinemas, <strong><i>Hurry Book Now !</i></strong></h4>
		<h2>${movie.original_title}</h2>
		<br>
		<p>${movie.overview}</p>
		<br>
		<span>
			<a class="btn-grad" href="/MovieBingeOffline/book?movieId=${movie.movieId}&userId=${user.userId}">Book Now</a>
			<a href="/MovieBingeOffline/seeDetails/${movie.movieId}">See Details</a>
		</span>
		
	</div>
	<div class="col-sm-7 posters-2">
		<img src="http://image.tmdb.org/t/p/w500/${movie.backdrop_path}" class="poster-1">
		<img src="http://image.tmdb.org/t/p/w500/${movie.poster_path}" class="poster-2" width="350">
		<span class="beacon">
		<div class="play-btn-1">
			<center><span>&#x1f3ac;</span></center>
		</div>
		</span>
	</div>
</c:forEach>
</div>

<div class="row">
	<div class="col-sm-5 nav-container">
		<div id="btns-mn">
			<center>
				<button class="btn" id="btn-left" onclick='checkId(<c:out value="${counter-1}" />);'><span>&#10092;</span></button>
				<button class="btn" id="btn-right" onclick='checkId(<c:out value="${counter+1}" />);'><span>&#10093;</span></button>
			</center> 
		</div>
	</div>
	<div class="col-sm-7 movies-navigator">
	
	<c:forEach items="${popular_movies}" var="movie" begin="0" end="3" varStatus="i">
	
		<div class="navs" onclick='<c:set scope="session" var="counter" value="${i.index}"/>;addContent("<c:out value="${counter}" />");'>
			<span class="nav-pseudo">${i.index+1}</span>
			<p class="nav-titles">${movie.title }</p>
		</div>
      	
     </c:forEach>

	</div>
</div>	
</div>

<!-- Container for movies -->
<div class="container-fluid movies-grad">
	<!-- Row for now Movies -->
	<div class="row">
		<div class="col-sm-12">
			<h4 id="now-Playing-Title"><span>Now Playing</span></h4>
			<div class="movies-container" id="movies-container">
				<c:forEach items="${popular_movies}" var="movie" begin="0" end="7">
				<div id="movie-box" style="background: url('http://image.tmdb.org/t/p/w500/${movie.poster_path}');background-size: cover;">
					<div id="movie-overlay"> 
						<center>
							<i class="fa fa-star" aria-hidden="true" style="color: #FFD15E"></i>
							<p>${movie.vote_average}</p>
							<p>${movie.release_date}</p>
							<a href="#">See Details</a>
							<button class="btn-grad">Book Now</button>
						</center> 
					</div>
					<p>${movie.title}</p>	
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<h4 id="most-popular-title"><span>The Most Popular Upcoming</span></h4>
			<div class="col-sm-6 most-popular">
				<img src="http://image.tmdb.org/t/p/w500/5BkSkNtfrnTuKOtTaZhl8avn4wU.jpg" class="upcoming-poster">
				<img src="http://image.tmdb.org/t/p/w500/bk8LyaMqUtaQ9hUShuvFznQYQKR.jpg" class="upcoming-poster-2" width="350">
				
			</div>
			<div class="col-sm-6 most-popular" id="movie-box-upcoming">
				<h2>Hellboy</h2>
				<br>
				<p>Hellboy comes to England, where he must defeat Nimue, Merlin's consort and the Blood Queen. But their battle will bring about the end of the world, a fate he desperately tries to turn away.</p>
				 <br>
				 <span>
					 <button class="btn-grad">Book Now</button>
					 <a href="#">See Details</a>
				 </span>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<h4 id="upcoming-Title"><span>Upcoming</span></h4>
			<div class="upcoming-movies-container" id="upcoming-movies-container">
			
				<div id="upcoming-movie-box" style="background: url('http://image.tmdb.org/t/p/w500/bk8LyaMqUtaQ9hUShuvFznQYQKR.jpg');background-size: cover;">
					<div id="movie-overlay"> 
						<center>
							<i class="fa fa-star" aria-hidden="true" style="color: #FFD15E"></i>
							<p>5.2</p>
							<p>Wed Apr 10 00:00:00 IST 2019</p>
							<button class="btn-grad">Book Now</button>
						</center> 
					</div>
					<p>Hellboy</p>	
				</div>
			
				<div id="upcoming-movie-box" style="background: url('http://image.tmdb.org/t/p/w500/3TZCBAdKQiz0cGKGEjZiyZUA01O.jpg');background-size: cover;">
					<div id="movie-overlay"> 
						<center>
							<i class="fa fa-star" aria-hidden="true" style="color: #FFD15E"></i>
							<p>6.5</p>
							<p>Thu Feb 14 00:00:00 IST 2019</p>
							<button class="btn-grad">Book Now</button>
						</center> 
					</div>
					<p>Fighting with My Family</p>	
				</div>
			
				<div id="upcoming-movie-box" style="background: url('http://image.tmdb.org/t/p/w500/30IiwvIRqPGjUV0bxJkZfnSiCL.jpg');background-size: cover;">
					<div id="movie-overlay"> 
						<center>
							<i class="fa fa-star" aria-hidden="true" style="color: #FFD15E"></i>
							<p>5.8</p>
							<p>Fri Feb 08 00:00:00 IST 2019</p>
							<button class="btn-grad">Book Now</button>
						</center> 
					</div>
					<p>What Men Want</p>	
				</div>
			
				<div id="upcoming-movie-box" style="background: url('http://image.tmdb.org/t/p/w500/wgQ7APnFpf1TuviKHXeEe3KnsTV.jpg');background-size: cover;">
					<div id="movie-overlay"> 
						<center>
							<i class="fa fa-star" aria-hidden="true" style="color: #FFD15E"></i>
							<p>6.9</p>
							<p>Fri May 03 00:00:00 IST 2019</p>
							<button class="btn-grad">Book Now</button>
						</center> 
					</div>
					<p>POKÉMON Detective Pikachu</p>	
				</div>
		
			</div>	
		</div>
	</div>
</div>

<div class="container-fluid news" style="height: 450px">


</div>

<footer id="footer">
<center>
<table border="0">
	<tbody>
		<tr>
			<td rowspan="5" align="top"><a href="#"><span class="logo">movieBinge</span></a></td>
			<th align="left">Company</th>
			<th align="left">Find a Movie</th>
			<th align="left">Help</th>
			<th align="left">Legal</th>
		</tr>
		<tr>
			<td><a href="#">Home</a></td>
			<td><a href="#">Theaters</a></td>
			<td><a href="#">Contact Us</a></td>
			<td><a href="#">Terms of Use</a></td>
		</tr>
		<tr>
			<td><a href="#">About Us</a></td>
			<td><a href="#">Upcoming</a></td>
			<td><a href="#">FAQ</a></td>
			<td><a href="#">Privacy Policy</a></td>
		</tr>
		<tr>
			<td><a href="#">Contact Us</a></td>
			<td><a href="#">Now Playing</a></td>
			<td><a href="#">Partnerships</a></td>
		</tr>
	</tbody>
</table>
</center>
</footer>
<c:if test="${bookingError}">
	<div class="alert">
	  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
	   Please <strong>login/signup</strong> in order to book.
	</div>
</c:if>
<script>
function checkId(id){
	console.log(id+1);
	if(id>4){
		addContent(String("0"));
	} else if(id<=-1){
		addContent(String("3"));
	}else{
		addContent(String(id));	
	}
}

function addContent(id){
	console.log("Id: "+(id));
	if(id==="0"){
		$("#addMoviesContent").html(`
				<c:set scope="session" var="counter" value="${0}"/>
				<c:forEach items="${popular_movies}" var="movie" begin="${counter}" end="${counter}">
					<div class="col-sm-5 movie-box-2">
						<h4>&#x2728;Currently running in cinemas, <strong><i>Hurry Book Now !</i></strong></h4>
						<h2>${movie.original_title}</h2>
						<br>
						<p>${movie.overview}</p>
						<br>
						<span>
							<a class="btn-grad" href="/MovieBingeOffline/${user.userId}/book?movieId=${movie.movieId}">Book Now</a>
							<a href="/MovieBingeOffline/seeDetails/${movie.movieId}">See Details</a>
						</span>
						
					</div>
					<div class="col-sm-7 posters-2">
					<img src="http://image.tmdb.org/t/p/w500/${movie.backdrop_path}" class="poster-1">
					<img src="http://image.tmdb.org/t/p/w500/${movie.poster_path}" class="poster-2" width="350">
						<span class="beacon">
						<div class="play-btn-1">
							<center><span>&#x1f3ac;</span></center>
						</div>
						</span>
					</div>
				</c:forEach>
			`).fadeIn();
	} else if(id==="1"){
		$("#addMoviesContent").html(`
				<c:set scope="session" var="counter" value="${1}"/>
				<c:forEach items="${popular_movies}" var="movie" begin="${counter}" end="${counter}">
					<div class="col-sm-5 movie-box-2">
						<h4>&#x2728;Currently running in cinemas, <strong><i>Hurry Book Now !</i></strong></h4>
						<h2>${movie.original_title}</h2>
						<br>
						<p>${movie.overview}</p>
						<br>
						<span>
							<a class="btn-grad" href="/MovieBingeOffline/${user.userId}/book?movieId=${movie.movieId}">Book Now</a>
							<a href="/MovieBingeOffline/seeDetails/${movie.movieId}">See Details</a>
						</span>
						
					</div>
					<div class="col-sm-7 posters-2">
					<img src="http://image.tmdb.org/t/p/w500/${movie.backdrop_path}" class="poster-1">
					<img src="http://image.tmdb.org/t/p/w500/${movie.poster_path}" class="poster-2" width="350">
						<span class="beacon">
						<div class="play-btn-1">
							<center><span>&#x1f3ac;</span></center>
						</div>
						</span>
					</div>
				</c:forEach>
			`).fadeIn();
	}else if(id==="2"){
		$("#addMoviesContent").html(`
				<c:set scope="session" var="counter" value="${2}"/>
				<c:forEach items="${popular_movies}" var="movie" begin="${counter}" end="${counter}">
					<div class="col-sm-5 movie-box-2">
						<h4>&#x2728;Currently running in cinemas, <strong><i>Hurry Book Now !</i></strong></h4>
						<h2>${movie.original_title}</h2>
						<br>
						<p>${movie.overview}</p>
						<br>
						<span>
							<a class="btn-grad" href="/MovieBingeOffline/${user.userId}/book?movieId=${movie.movieId}">Book Now</a>
							<a href="/MovieBingeOffline/seeDetails/${movie.movieId}">See Details</a>
						</span>
						
					</div>
					<div class="col-sm-7 posters-2">
					<img src="http://image.tmdb.org/t/p/w500/${movie.backdrop_path}" class="poster-1">
					<img src="http://image.tmdb.org/t/p/w500/${movie.poster_path}" class="poster-2" width="350">
						<span class="beacon">
						<div class="play-btn-1">
							<center><span>&#x1f3ac;</span></center>
						</div>
						</span>
					</div>
				</c:forEach>
			`).fadeIn();
	}else if(id==="3"){
		$("#addMoviesContent").html(`
				<c:set scope="session" var="counter" value="${3}"/>
				<c:forEach items="${popular_movies}" var="movie" begin="${counter}" end="${counter}">
					<div class="col-sm-5 movie-box-2">
						<h4>&#x2728;Currently running in cinemas, <strong><i>Hurry Book Now !</i></strong></h4>
						<h2>${movie.original_title}</h2>
						<br>
						<p>${movie.overview}</p>
						<br>
						<span>
							<a class="btn-grad" href="/MovieBingeOffline/${user.userId}/book?movieId=${movie.movieId}">Book Now</a>
							<a href="/MovieBingeOffline/seeDetails/${movie.movieId}">See Details</a>
						</span>
						
					</div>
					<div class="col-sm-7 posters-2">
					<img src="http://image.tmdb.org/t/p/w500/${movie.backdrop_path}" class="poster-1">
					<img src="http://image.tmdb.org/t/p/w500/${movie.poster_path}" class="poster-2" width="350">
						<span class="beacon">
						<div class="play-btn-1">
							<center><span>&#x1f3ac;</span></center>
						</div>
						</span>
					</div>
				</c:forEach>
			`).fadeIn();
	}
}
</script>
<script src="<c:url value="/resources/assets/js/core/jquery.min.js" />" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/assets/js/core/popper.min.js" />" type="text/javascript"></script>
</body>
</html>
