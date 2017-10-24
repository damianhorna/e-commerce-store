<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
			<div class="col-md-3">
				<p class="lead">Categories</p>
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/category/list?category=electronics"
						class="list-group-item"><span
						class="glyphicon glyphicon-headphones"></span>&nbsp;Electronics</a> <a
						href="${pageContext.request.contextPath}/category/list?category=home"
						class="list-group-item"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a>
					<a
						href="${pageContext.request.contextPath}/category/list?category=sport"
						class="list-group-item"><span class="glyphicon glyphicon-fire"></span>&nbsp;Sport</a>
					<a
						href="${pageContext.request.contextPath}/category/list?category=fashion"
						class="list-group-item"><span
						class="glyphicon glyphicon-sunglasses"></span>&nbsp;Fashion</a>
				</div>
			</div>

			<div class="col-md-9">
				<div id="items-holder">
					<div class="text-center" id="from-category">
						<h3 class="font-bold">Products from category "${category}":</h3>
					</div>
					<c:forEach var="tempItem" items="${items}">
						<div class="media item-for-sale"
							onclick="window.location='${pageContext.request.contextPath}/item/view?id=${tempItem.id}';">

							<div class="media-left">
								<img
									src="<spring:url value="/resources/img/items/${tempItem.id}-0.png"/>"
									class="media-object"
									width="100" height="100" alt="benefit"
									onerror="this.src='<spring:url value="/resources/img/no-img.png"/>'" />
							</div>
							<div class="media-body">
								<h4 class="media-heading">
									<a
										href="${pageContext.request.contextPath}/item/view?id=${tempItem.id}">${tempItem.name}</a>
								</h4>
								<p>${tempItem.shortDescription}</p>
								<span class="label label-danger label-price">$${tempItem.price}</span>
							</div>

						</div>
					</c:forEach>
				</div>
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
