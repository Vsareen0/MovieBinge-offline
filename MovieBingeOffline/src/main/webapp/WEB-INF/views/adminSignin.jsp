<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ page isELIgnored="false" %>
<title>Admin Login</title>
<link href="<c:url value="/resources/css/material.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href='<c:url value="/resources/css/adminSignin.css"/>' rel="stylesheet">
</head>

<body>
<div class="container">
	<div class="login-form">    
	    <form action="/MovieBingeOffline/processAdminLogin" method="POST">
			<div class="avatar"><i class="material-icons">account_circle</i></div>
	    	<h4 class="modal-title">Login to Your Admin Account</h4>
	    	<h6 style="color:red;">${error}</h6>
	        <div class="form-group">
	            <input type="text" class="form-control" placeholder="Username" required="required" name="name">
	        </div>
	        <div class="form-group">
	            <input type="password" class="form-control" placeholder="Password" required="required" id="pass" name="password">
	            <br>
	            <input type="checkbox" onclick="showPass()">Show Password
	        </div>
	        <div class="form-group small clearfix">
	            <label class="checkbox-inline"><input type="checkbox"> Remember me</label>
	        </div> 
	        <input type="submit" class="btn btn-primary btn-block btn-lg" value="Login">              
	    </form>			
	</div>	
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/assets/js/core/jquery.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/js/core/popper.min.js" />" type="text/javascript"></script>
<script>
function showPass() {
  var x = document.getElementById("pass");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
</body>
</html>