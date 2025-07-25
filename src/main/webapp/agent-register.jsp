<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Integer agentId = (Integer) request.getAttribute("nextAgentId");
%>

<!DOCTYPE html>
<html>
<head>
<title>Agent Register - WanderNest</title>
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
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.4);
	width: 450px;
}

h1 {
	color: #c2185b;
	text-align: center;
	margin-bottom: 20px;
}

label {
	color: black;
	font-weight: 500;
	margin-bottom: 5px;
	display: block;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: none;
	border-radius: 8px;
	background: rgba(255, 255, 255, 0.9);
}

input[readonly] {
	background-color: #f2f2f2;
	color: #555;
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
</style>
</head>
<body>
	<div class="form-box">
		<h1>Agent Registration</h1>
		<form action="agentRegister" method="post">
			<label for="agentId">Agent ID</label>
<input type="text" name="agentId" id="agentId" value="<%= agentId %>" readonly>


			<label for="fullname">Full Name</label> <input type="text"
				name="fullname" id="fullname" required> <label
				for="agencyName">Agency Name</label> <input type="text"
				name="agencyName" id="agencyName" required> <label
				for="username">Agent Username</label> <input type="text"
				name="username" id="username" required> <label for="mobNo">Mobile
				Number</label> <input type="text" name="mobNo" id="mobNo" required>

			<label for="email">Email Address</label> <input type="email"
				name="email" id="email" required> <label for="password">Password</label>
			<input type="password" name="password" id="password" required>

			<button type="submit">Register</button>
		</form>
	</div>
</body>
</html>
