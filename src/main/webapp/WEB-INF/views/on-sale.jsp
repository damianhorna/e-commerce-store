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
		<c:choose>
			<c:when test="${itemsOnSale > 0}">
				<h3 class="font-bold">You're currently selling:</h3>
				<table class="table table-striped table-bordered">
					<thead>
						<tr class="background-danger text-center">
							<th>Item</th>
							<th>Amount</th>
							<th>Price</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items}">
							<c:set var="formId" value="${item.id}" />

							<tr>
								<form:form action="on-sale-actions" method="POST" id="${formId}">
									<td><a
										href="${pageContext.request.contextPath}/item/view?id=${transaction.itemId}">${item.name}</a>
									</td>
									<td>${item.quantity}</td>
									<td>$${item.price}</td>
									<td><span data-toggle="tooltip" title="delete"
										class="glyphicon glyphicon-remove-circle color-danger delete-icon clickable"
										onclick="document.getElementById('action${formId}').value='delete';document.getElementById('${formId}').submit();"></span>&nbsp;&nbsp;<span
										data-toggle="tooltip" title="edit"
										class="glyphicon glyphicon-edit color-primary edit-icon clickable"
										onclick="document.getElementById('action${formId}').value='edit';document.getElementById('${formId}').submit();"></span></td>
									<input type="hidden" name="id" value="${item.id}" />
									<input type="hidden" name="quantity" value="${item.quantity}" />
									<input type="hidden" name="action" id="action${formId}"
										value="default" />
								</form:form>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h3 class="font-bold">You have nothing to sell</h3>
			</c:otherwise>
		</c:choose>
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
