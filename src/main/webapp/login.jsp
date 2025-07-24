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

.form-box {
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px);
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.4);
	width: 400px;
}

.message {
	color: green;
	font-weight: bold;
	text-align: center;
	margin-bottom: 10px;
	font-size: 18px;
}

h1 {
	color: #c2185b;
	margin-bottom: 20px;
	text-align: center;
}

input[type="email"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: none;
	border-radius: 8px;
	background: rgba(255, 255, 255, 0.9);
}

button {
	width: 100%;
	background-color: #c2185b;
	color: white;
	padding: 12px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 20px;
}

button:hover {
	background-color: #ad1457;
}

p {
	margin-top: 10px;
	font-size: 20px;
	text-align: center;
}

a {
	color: #c2185b;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="form-box">
		<%
		String msg = (String) request.getAttribute("message");
		if (msg != null) {
		%>
		<div class="message"><%=msg%></div>
		<%
		}
		%>

		<h1>Login to Account</h1>
		<form action="login" method="post">
			<input type="email" name="email" placeholder="Email Address" required>
			<input type="password" name="password" placeholder="Password"
				required>
			<button type="submit">Login</button>
			<p>
				Don't have an account? <a href="register.html">Register here</a>
			</p>
		</form>
	</div>
</body>
</html>