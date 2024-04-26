<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>NEW PATIENT</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            transform: scale(0.95);
        }

		#addPat {
            margin: 0 auto;
            max-width: 600px;
        }
        #addPat input, #addPat select {
            padding: 15px 10px;
            margin: 5px;
            width: 80%;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        h2 {
            margin-top: 25px;
        }
    </style>
</head>
<body>
    <h2 align="center">Add New Patient</h2>
    <form id="addPat" method="POST" action="CreatePatient">
    	<input type="text" name="pid" placeholder="PATIENT ID (EX. P0001)" required><br>
        <input type="text" name="name" placeholder="NAME" required><br>
        <input type="email" name="email" placeholder="EMAIL" required><br>
        <input type="number" name="phone" placeholder="PHONE" required><br>
        <input type="number" name="age" placeholder="AGE" required><br>
        <select name="gender">
            <option value="male">MALE</option>
            <option value="female">FEMALE</option>
            <option value="other">OTHER</option>
        </select><br>
        <select name="blood">
        	<option value="A+">A+</option>
        	<option value="B+">B+</option>
       		<option value="AB+">AB+</option>
       		<option value="O+">O+</option>
       		<option value="A-">A-</option>
        	<option value="B-">B-</option>
       		<option value="AB-">AB-</option>
       		<option value="O-">O-</option>			
        </select><br>
        <input type="text" name="symptom" placeholder="SYMPTOMS" required><br>
        <input type="text" name="disease" placeholder="DISEASE DIAGNOSED" required><br>
        <input type="text" name="did" placeholder="REFERRED DOCTOR ID" required><br>
        <input type="submit" value="ADD PATIENT" style="background-color: green; color: white; cursor: pointer;">
    </form>
</body>
</html>
