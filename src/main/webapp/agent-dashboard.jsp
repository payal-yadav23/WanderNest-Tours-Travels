<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agent Dashboard - WanderNest</title>
<style>
body {
	font-family: 'Poppins', sans-serif;
	background-color: #ffe6ec;
	margin: 0;
	padding: 0;
}

header {
	background-color: #c2185b;
	color: white;
	padding: 20px;
	text-align: center;
	font-size: 28px;
}

.container {
	padding: 40px;
}

.card {
	background: white;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-bottom: 30px;
	transition: transform 0.2s ease-in-out;
}

.card:hover {
	transform: translateY(-5px);
}

h2 {
	color: #c2185b;
	margin-bottom: 10px;
}

p {
	font-size: 20px;
}

nav {
	display: flex;
	gap: 20px;
	margin-bottom: 30px;
}

a.button {
	background-color: #c2185b;
	color: white;
	padding: 14px 24px;
	border-radius: 8px;
	text-decoration: none;
	font-size: 20px;
	transition: background-color 0.3s ease;
	cursor: pointer;
}

a.button:hover {
	background-color: #ad1457;
}

#addTourForm {
	display: none;
	margin-top: 20px;
}

label {
	font-size: 20px;
	display: block;
	margin-top: 12px;
}

input[type="text"], input[type="number"], textarea, select {
	width: 95%;
	padding: 10px;
	margin-top: 8px;
	margin-bottom: 16px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 20px;
}

input[type="submit"] {
	background-color: #c2185b;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 20px;
}

input[type="submit"]:hover {
	background-color: #ad1457;
}

/* Dropdown Styles */
.dropdown {
	position: relative;
	display: inline-block;
	margin-left: auto;
}

.dropbtn {
	background-color: #c2185b;
	color: white;
	padding: 14px 24px;
	font-size: 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 10px;
}

.dropbtn:hover {
	background-color: #ad1457;
}

.profile-icon {
	width: 28px;
	height: 28px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid white;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 180px;
	right: 0;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	z-index: 1;
}

.dropdown-content a {
	color: #c2185b;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-size: 18px;
	border-bottom: 1px solid #eee;
}

.dropdown-content a:hover {
	background-color: #ffe6ec;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<script>
	function showAddTourForm() {
		document.getElementById("addTourForm").style.display = "block";
	}
</script>
</head>
<%
String msg = (String) request.getAttribute("message");
if (msg != null) {
%>
<div class="message"
	style="color: green; font-weight: bold; text-align: center; font-size: 22px; margin-top: 20px;">
	<%=msg%>
</div>
<%
}
%>


<body>
	<header> Welcome, Travel Agent </header>

	<div class="container">
		<nav>
			<a class="button" href="#">Manage Bookings</a> <a class="button"
				href="#">View Customers</a> <a class="button"
				onclick="showAddTourForm()">Add Tours</a> <a class="button" href="#">View
				Profile</a>

			<div class="dropdown">
				<button class="dropbtn">
					<img src="travelagent.jpg" alt="Profile" class="profile-icon">
					<%=session.getAttribute("agentName") != null ? session.getAttribute("agentName") : "Agent"%>
					&#9662;
				</button>
				<div class="dropdown-content">
					<a href="#">Settings</a> <a href="#">Change Password</a> <a
						href="logout.jsp">Logout</a>
				</div>
			</div>
		</nav>



		<div class="card">
			<h2>Dashboard Overview</h2>
			<p>You can manage tour packages, view customer bookings, and
				provide services directly from here.</p>
		</div>

		<div class="card">
			<h2>Recent Activities</h2>
			<p>No recent activity found.</p>
		</div>

		<div class="card" id="addTourForm"
			style="max-width: 600px; margin: 0 auto;">
			<h2>Add Tour Package</h2>
			<form action="AddTourServlet" method="post">
				<label>Package Name</label> <input type="text" name="packageName"
					required> <label>Package Type</label> <select
					name="packageType" required>
					<option value="">--Select--</option>
					<option value="Family">Family</option>
					<option value="Couple">Couple</option>
					<option value="Friends">Friends</option>
				</select> <label>Package Location</label> <input type="text"
					name="packageLocation" required> <label>Package
					Price</label> <input type="number" name="packagePrice" required> <label>Duration
					(in days)</label> <input type="number" name="duration" required> <label>Seats</label>
				<input type="number" name="seats" required> <label>Availability</label>
				<select name="packageType" required>
					<option value="">--Select--</option>
					<option value="available">Available</option>
					<option value="unavailable">Unavailable</option>
				</select> <label>Package Features</label>
				<textarea name="features" rows="3" required></textarea>

				<label>Package Details</label>
				<textarea name="details" rows="5" required></textarea>

				<input type="submit" value="Add Tour Package">
			</form>
		</div>
	</div>
</body>
</html>
