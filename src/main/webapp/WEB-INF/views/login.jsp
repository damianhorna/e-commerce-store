<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	href="<spring:url value="/resources/css/loginPage.css"/>"
	type="text/css" />

</head>

<body onload="document.f.j_username.focus();"
	background="${pageContext.request.contextPath}/resources/img/dark.png">

	<!---------------------PAGE-CONTENT-------------------->
	<div class="text-center" id="centered-login">
		<div class="form">

			<ul class="tab-group">
				<li class="tab active"><a href="#signup">Sign Up</a></li>
				<li class="tab"><a href="#login">Log In</a></li>
			</ul>

			<div class="tab-content">
				<div id="signup">
					<h1>Sign Up for Free</h1>

					<form action="/" method="post">

						<div class="top-row">
							<div class="field-wrap">
								<label> First Name<span class="req">*</span>
								</label> <input type="text" required autocomplete="off" />
							</div>

							<div class="field-wrap">
								<label> Last Name<span class="req">*</span>
								</label> <input type="text" required autocomplete="off" />
							</div>
						</div>

						<div class="field-wrap">
							<label> Email Address<span class="req">*</span>
							</label> <input type="email" required autocomplete="off" />
						</div>

						<div class="field-wrap">
							<label> Set A Password<span class="req">*</span>
							</label> <input type="password" required autocomplete="off" />
						</div>

						<button type="submit" class="button button-block">Get
							Started</button>

					</form>

				</div>

				<div id="login">
					<h1>Welcome Back!</h1>

					<form action="j_spring_security_check" name="f" method="post">

						<div class="field-wrap">
							<label> Email Address<span class="req">*</span>
							</label> <input type="email" required autocomplete="off"
								name="j_username" />
						</div>

						<div class="field-wrap">
							<label> Password<span class="req">*</span>
							</label> <input type="password" required autocomplete="off"
								name="j_password" />
						</div>

						<p class="forgot">
							<a href="#">Forgot Password?</a>
						</p>
						<c:if test="${not empty error}">
							<div class="error-block">
								Your login was unsuccessful. <br /> Caused by:
								${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
							</div>
						</c:if>
						<button class="button button-block">Let me in.</button>

					</form>

				</div>

			</div>
			<!-- tab-content -->

		</div>
		<!-- /form -->

	</div>
	<!--------------------/PAGE-CONTENT-------------------->





	<!---------------LOADING SCRIPTS AND SO ON------------->
	<script src="<spring:url value="/resources/js/jquery.js"/>"></script>
	<script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<spring:url value="/resources/js/login.js"/>"></script>

	<!--------------/LOADING SCRIPTS AND SO ON------------->


</body>
</html>
