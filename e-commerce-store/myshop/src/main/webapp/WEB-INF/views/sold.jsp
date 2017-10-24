<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<spring:url value="/resources/img/favicon.ico"/>">


<title>MyShop</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="<spring:url value="/resources/css/bootstrap.min.css"/>" />

<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="<spring:url value="/resources/css/index.css"/>" type="text/css" />

</head>

<body>

	<!----------------------NAVIGATION--------------------->
	<%@ include file="common/nav.jspf"%>
	<!---------------------/NAVIGATION--------------------->


	<!---------------------PAGE-CONTENT-------------------->
	<div class="container text-center min-hght">
		<h1>Sold</h1>
	</div>
	<!-- /.container -->

	<div class="container">
		<!-- Footer -->
		<footer>
			<hr>
			<div class="row">
				<div class="col-lg-12 text-center">
					<p>Copyright &copy; Damian Horna</p>
				</div>
			</div>
		</footer>

	</div>
	<!--------------------/PAGE-CONTENT-------------------->





	<!---------------LOADING SCRIPTS AND SO ON------------->
	<script src="<spring:url value="/resources/js/cart.js"/>"></script>
	<script src="<spring:url value="/resources/js/jquery.js"/>"></script>
	<script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
	<!--------------/LOADING SCRIPTS AND SO ON------------->


</body>
</html>
