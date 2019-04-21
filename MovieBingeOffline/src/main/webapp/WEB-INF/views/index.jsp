<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<%@ page isELIgnored="false" %>
	<meta charset="UTF-8">
</head>
<body>
<h2>Hello World!</h2>

<h3>${hello} !</h3>

<c:forEach items="${v}" var="t">
	${t.id} &nbsp;&nbsp; ${t.name} <br>
</c:forEach>
</body>
</html>
