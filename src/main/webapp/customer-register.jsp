<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Register - WanderNest</title>
    <style>
        /* Same style as others */
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
            width: 400px;
        }
        h1 {
            color: #c2185b;
            text-align: center;
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
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h1>Customer Registration</h1>
        <form action="customerRegister" method="post">
            <input type="text" name="fullname" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="mobile" placeholder="Mobile Number" required>
            <input type="text" name="city" placeholder="City" required>
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>