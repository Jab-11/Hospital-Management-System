<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>HOSPITAL MANAGEMENT</title>
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
	/* Replace 'hospital_bg.jpg' with the path to your background image */
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
	width: 50%;
	text-align: center;
	padding: 50px;
	border: 1px solid #ccc;
	background-color: #eee;
	border-radius: 10px;
}

#assistant-btns {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 20px;
}
</style>
<script>
	function redirectTo(link) {
		window.location = link;
	}
</script>
</head>
<body>
	<div id="assistant-box">
		<div>
			<h1>HOSPITAL MANAGEMENT</h1>
			<div id="assistant-btns">
				<button class="btn btn-success" type="button"
					onclick="redirectTo('login.jsp')">LOGIN</button>
				<br /> <br />
			</div>
		</div>
	</div>
</body>
</html>
