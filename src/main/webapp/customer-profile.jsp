<%@ page contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="com.model.Customer"%>
<%
Customer customer = (Customer) session.getAttribute("customer");
if (customer == null) {
	response.sendRedirect("customer-login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile | WanderNest</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #ffe6f0;
	padding: 30px;
	margin: 0;
}

.profile-container {
	background: white;
	padding: 30px;
	border-radius: 12px;
	max-width: 600px;
	margin: auto;
	border: 3px solid #cc0066;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #cc0066;
	text-align: center;
	margin-bottom: 25px;
}

p {
	font-size: 20px;
	margin: 10px 0;
}

label {
	font-weight: bold;
	color: #333;
}

.back-btn {
	background-color: #cc0066;
	color: white;
	padding: 10px 18px;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	display: block;
	margin: 30px auto 0;
}
</style>
</head>
<body>
	<div class="profile-container">
		<h2>Customer Profile</h2>
		<p>
			<label>Full Name:</label>
			<%=customer.getFullName()%></p>
		<p>
			<label>Email:</label>
			<%=customer.getEmail()%></p>
		<p>
			<label>Gender:</label>
			<%=customer.getGender()%></p>

		<form action="customerdashboard">
			<button type="submit" class="back-btn">Back to Dashboard</button>
		</form>
	</div>
</body>
</html>
