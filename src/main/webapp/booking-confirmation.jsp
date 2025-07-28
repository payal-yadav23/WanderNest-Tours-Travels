<%@ page contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="com.model.Tour, com.model.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Confirmation</title>
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: #f8f8f8;
	padding: 30px;
}

.container {
	background: #ffffff;
	border: 3px solid #c2185b;
	padding: 30px;
	border-radius: 16px;
	max-width: 700px;
	margin: auto;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}

h2 {
	color: #c2185b;
	font-size: 32px;
	text-align: center;
	margin-bottom: 20px;
}

p {
	font-size: 20px;
	margin: 12px 0;
}

strong {
	color: #333;
}

button {
	background-color: #c2185b;
	color: white;
	padding: 12px 20px;
	font-size: 18px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background 0.3s;
}

button:hover {
	background-color: #a3144a;
}

a {
	text-decoration: none;
	display: flex;
	justify-content: center;
	margin-top: 25px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Booking Confirmed!</h2>
		<%
		Tour tour = (Tour) request.getAttribute("tour");
		Customer customer = (Customer) request.getAttribute("customer");
		if (tour != null && customer != null) {
		%>
		<p>
			<strong>Customer Name:</strong>
			<%=customer.getFullName()%></p>
		<p>
			<strong>Email:</strong>
			<%=customer.getEmail()%></p>
		<hr style="margin: 20px 0;">
		<p>
			<strong>Package:</strong>
			<%=tour.getName()%></p>
		<p>
			<strong>Location:</strong>
			<%=tour.getLocation()%></p>
		<p>
			<strong>Price:</strong> ₹<%=tour.getPrice()%></p>
		<%
		} else {
		%>
		<p style="color: red; font-size: 20px;">Booking details missing.
			Please try again.</p>
		<%
		}
		%>
		<a href="customerdashboard"><button>Back to Dashboard</button></a>
	</div>
</body>
</html>
