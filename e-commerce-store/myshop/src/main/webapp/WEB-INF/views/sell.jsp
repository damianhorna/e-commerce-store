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

		<h3>Provide some info about the product you're selling:</h3>
		<br/>
		<div class="row"> 
		<div class="col-md-6 col-md-offset-3 text-left">
		<form:form action="sell" modelAttribute="itemToSell" method="POST" enctype="multipart/form-data">
			<h4>Title of the offer<span class="required">*</span>:</h4>
			<form:input class="form-control" path="name" maxlength="50"/>
			<form:errors path="name" cssClass="error"/>
			<h4>Category<span class="required">*</span>:</h4>
			<form:select class="form-control" path="category" items="${availableCategories}"/>
			<h4>Short description:</h4>
			<form:input class="form-control" path="shortDescription" maxlength="130"/>
			<h4>Long description:</h4>
			<form:textarea class="form-control" rows="5" path="longDescription" style="resize:none;"></form:textarea>
			<h4>Base price<span class="required">*</span>:</h4>
			<form:input class="form-control" type="number" step="0.01" min="0" path="price"/>
			<form:errors path="price" cssClass="error"/>
			<h4>Quantity<span class="required">*</span>:</h4>
			<form:input class="form-control" type="number" path="quantity" min="0"/>
			<form:errors path="quantity" cssClass="error"/>
			<h4>Picture:</h4>
			<input type="file" name="file"/>
			<br/>
			<span class="required">*</span> means that the field is required
			<div class="text-center">
			<input type="submit" value="Confirm and sell" class="btn btn-block btn-danger" />
			</div>
		</form:form>
		</div>
		</div>

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
	<script src="<spring:url value="/resources/js/jquery.js"/>"></script>
	<script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
	<!--------------/LOADING SCRIPTS AND SO ON------------->


</body>
</html>
