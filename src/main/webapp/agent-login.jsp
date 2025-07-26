<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agent Login - WanderNest</title>
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

h1 {
	color: #c2185b;
	text-align: center;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
	color: black;
	font-weight: 500;
}

input {
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
	font-size: 22px;
}

button:hover {
	background-color: #ad1457;
}

p {
	margin-top: 10px;
	font-size: 18px;
	text-align: center;
}

a {
	color: #c2185b;
	text-decoration: underline;
}
</style>
</head>


<body>
	<div class="form-box">

		<%
		String error = (String) request.getAttribute("error");
		if (error != null) {
		%>
		<div
			style="color: red; font-weight: bold; text-align: center; font-size: 22px; margin-top: 20px;">
			<%=error%>
		</div>
		<%
		}
		%>

		<h1>Agent Login</h1>
		<form action="agentLogin" method="post">
			<label for="email">Agent Email ID</label> <input type="text"
				id="email" name="email" placeholder="Enter your Email ID" required>
			<label for="password">Password</label> <input type="password"
				id="password" name="password" placeholder="Enter your password"
				required>

			<button type="submit">Login</button>

			<p>
				Don't have an account? <a href="agent-register.jsp">Register
					here</a>
			</p>
		</form>
	</div>
</body>
</html>