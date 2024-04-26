<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            border-radius: 5px;
        }
        h1, p {
            text-align: center;
        }
        .team-member {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        .member {
            margin: 0 20px;
            text-align: center;
        }
        .member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .member h3 {
            margin: 0;
        }
        .member p {
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>About Us</h1>
        <p>We are a dedicated team passionate about providing high-quality healthcare services to our patients.</p>
        
        <div class="team-member">
            <div class="member">
                <img src="team_member1.jpg" alt="Team Member 1">
                <h3>Jabarson</h3>
                <p>123</p>
            </div>
            <div class="member">
                <img src="team_member2.jpg" alt="Team Member 2">
                <h3>Jignesh</h3>
                <p>107</p>
            </div>
            <div class="member">
                <img src="team_member3.jpg" alt="Team Member 3">
                <h3>Dhruv</h3>
                <p>124</p>
            </div>
        </div>
    </div>
</body>
</html>
