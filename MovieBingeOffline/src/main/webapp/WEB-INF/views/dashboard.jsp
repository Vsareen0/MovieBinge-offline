<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<%@ page isELIgnored="false" %>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="<c:url value="/webjars/font-awesome/4.7.0/css/font-awesome.min.css" />">
<link href="https://fonts.googleapis.com/css?family=PT+Sans&display=swap" rel="stylesheet">
<style>
	.box{
		display: flex;
		width: 100%;
		height: auto;
	}
	.cards{
		width: 285px;
		height: 125px;
		margin-top: 15px;
		margin-left: 45px;
		background-color: #dedede; 
	}
	h3{	
		font-weight: 700;
		font-family: 'PT Sans', sans-serif;
	}
	p{
		font-family: 'PT Sans', sans-serif;
	}
	.fa{
		font-size: 40px;
		padding-left: 10px;
	}
</style>
</head>
<body>
	<div class="box">
		<div class="cards">
			<h3><i class="fa fa-film" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;Movies Currently playing</h3>
			<p>No. of movies playing : ${sizeOfPlayingMovies}</p>
		</div>
		<div class="cards">
			<h3><i class="fa fa-money" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;Total Tickets Booked</h3>
			<p>No. of tickets booked : ${sizeOfBookedTickets}</p>
		</div>
		<div class="cards">
			<h3><i class="fa fa-ban" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;Tickets Cancelled</h3>
			<p>No. of tickets cancelled : ${sizeOfCancelledTickets}</p>
		</div>
	</div>
</body>
</html>