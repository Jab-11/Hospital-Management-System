<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.entities.Assistant"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assistant Panel</title>
    <style>
        body {
            background-image: url('./img/bg4.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
            margin: 0;
            padding: 0;
            height: 100vh;
        }

      

        iframe {
            height: 900px;
            resize: both;
        }
        
        h1{
        	padding:10px 0;
        	background-color: #ddd;
        	margin: 0;
        }

        #panel {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        #panel li button {
            float: left;
        }

        #panel li button {
            display: block;
            color: white;
            background-color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        #panel li button:hover:not(.active) {
            background-color: lightblue;
            color: #111;
        }

        .active {
            background-color: #4CAF50;
        }

        .prof {
            float: right;
        }
        
        #frame {
		    width: 70%;
		    margin: 50px auto;
		    margin-bottom: 0px;
		    background-color: #ccc;
		    border-radius: 13px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
    </style>
    <script>
        function show(value) {
            document.getElementById("frame").innerHTML = `<iframe src="${value}.jsp" height="100%" width="100%"></iframe>`;
        }
    </script>
    <script>
        // Function to redirect to login page after a delay
        function redirectToLogin() {
            setTimeout(function() {
                window.location.href = "login.jsp";
            }, 5000); // 5 seconds delay
        }
    </script>
</head>
<body>
<%
    // Check if user is logged in
    Assistant user = (Assistant) session.getAttribute("user");
    if (user == null) {
        // Redirect to login page if user is not logged in
%>
<div class="container">
    <div align="center" id="title">
        <h1>HOSPITAL MANAGEMENT</h1>
    </div>
    <div id="message">
        <h1 style="color: red;">Login is required. Redirecting to login page...</h1>
    </div>
</div>
<%
    // Call JavaScript function to redirect to login page after delay
    %>
    <script>
        redirectToLogin();
    </script>
<%
    } else {
%>
<div class="container">
    <div align="center" id="title">
        <h1>HOSPITAL MANAGEMENT</h1>
    </div>
    <ul id="panel">
    	<li><button onClick="show('home')">HOME</button></li>
        <li><button onClick="show('addDoctor')">ADD DOCTOR</button></li>
        <li><button onClick="show('addPatient')">ADD PATIENT</button></li>
        <li><button onClick="show('addMedicine')">ADD MEDICINE</button></li>
        <li><button onClick="show('showDoctors')">VIEW DOCTORS</button></li>
        <li><button onClick="show('showPatients')">VIEW PATIENTS</button></li>
        <li><button onClick="show('showMedicines')">MEDICINE STORE</button></li>
        <li><button onClick="show('discharge')">DISCHARGE</button></li>
        <li class="prof 1"><button onClick="show('aboutUs')">ABOUT US</button></li>
        <li class="prof 2">
            <form method="post" action="Logout">
                <button type="submit">LOGOUT</button>
            </form>
        </li>
    </ul>
    <br>
    <div id="frame">
    <iframe src="home.jsp" height="100%" width="100%"></iframe>
    </div>
</div>
<%
    }
%>
</body>
</html>
