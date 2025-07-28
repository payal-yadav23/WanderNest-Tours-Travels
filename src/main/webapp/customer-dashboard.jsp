<%@ page contentType="text/html;charset=ISO-8859-1" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.model.Tour"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Dashboard | Tours & Travels</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #ffe6f0;
}

.navbar {
	background: #cc0066;
	padding: 15px;
	color: white;
	text-align: center;
	font-size: 22px;
	position: relative;
}

.logout-btn {
	position: absolute;
	right: 20px;
	top: 12px;
	background: #ff1a75;
	color: white;
	padding: 8px 14px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
}

.success-msg {
	text-align: center;
	color: green;
	font-weight: bold;
	margin-top: 10px;
}

.nav-buttons {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin: 20px 0;
}

.nav-buttons button {
	background: #e60073;
	border: none;
	color: white;
	padding: 12px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
}

.dashboard-container {
	margin: 0 auto;
	width: 95%;
	background: white;
	padding: 20px;
	border-radius: 8px;
}

h2 {
	color: #cc0066;
	margin-bottom: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 15px;
}

th, td {
	border: 1px solid #cc0066;
	padding: 10px;
	text-align: center;
	font-size: 18px;
}

th {
	background: #ff99cc;
	color: #660033;
}

.book-btn {
	background: green;
	color: white;
	padding: 6px 12px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 20px;
}
</style>
</head>
<body>

	<div class="navbar">
		Welcome, Valued Customer
		<form action="welcome.jsp" method="post" style="display: inline;">
			<button class="logout-btn">Logout</button>
		</form>
	</div>

	<div class="success-msg">Login successful!</div>

	<div class="nav-buttons">
		<button onclick="location.href='customer-dashboard.jsp'">Browse
			Tours</button>
		<button onclick="location.href='mybookings.jsp'">My Bookings</button>
		<button onclick="location.href='customer-profile.jsp'">View
			Profile</button>
	</div>

	<div class="dashboard-container">
		<h2>Available Tours</h2>

		<%
		List<Tour> bookings = (List<Tour>) request.getAttribute("bookingList");
		if (bookings != null && !bookings.isEmpty()) {
		%>
		<table>
			<tr>
				<th>Package Name</th>
				<th>Location</th>
				<th>Price</th>
				<th>Status</th>
				<th>Book</th>
			</tr>
			<%
			for (Tour tour : bookings) {
			%>
			<tr>
				<td><%=tour.getName()%></td>
				<td><%=tour.getLocation()%></td>
				<td>₹<%=tour.getPrice()%></td>
				<td><%=tour.getStatus()%></td>
				<td>
					<form action="booktour" method="post">
						<input type="hidden" name="tourName" value="<%=tour.getName()%>">
						<button type="submit" class="book-btn">Book Tour</button>
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		} else {
		%>
		<p>No tours found at the moment. Please check back later!</p>
		<%
		}
		%>
	</div>

</body>
</html>
