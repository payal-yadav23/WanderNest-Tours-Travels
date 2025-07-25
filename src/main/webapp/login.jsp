<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login - WanderNest Travels</title>
<style>
body {
	font-family: 'Poppins', sans-serif;
	background: url('register.jpg') no-repeat center center/cover;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background: rgba(255, 255, 255, 0.12);
	backdrop-filter: blur(8px);
	-webkit-backdrop-filter: blur(8px);
	padding: 40px;
	border-radius: 14px;
	box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.4);
	text-align: center;
	width: 700px;
}

h1 {
	color: #c2185b;
	font-size: 32px;
	margin-bottom: 25px;
}

.profiles {
	display: flex;
	justify-content: space-around;
	gap: 20px;
}

.profile-box {
	background: rgba(255, 255, 255, 0.85);
	border-radius: 10px;
	width: 180px;
	height: 220px;
	padding: 20px;
	cursor: pointer;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.profile-box:hover {
	transform: scale(1.05);
	box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.3);
}

.profile-box img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	object-fit: cover;
	margin-bottom: 15px;
}

.profile-box h3 {
	color: #333;
	font-size: 25px;
}

</style>
</head>
<body>
	<div class="container">
		<h1>Login to Account</h1>

		<div class="profiles">
			<div class="profile-box" onclick="location.href='admin-login.jsp'">
				<img src="admin.jpg" alt="Admin">
				<h3>Admin</h3>
			</div>

			<div class="profile-box" onclick="location.href='agent-login.jsp'">
				<img src="travelagent.jpg" alt="Travel Agent">
				<h3>Travel Agent</h3>
			</div>

			<div class="profile-box" onclick="location.href='customer-login.jsp'">
				<img src="customer.jpg" alt="Customer">
				<h3>Customer</h3>
			</div>
		</div>
	</div>
</body>
</html>
