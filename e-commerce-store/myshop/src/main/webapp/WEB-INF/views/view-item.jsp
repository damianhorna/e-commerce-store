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
	<div class="container">

		<div class="row">
			<div class="col-md-3 text-center" style="padding: 0px;">
				<img
					src="<spring:url value="/resources/img/items/${item.id}-0.png"/>"
					width="300" height="300" alt="benefit"
					onerror="this.src='<spring:url value="/resources/img/no-img.png"/>'" />
			</div>

			<div class="col-md-9 text-center" id="item-view-operations">


				<h3 class="font-bold">${item.name}</h3>
				<form:form action="transaction" modelAttribute="item" method="POST">
					<div class="row">
						<div class="col-md-6 col-md-offset-3" id="item-view-info">
							<div class="row">
								<div class="col-xs-6 text-left">
									Base price:<br /> Quantity<span id="available-items">&nbsp;(${item.quantity}
										available)</span>:<br /> Total:
								</div>
								<div class="col-xs-6 text-right">
									<form:hidden path="id" />
									$<span id="price">${item.price}</span><br /> <input
										id="item-view-quantity-input" type="number" name="quantity"
										min="1" max="${item.quantity}" value="1"><br /> <span
										id="total">$${item.price}</span>
								</div>
							</div>
						</div>
					</div>

					<div id="item-view-wrapper">
						<div id="item-view-inner">
							<input type="submit" name="action" value="Buy now"
								class="btn btn-success" /> <input type="submit" name="action"
								value="Add to cart" class="btn btn-danger" />
						</div>
					</div>
				</form:form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" id="item-view-description">
				<h3 class="font-bold">Description</h3>
				<div>${item.longDescription}</div>
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
	<script src="<spring:url value="/resources/js/view-item.js"/>"></script>
	<!--------------/LOADING SCRIPTS AND SO ON------------->


</body>
</html>
