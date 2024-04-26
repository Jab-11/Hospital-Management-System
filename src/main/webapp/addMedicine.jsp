<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Medicine</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            transform: scale(0.95);
        }

        #add input {
            padding: 15px 10px;
            margin: 5px;
            width: 80%;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        #add {
            margin: 0 auto;
            max-width: 600px;
        }

        h2 {
            margin-top: 25px;
        }
    </style>
</head>
<body>
    <h2>Add New Medicine</h2>
    <form id="add" method="POST" action="CreateMedicine">
    	<input type="text" name="mid" placeholder="Medicine ID. (Ex. M0001)" required><br>
        <input type="text" name="name" placeholder="NAME" required><br>
        <input type="number" step="0.01" name="price" placeholder="PRICE" min="0.01" required><br>
        <input type="number" name="count" placeholder="STOCK QUANTITY" min="1" required><br>
        <input type="submit" value="ADD MEDICINE" style="background-color: green; color:white; cursor:pointer;">
    </form>
</body>
</html>
