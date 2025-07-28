<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.model.Tour"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome | Tours & Travels</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

html {
	scroll-behavior: smooth;
}

body, html {
	width: 100%;
	overflow-x: hidden;
}
/* Background Video */
.bg-video {
	position: fixed;
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	object-fit: cover;
	z-index: -1;
}
/* Navbar */
.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	padding: 20px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	z-index: 10;
	background-color: rgba(0, 0, 0, 0.5);
}

.logo {
	font-size: 26px;
	color: white;
	font-weight: bold;
}

.nav-links {
	list-style: none;
	display: flex;
	gap: 20px;
}

.nav-links li a {
	text-decoration: none;
	color: white;
	font-size: 22px;
	position: relative;
	transition: color 0.3s ease;
}

.nav-links li a::after {
	content: "";
	position: absolute;
	left: 0;
	bottom: -4px;
	width: 0%;
	height: 2px;
	background-color: #c2185b;
	transition: width 0.3s ease;
}

.nav-links li a:hover {
	color: #c2185b;
}

.nav-links li a:hover::after {
	width: 100%;
}

.login-btn {
	padding: 6px 14px;
	background-color: #8e004d;
	color: white !important;
	border-radius: 12px;
	text-decoration: none;
	font-size: 16px;
}

.login-btn:hover {
	background-color: #b60063;
}
/* Center Hero Section */
.center-btn {
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	padding-top: 60px;
}

.book-btn {
	padding: 14px 30px;
	font-size: 22px;
	background-color: #8e004d;
	color: white;
	border: none;
	border-radius: 12px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-top: 20px;
}

.book-btn:hover {
	background-color: #b60063;
}

.tagline-small {
	font-size: 22px;
	color: white;
	margin-bottom: 10px;
	font-weight: 400;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);
}

.tagline-large {
	font-size: 36px;
	color: white;
	font-weight: 600;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
}
/* Sections */
section {
	min-height: 100vh;
	padding: 100px 40px 40px;
	color: white;
	background-color: rgba(0, 0, 0, 0.6);
}

#about, #tours, #destinations, #services, #reviews, #contact {
	scroll-margin-top: 100px;
}
/* Tour Table */
.tour-table {
	margin: 20px auto;
	width: 90%;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	color: #333;
}

.tour-table th, .tour-table td {
	padding: 12px;
	text-align: center;
}

.tour-table th {
	background-color: #8e004d;
	color: white;
}

.tour-table tr:nth-child(even) {
	background-color: #f9f9f9;
}
</style>
</head>
<body>

	<!-- Background Video -->
	<video autoplay muted loop class="bg-video">
		<source src="home.mp4" type="video/mp4">
	</video>

	<!-- Navbar -->
	<nav class="navbar">
		<div class="logo">WanderNest Tours Agency</div>
		<ul class="nav-links">
			<li><a href="#">Home</a></li>
			<li><a href="#about">About Us</a></li>
			<li><a href="#destinations">Destinations</a></li>
			<li><a href="#services">Services</a></li>
			<li><a href="#contact">Contact</a></li>
			<li><a href="login.jsp" class="login-btn">Login</a></li>
		</ul>
	</nav>

	<!-- Hero Section -->
	<div class="center-btn">
		<h2 class="tagline-small">To travel is to live</h2>
		<h1 class="tagline-large">Your Journey Begins</h1>
		<a href="login.jsp"><button class="book-btn">Book My Trip</button></a>
	</div>

	<!-- Page Sections -->
	<section id="about">
		<h2>About Us</h2>
		<p>Welcome to WanderNest - your partner for unforgettable travel
			experiences.</p>
	</section>


	<section id="destinations">
		<h2>Top Destinations</h2>
		<p>From the mountains to the beaches, we take you everywhere.</p>
	</section>

	<section id="services">
		<h2>Our Services</h2>
		<p>We provide tour planning, bookings, transportation, and guides.</p>
	</section>


	<section id="contact">
		<h2>Contact Us</h2>
		<p>Reach us at info@wandernest.com or call +91-12345-67890.</p>
	</section>

</body>
</html>
