<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ page isELIgnored="false" %>
<link href="<c:url value="/resources/css/material.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/addNewMovie.css" />" rel="stylesheet">
</head>
<body>
	<form action="/MovieBingeOffline/updateToDatabase" method="POST">
	<table border="0">
		<tbody>
		<tr>
			<th>Movies</th>
		</tr>
		<tr>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Title</label>
				  <input type="text" class="form-control" name="title" value="${movie.title}">
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Original Title</label>
				  <input type="text" class="form-control" name="original_title" value="${movie.title}">
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Release Date</label>
				  <input name="release_date" type="text" class="form-control datepicker" value="${movie.release_date}">
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Vote Average</label>
				  <input type="text" class="form-control" name="vote_average" value="${movie.vote_average}">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Overview</label>
				  <input type="text" class="form-control" name="overview" value="${movie.overview}">
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Poster Path</label>
				  <input type="text" class="form-control" name="poster_path" value="${movie.poster_path}">
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Backdrop Path</label>
				  <input type="text" class="form-control" name="backdrop_path" value="${movie.backdrop_path}">
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <select name="category" class="selectpicker" data-style="select-with-transition" title="${movie.category}" data-size="7" required>
                    <option disabled>Choose Category</option>
                    <option value="Now Playing">Now Playing</option>
					<option value="Upcoming">Upcoming</option>
                  </select>
				</div>
			</td>
		</tr>
		
		<!-- Movie Details -->
		<tr>
			<th>More Details</th>
		</tr>
		<tr>
			<td>
				<div class="form-group bmd-form-group">
					<select name="genres" class="selectpicker" data-style="select-with-transition" multiple title="${movieDetails.genres}" data-size="7" required>
                    	<option disabled> Choose Genre(s)</option>
                    	<option value="Action">Action</option>
					  	<option value="Adventure">Adventure</option>
					  	<option value="Fantasy">Fantasy</option>
					  	<option value="Sports">Sports</option>
					  	<option value="Drama">Drama</option>
					  	<option value="Comedy">Comedy</option>
					  	<option value="Science">Science</option>
                   </select>
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">HomePage</label>
				  <input type="text" class="form-control" name="homepage" value="${movieDetails.homepage}">
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Tagline</label>
				  <input type="text" class="form-control" name="tagline" value="${movieDetails.tagline}">
				</div>
			</td>
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Runtime</label>
				  <input type="text" class="form-control" name="runtime" value="${movieDetails.runtime}">
				</div>
			</td>
		</tr>
		<tr>
			<th>Trailers</th>
		</tr>
		<tr>
			<c:forEach items="${trailers}" var="trailer" varStatus="i">
			<td>
				<div class="form-group bmd-form-group">
				  <label class="bmd-label-floating">Video Key ${i.index+1}</label>
				  <input type="text" class="form-control" name="videoKey" value="${trailer}">
				</div>
			</td>
			</c:forEach>
			<td>
				<input type="submit" class="btn btn-success" value="Update Info">
			</td>
		</tr>
		</tbody>
	</table>
	</form>

<script src="<c:url value="/resources/assets/js/core/jquery.min.js" />" type="text/javascript"></script>

<script src="<c:url value="/resources/assets/js/core/popper.min.js" />" type="text/javascript"></script>

<script src="<c:url value="/resources/assets/js/core/bootstrap-material-design.min.js" />" type="text/javascript"></script>

<script src="<c:url value="/resources/assets/js/plugins/bootstrap-tagsinput.js"/>"> </script>

<script src="<c:url value="/resources/assets/js/plugins/moment.min.js"/>"> </script>

<script src="<c:url value="/resources/assets/js/plugins/bootstrap-datetimepicker.js"/>"> </script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>


<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

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
</body>
</html>