<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html>
<html>
<head>
	<%@ page isELIgnored="false" %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Book Tickets for ${movie.title}</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/material.css" />" rel="stylesheet">
 	<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.4.0/css/bootstrap.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/book.css" /> ">
</head>
<body>
<form action="/MovieBingeOffline/booking" method="POST"> 
<input type="hidden" name="user_id" value="${user_id}">
<input type="hidden" name="movie_id" value="${movie.movieId}" id="movieId">
<span class="fields_cost"></span>
<span class="fields_no_of_seats"></span>
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
		  <!-- <input name="booking_day" type="text" class="form-control datepicker" value="00/00/2019" id="datepicker" onblur="initSeats();"> -->
		  <div class="dates"></div>
		  <div class="dates"></div>
		  <div class="dates"></div>	
		  <div class="dates"></div>
		  <div class="dates"></div>
		  <div class="dates"></div>
		  <div class="dates"></div>	
		<span class="show_date"></span>
	</div>
	<div class="col-sm-4">
		<h5>AVAILABLE TIMES</h5>
		<c:forEach items="${show}" var="show">
			<div class="time" id="${show}">
				${show}
			</div>
		</c:forEach>
		<span class="show_time"></span>
	</div>
</div>
</div>

<div class="container-fluid seats-purchase">
	<div class="row">
		<div class="col-sm-8 seats-left">
		<br>
			<input type="hidden" value="AX1" name="theatre_room_no">
			<h5 class="text-center">PLEASE SELECT YOUR SEATS</h5>
			<table border="0">
				<tbody>
					<tr>
						<td><p class="seats_row_label">J</p></td>
						<c:forEach begin="1" end="18" varStatus="i">
						<td>
							<input id="j${i.index}" value="j${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="j${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					<tr>
						<td><p class="seats_row_label">I</p></td>
						<c:forEach begin="1" end="14" varStatus="i">
						<td>
							<input id="i${i.index}" value="i${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="i${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					<tr>
						<td><p class="seats_row_label">H</p></td>
						<c:forEach begin="1" end="14" varStatus="i">
						<td>
							<input id="h${i.index}" value="h${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="h${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					<tr>
						<td><p class="seats_row_label">G</p></td>
						<c:forEach begin="1" end="14" varStatus="i">
						<td>
							<input id="g${i.index}" value="g${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="g${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					
					<tr style="height: 20px;"></tr>
					
					<tr>
						<td><p class="seats_row_label">F</p></td>
						<c:forEach begin="1" end="16" varStatus="i">
						<td>
							<input id="f${i.index}" value="f${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="f${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					<tr>
						<td><p class="seats_row_label">E</p></td>
						<c:forEach begin="1" end="16" varStatus="i">
						<td>
							<input id="e${i.index}" value="e${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="e${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					<tr>
						<td><p class="seats_row_label">D</p></td>
						<c:forEach begin="1" end="13" varStatus="i">
						<td>
							<input id="d${i.index}" value="d${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="d${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					<tr>
						<td><p class="seats_row_label">C</p></td>
						<c:forEach begin="1" end="13" varStatus="i">
						<td>
							<input id="c${i.index}" value="c${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="c${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					
					<tr style="height: 20px;"></tr>
					
					<tr>
						<td><p class="seats_row_label">B</p></td>
						<c:forEach begin="1" end="16" varStatus="i">
						<td>
							<input id="b${i.index}" value="b${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="b${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					<tr>
						<td><p class="seats_row_label">A</p></td>
						<c:forEach begin="1" end="16" varStatus="i">
						<td>
							<input id="a${i.index}" value="a${i.index}" class="seats" name="seat_no" type="checkbox">
    						<label for="a${i.index}" class="seats-label"></label>	
						</td>
						</c:forEach>
					</tr>
					<tr>
						<td colspan="18">
							<br>
							<p class="text-center" style="color: orange;font-weight: 600;font-family: 'PT Sans', sans-serif;">
							All Eyes this way please !</p>
							
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="-1 -1 262 22" id="icon-screen" width="100%" height="100%">
							<g fill="none" fill-rule="evenodd" opacity=".3">
							<g fill="#E1E8F1">
								<path id="da" d="M27.1 0h205.8L260 14.02H0z">
								</path>
							</g>
							<path stroke="#4F91FF" stroke-width=".65" d="M27.19.33L1.34 13.7h257.32L232.81.32H27.2z"></path>
							<path fill="#8FB9FF" d="M28.16 2.97h203.86l17.95 9.14H10.35z"></path>
							<g fill="#E3ECFA">
								<path id="db" d="M0 13.88h260l-3.44 6.06H3.44z"></path>
							</g>
							<path stroke="#4F91FF" stroke-width=".65" d="M.56 14.2l3.07 5.41h252.74l3.07-5.4H.56z">
							</path>
							</g>
							</svg>
							
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-sm-4 seats-right">
		<br>
		<h5>SELECTED SEATS</h5>
		<div id="selected-seats">

		</div>
		<div class="purchase-button">
			<button class="btn-purchase" type="submit">Purchase</button>
		</div>
		</div>
	</div>
</div>
</form>
<script src="<c:url value="/webjars/jquery/3.4.0/jquery.js" /> "></script>
<script src="<c:url value="/webjars/bootstrap/3.4.0/js/bootstrap.min.js" />"></script>
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
	getDayName();
	
	$('.dates').click(function() { 
    	var list = document.getElementsByClassName("dates");
    	for(var i=0;i<list.length;i++){
    		list[i].style.color = "#567580";	
    	}
    	document.getElementById(this.id).style.color = "#000";
    	$(".show_date").html(
    			$('<input>', {
    		        type: 'hidden',
    		        name: 'booking_day',
    		        id: 'selected_date',
    		        val: document.getElementById(this.id).id
    		    })
    	);
    	initSeats();	
    });
	
    $('.time').click(function() { 
    	var list = document.getElementsByClassName("time");
    	for(var i=0;i<list.length;i++){
    		list[i].style.color = "#567580";	
    	}
    	document.getElementById(this.id).style.color = "#000";
    	$(".show_time").html(
    			$('<input>', {
    		        type: 'hidden',
    		        name: 'booking_time',
    		        id: 'selected_time',
    		        val: $(this).text().trim()
    		    })
    	);
    	initSeats();	
    });

    
    /***************************
    *****Seat Selection code****
    ***************************/
    var seats = $('.seats');
    $('.seats').on('click',function (e) {
        if (this.checked) {
            addSelectedSeat(this.id);
        } else {
            removeSelectedSeat(this.id);
        }
    });
    
});
var flag = 0;
var seatPrice = 0;
function addSelectedSeat(id){
	var selectedSeat = document.getElementById('selected-seats');
	selectedSeat.innerHTML +=
			`<div class="seat-info" id="seat_`+id+`">
				<span class="seat-name"><i class="material-icons">event_seat</i>&nbsp;`+id+`</span>
				<span class="pull-right close" onclick="$('#`+id+`').prop('checked', false);removeSelectedSeat('`+id+`');"><i class="fa fa-times" aria-hidden="true"></i></span>
				<p class="price-tag">‎&#x20a8; 230</p>
			</div>
			`;
	flag = flag+1;
	seatPrice = seatPrice+230;
	$(".seats-right h5").html("SELECTED SEATS  (  "+(flag)+"  )  ");
	$(".btn-purchase").html("PURCHASE   ( &#x20a8; "+seatPrice+"  )  ");
	$(".fields_cost").html(
			$('<input>', {
		        type: 'hidden',
		        name: 'cost',
		        val: seatPrice
		    })
	);
	$(".fields_no_of_seats").html(
		$('<input>', {
	        type: 'hidden',
	        name: 'no_of_seats',
	        val: flag
	    })
    );
}

function removeSelectedSeat(id){
		flag = flag-1;
		seatPrice = seatPrice-230;
		$(".seats-right h5").html("SELECTED SEATS  (  "+(flag)+"  )  ");
		$(".btn-purchase").html("PURCHASE   ( &#x20a8; "+seatPrice+"  )  ");
		$("#seat_"+id).remove();
		$("#seat"+id).prop('checked', false);	
		$(".fields_cost").html(
				$('<input>', {
			        type: 'hidden',
			        name: 'cost',
			        val: seatPrice
			    })
		);
		$(".fields_no_of_seats").html(
			$('<input>', {
		        type: 'hidden',
		        name: 'no_of_seats',
		        val: flag
		    })
	    );
}


</script>
<c:if test="${size>0}">
<script>
function getSelectedSeat(data){
	for(var i=0;i<data.length;i++){
		$("#"+data[i]+" + .seats-label").addClass('selected');
		$( "#"+data[i]+"" ).prop( "disabled", true );
	}
	
}	

function initSeats(){
	$(".seats + .seats-label").removeClass('selected');
	$( ".seats" ).prop( "disabled", false );
	var date_value = decodeURIComponent($("#selected_date").val());
	$.ajax({
		url:'/MovieBingeOffline/seatByDate',
		type:'GET',
		contentType: "application/json",
		data: { date: date_value, movie_id : $("#movieId").val(), time: $("#selected_time").val()} ,
		success: function(d){
			getSelectedSeat(d);
		}
	});	
}

function getDayName(){
	var d = new Date();
	  var weekday = new Array(7);
	  weekday[0] = "Sun";
	  weekday[1] = "Mon";
	  weekday[2] = "Tue";
	  weekday[3] = "Wed";
	  weekday[4] = "Thu";
	  weekday[5] = "Fri";
	  weekday[6] = "Sat";

	  var dayCount = d.getDay();
	  
	  var dates = [];
	  for(var i=0;i<8;i++){
		  if(dayCount>6){
			  dayCount = 0;
		  }			  
		  dates[i] = weekday[dayCount];
		  dayCount += 1;
	  }
	  
	  var list = document.getElementsByClassName("dates");
	  for(var i=0;i<list.length;i++){
		var d = new Date();
		var date = d.getDate();
		list[i].innerHTML = dates[i]+'<br>'+(date+i);
		
		var dd = String(date+i).padStart(2, '0');
		var mm = String(d.getMonth()+1).padStart(2, '0'); //January is 0!
		var yyyy = d.getFullYear();

		today = mm + '/' + dd + '/' + yyyy;
	    
		list[i].id = today;
	  }
	  
}

</script>
</c:if>


</body>
</html>