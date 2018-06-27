<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new Customer</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<h4>Customer Form</h4>
		<form:form action="saveCustomer" modelAttribute="customer" method="POST">
		
			<!-- Need to associate this data with customer id -->
			<form:hidden path="id"/>
		
			<div class="form-group">
				<label for="formGroupExampleInput">First Name</label>
				<form:input path="firstName" type="text" class="form-control" id="formGroupExampleInput" placeholder="First name" />
			</div>
			<div class="form-group">
				<label for="formGroupExampleInput2">Last name</label> 
				<form:input path="lastName" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Last name" />
			</div>
			<div class="form-group">
				<label for="formGroupExampleInput2">Email</label> 
				<form:input type="email" class="form-control" id="formGroupExampleInput2" path="email" placeholder="Email Address" />
			</div>
			<div class="form-group">
			<input type="submit" class="btn btn-primary" value="Submit" /> <a class="btn btn-danger" href="<%=request.getContextPath()%>/customer/list">Cancel</a>
			</div>
		</form:form>
	</div>
</body>
</html>