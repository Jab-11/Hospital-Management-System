<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>LOGIN</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style>
body {
	background-image: url('./img/bg4.jpg');
	/* Replace 'bg.webp' with the path to your background image */
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

#assistant-box {
	width: 40%;
	text-align: center;
	padding: 50px;
	border: 1px solid #ccc;
	background-color: #eee;
	border-radius: 10px;
	transform: scale(0.7);
}

#assistant-box input {
	padding: 12px 10px;
	margin: 10px;
	width: 90%;
	font-size: 22px;
}
</style>
</head>
<body>
	<div id="assistant-box">
		<h1 align="center">Assistant Login</h1>
		<br /> <br />
		<form class="form-group" id="form" action="Login" method="POST">
			<input class="form-control" type="text" name="email"
				placeholder="EMAIL" /><br /> <input class="form-control"
				type="password" name="pwd" placeholder="PASSWORD" /><br /> <input
				class="form-control btn-success" type="submit" value="LOGIN" />
		</form>
	</div>
</body>
</html>
