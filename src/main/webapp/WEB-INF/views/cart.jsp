<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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




	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">

			<div class="navbar-header">
				<div class="row">
					<div class="col-md-3">
						<a class="navbar-brand" id="myshop"
							href="${pageContext.request.contextPath}/">MyShop</a>
					</div>
					<div class="col-md-9">
						<button type="button"
							class="navbar-toggle collapsed burger-button"
							data-toggle="collapse" data-target="#navi">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
				</div>
			</div>

			<div class="collapse navbar-collapse" id="navi">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;
							<sec:authentication property="name" /> <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/item/sell">Sell</a></li>
							<li><a
								href="${pageContext.request.contextPath}/account/on-sale">On
									Sale</a></li>
							<li><a
								href="${pageContext.request.contextPath}/account/sold">Sold</a></li>
							<li><a
								href="${pageContext.request.contextPath}/account/bought">Bought</a></li>
							<li class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/account/account-settings">Your
									Account</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath}/cart"> <span
							class="glyphicon glyphicon-shopping-cart"></span> <span
							class="badge badge-danger" id="itemsInCart">
								${sessionScope.itemsInTheCart}</span> Cart
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/j_spring_security_logout"><span
							class="glyphicon glyphicon-log-out"></span>&nbsp;Logout</a></li>
				</ul>
				<form class="navbar-form text-center" role="search">
					<div class="input-group add-on">
						<input class="form-control" id="search-query"
							placeholder="What you're looking for?" type="text">
						<div class="input-group-btn">
							<button class="btn btn-danger" type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</div>
					</div>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>


	<!---------------------PAGE-CONTENT-------------------->
	<div class="container text-center min-hght" id="cart-content">
		<c:choose>
			<c:when test="${sessionScope.itemsInTheCart > 0}">
				<h3 class="font-bold">Currently in your cart:</h3>
				<table class="table table-striped table-bordered">
					<thead>
						<tr class="background-danger text-center">
							<th>Item</th>
							<th>Amount</th>
							<th>Total</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="total" value="${0}" />
						<c:forEach var="transaction" items="${transactions}">
							<c:set var="total"
								value="${total + transaction.price*transaction.quantity}" />
							<c:set var="formId" value="${transaction.id}" />

							<tr>
								<form:form action="cart/delete-from-cart" method="POST"
									id="${formId}">
									<td><a
										href="${pageContext.request.contextPath}/item/view?id=${transaction.itemId}">${transaction.name}</a>
									</td>
									<td>${transaction.quantity}x$${transaction.price}</td>
									<td>$${transaction.price*transaction.quantity}</td>
									<td>
										<!-- onclick="document.getElementById(${formId}).submit()" -->
										<span data-toggle="tooltip" title="delete"
										class="glyphicon glyphicon-remove-circle color-danger delete-icon"
										onclick="deleteTransaction(${formId})"></span>
									</td>
									<input type="hidden" name="itemId" id="itemId${formId}"
										value="${transaction.itemId}" />
									<input type="hidden" name="quantity" id="quantity${formId}"
										value="${transaction.quantity}" />
									<input type="hidden" name="transactionId"
										id="transactionId${formId}" value="${transaction.id}" />
								</form:form>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="cart-wrapper">
					<div class="text-left m-y-10 col-md-4">
						<a href="${pageContext.request.contextPath}/cart/delete-all"><button
								class="btn btn-danger">Delete all</button></a>
					</div>
					<div class="text-center col-md-4 offset-md-4">
						<h4 class="font-bold">Grand total: $${total}</h4>
					</div>
					<div class="text-right m-y-10 col-md-4 offset-md-8">
						<a href="${pageContext.request.contextPath}/cart/payment"><button
								class="btn btn-success">Payment options</button></a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<h3 class="font-bold">Your cart is empty</h3>
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
	<script src="<spring:url value="/resources/js/jquery.js"/>"></script>
	<script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>

	<script type="text/javascript">
		
	function deleteTransaction(formId){
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/cart/delete-from-cart/",
			data: {
		        'itemId': $('#itemId'+formId).val(),
		        'quantity': $('#quantity'+formId).val(),
		        'transactionId': $('#transactionId'+formId).val()
		   	},
		   	success: function(res){
		   		var c = $("#itemsInCart").html();
		   		c--;
		   		$("#itemsInCart").html(c);
		   		showItems(formId,c);
		   	},
		   	error: function(res){
		   		alert("error"+formId);
		   	}
		});
	}
	
	function showItems(formId,c){
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/cart/view",
			data: {
		        'userName': $('#userName'+formId).val()
		   	},
		   	success: function(res){
				var result="";
				if(c<=0) {
					result='<h3 class="font-bold">Your cart is empty</h3>';
				}else{
					result+=`<h3 class="font-bold">Currently in your cart(ajax):</h3>
						<table class="table table-striped table-bordered">
						<thead>
							<tr class="background-danger text-center">
								<th>Item</th>
								<th>Amount</th>
								<th>Total</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="total" value="${0}" />`;
						var total=0;
					$.each(res,function(k,v){
						total+=v.price*v.quantity;
						var formId=v.id;
						
						result+=`
						<tr>
							<form:form action="cart/delete-from-cart" method="POST" id="`+formId+`">
								<td><a
								href="${pageContext.request.contextPath}/item/view?id=`+v.itemId+`">`+v.name+`</a></td>
								<td>`+v.quantity+`x$`+v.price+`</td>
								<td>$`+v.price*v.quantity+`</td>
								<td>
									<span data-toggle="tooltip" title="delete"
									class="glyphicon glyphicon-remove-circle color-danger delete-icon"
									onclick="deleteTransaction(`+formId+`)"></span>
								</td>
								<input type="hidden" name="itemId" id="itemId`+formId+`"
									value="`+v.itemId+`" />
								<input type="hidden" name="quantity" id="quantity`+formId+`"
									value="`+v.quantity+`" />
								<input type="hidden" name="transactionId"
									id="transactionId`+formId+`" value="`+v.id+`" />
							</form:form>
						</tr>`;
					});
					result+=`</tbody>
						</table>
						<div class="cart-wrapper">
							<div class="text-left m-y-10 col-md-4">
								<a href="${pageContext.request.contextPath}/cart/delete-all"><button
										class="btn btn-danger">Delete all</button></a>
							</div>
							<div class="text-center col-md-4 offset-md-4">
								<h4 class="font-bold">Grand total: $`+total+`</h4>
							</div>
							<div class="text-right m-y-10 col-md-4 offset-md-8">
								<a href="${pageContext.request.contextPath}/cart/payment"><button
										class="btn btn-success">Payment options</button></a>
							</div>
						</div>`;
				}
				$('#cart-content').html(result);
		   	},
		   	error: function(res){
		   		alert("error"+formId);
		   	}
		});
	}
	
	</script>
	<!--------------/LOADING SCRIPTS AND SO ON------------->


</body>
</html>
