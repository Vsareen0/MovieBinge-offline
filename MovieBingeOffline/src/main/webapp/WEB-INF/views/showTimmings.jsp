<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ page isELIgnored="false" %>
<link href="<c:url value="/resources/css/material.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
table tr td{
	padding-left: 25px;
}

#timeSet div{
	vertical-align: bottom;
	display: inline-block;
}
</style>
</head>
<body>
<table>
		
<form action="/MovieBingeOffline/addShowTimmings" method="POST">
		<tr>
		<td>
			<div class="form-group bmd-form-group">
			  <select name="movieId" class="selectpicker" data-style="select-with-transition" title="Choose Movie" data-size="7">
                   <option disabled>Choose Movie</option>
                   	<c:forEach items="${movies}" var="movie">
                   		<option value="${movie.movieId}">${movie.title}</option>
					</c:forEach>	
                 </select>
			</div>
		</td>
		</tr>
		<tr>
		<td>
			<div class="form-group bmd-form-group">
			  <select name="theatre_room_no" class="selectpicker" data-style="select-with-transition" title="Choose Theatre Room" data-size="7">
                   <option disabled>Choose Room No.</option>
                   <option value="AX1">AX1</option>
                   <option value="BY2">BY2</option>
                   <option value="CZ3">CZ3</option>	
                 </select>
			</div>
		</td>
		</tr>	
		<tr>
			<td>
			<div id="timeSet">
					<div class="form-group bmd-form-group">
						<span>
					  	    <label class="label-control">Time Picker</label>
					  	    <button type="button" class="btn btn-primary btn-fab btn-round" onclick="addNewTimeSetter();">
			                	<i class="fa fa-plus" aria-hidden="true"></i>
			             	</button>
		             	</span>
		                <input type="text" class="form-control timepicker" value="14:00" name="setTime">
					</div>
			</div>
			</td>
		</tr>
		<tr>
		<td>
			<input type="submit" class="btn btn-success" value="Add Show ">
		</td>
		</tr>
</form>
</table>
<script>
function addNewTimeSetter(){
	$("#timeSet").append(`<div class="form-group bmd-form-group">
		      <label class="label-control">Time Picker</label>
		      <input type="text" class="form-control timepicker" value="14:00" name="setTime">
		    </div>
	`);
}
</script>
<script src="<c:url value="/resources/assets/js/core/jquery.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/core/popper.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/core/bootstrap-material-design.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/plugins/bootstrap-tagsinput.js"/>"> </script>
<script src="<c:url value="/resources/assets/js/plugins/moment.min.js"/>"> </script>
<script src="<c:url value="/resources/assets/js/plugins/bootstrap-datetimepicker.js"/>"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<script src="<c:url value="/resources/assets/js/plugins/bootstrap-selectpicker.js"/>"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="<c:url value="/resources/assets/js/plugins/nouislider.min.js"/>"></script>
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