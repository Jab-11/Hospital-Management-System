<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Doctor</title>
<style>
    body {
	    padding: 0;
	    margin: 0;
	    text-align: center;
	    font-family: Arial, sans-serif;
	    transform: scale(0.95);
	}
	
	#addDoc input {
	    padding: 15px 10px;
	    margin: 5px;
	    width: 80%;
	    font-size: 16px;
	    border-radius: 5px;
	    border: 1px solid #ccc;
	    box-sizing: border-box;
	}
	
	#addDoc {
	    margin: 0 auto;
	    max-width: 600px;
	}
	
	h2 {
	    margin-top: 25px;
	}

</style>
</head>
<body>
<h2>Add New Doctor</h2>
<form id="addDoc" method="POST" action="CreateDoctor">
	<input type="text" name="did" placeholder="Doctor ID. (Ex. D001)" required><br>
    <input type="text" name="name" placeholder="NAME" required><br>
    <input type="email" name="email" placeholder="EMAIL" required><br>
    <input type="number" name="phone" placeholder="PHONE" required><br>
    <input type="number" name="age" placeholder="AGE" required><br>
    <input type="number" name="sal" placeholder="SALARY" required><br>
    <input type="text" name="spec" placeholder="SPECIALIST IN" required><br>
    <input type="submit" value="ADD DOCTOR" style="background-color: green; color:white; cursor:pointer;">
</form>
</body>
</html>
