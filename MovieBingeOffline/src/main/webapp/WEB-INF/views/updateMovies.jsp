<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ page isELIgnored="false" %>
<link href="<c:url value="/resources/css/material.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<table class="table table-striped">
   <thead>
     <tr>
       <th class="text-center">#</th>
       <!-- <th></th> --> 
       <th>Movie Title</th>
       <th>Release Date</th>
       <th>Category</th>
       <th>Front Poster</th>
       <th>Back Poster</th>
     </tr>
   </thead>
   <tbody>
   <c:forEach items="${allMovies}" var="movie" varStatus="i">
     <tr>
       <td class="text-center">${i.index+1}</td>
      <!-- <td class="text-center">
         <div class="form-check">
           <label class="form-check-label">
             <input class="form-check-input" type="checkbox" value="" checked>
             <span class="form-check-sign">
               <span class="check"></span>
             </span>
           </label>
         </div>
       </td> --> 
       <td>${movie.title}</td>
       <td>${movie.release_date}</td>
       <td>${movie.category}</td>
       <td><img src="http://image.tmdb.org/t/p/w500/${movie.poster_path}" width="70" height="100"></td>
       <td><img src="http://image.tmdb.org/t/p/w500/${movie.backdrop_path}" width="150" height="70"></td>
       <td>
       		<a rel="tooltip" class="btn btn-success btn-just-icon" href="/MovieBingeOffline/updateMovies/${movie.movieId}">
                <i class="material-icons">create</i>
              <div class="ripple-container"></div>
            </a>
       </td>
     </tr>
     </c:forEach>
   </tbody>
 </table>
 <ul class="pagination pagination-info">
      <li class="page-item">
        <a href="javascript:void(0);" class="page-link"> prev</a>
      </li>
      <c:forEach varStatus="pageId" begin="0" end="${total_pages-1}">
	      <li class="active page-item">
	        <a href="/MovieBingeOffline/updatePagination/${pageId.index+1}" class="page-link">${pageId.index+1}</a>
	      </li>
      </c:forEach>
      <li class="page-item">
        <a href="javascript:void(0);" class="page-link">next </a>
      </li>
    </ul>

 <script src="<c:url value="/resources/assets/js/core/jquery.min.js" />" type="text/javascript"></script>

<script src="<c:url value="/resources/assets/js/core/popper.min.js" />" type="text/javascript"></script>

<script src="<c:url value="/resources/assets/js/core/bootstrap-material-design.min.js" />" type="text/javascript"></script>

<script src="<c:url value="/resources/assets/js/plugins/bootstrap-tagsinput.js"/>"> </script>

<script src="<c:url value="/resources/assets/js/plugins/moment.min.js"/>"> </script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="<c:url value="/resources/assets/js/material-kit.js?v=2.1.1"/>" type="text/javascript"></script>
 
</body>
</html>