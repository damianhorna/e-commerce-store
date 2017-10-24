<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
					<a href="${pageContext.request.contextPath}/category/list?category=electronics" class="list-group-item"><span
						class="glyphicon glyphicon-headphones"></span>&nbsp;Electronics</a> <a
						href="${pageContext.request.contextPath}/category/list?category=home" class="list-group-item"><span
						class="glyphicon glyphicon-home"></span>&nbsp;Home</a> <a href="${pageContext.request.contextPath}/category/list?category=sport"
						class="list-group-item"><span class="glyphicon glyphicon-fire"></span>&nbsp;Sport</a>
					<a href="${pageContext.request.contextPath}/category/list?category=fashion" class="list-group-item"><span
						class="glyphicon glyphicon-sunglasses"></span>&nbsp;Fashion</a>
				</div>
			</div>

			<div class="col-md-9">

				<div class="row carousel-holder">

					<div class="col-md-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img class="slide-image"
										src="<spring:url value="/resources/img/carousel/carousel-pic-7.png"/>">
								</div>
								<div class="item">
									<img class="slide-image"
										src="<spring:url value="/resources/img/carousel/carousel-pic-6.png"/>">
								</div>
								<div class="item">
									<img class="slide-image"
										src="<spring:url value="/resources/img/carousel/carousel-pic-4.jpg"/>">
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-example-generic"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>

				</div>

				<div class="row">

					<div class="col-sm-12 col-lg-12 col-md-12">
						<hr>
						<p class="lead font-bold">Recommended for You</p>
					</div>
					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img class="pic-for-sale" src="<spring:url value="/resources/img/xiaomi-redmi-4a.jpg"/>" alt="">
							<div class="caption">
								<h4 class="pull-right">$24.99</h4>
								<h4>
									<a href="${pageContext.request.contextPath}/item/view">Xiaomi Redmi 4A 2/32</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">15 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="<spring:url value="/resources/img/iPhone7.jpg"/>" alt="">
							<div class="caption">
								<h4 class="pull-right">$64.99</h4>
								<h4>
									<a href="#">Apple iPhone 7 32GB</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">12 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="<spring:url value="/resources/img/galaxy-s8.jpg"/>" alt="">
							<div class="caption">
								<h4 class="pull-right">$74.99</h4>
								<h4>
									<a href="#">Samsung Galaxy S8</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">31 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-12 col-lg-12 col-md-12">
						<hr>
						<p class="lead font-bold">Lastly viewed</p>
					</div>
					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="http://placehold.it/320x150" alt="">
							<div class="caption">
								<h4 class="pull-right">$84.99</h4>
								<h4>
									<a href="#">Fourth Product</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">6 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="http://placehold.it/320x150" alt="">
							<div class="caption">
								<h4 class="pull-right">$94.99</h4>
								<h4>
									<a href="#">Fifth Product</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">18 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="http://placehold.it/320x150" alt="">
							<div class="caption">
								<h4 class="pull-right">$104.99</h4>
								<h4>
									<a href="#">Sixth Product</a>
								</h4>
								<p>This is a short description. Lorem ipsum dolor sit amet,
									consectetur adipiscing elit.</p>
							</div>
							<div class="ratings">
								<p class="pull-right">18 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

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
