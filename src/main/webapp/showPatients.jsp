<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entities.Patient,com.entities.Doctor" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOW PATIENTS</title>
<style>
table {
    font-family: Arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
    max-width: 100px; /* Limiting the maximum width */
}

th, td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

th {
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>
    <h2 align="center">ALL PATIENTS</h2>
    <div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Blood Type</th>
                    <th>Visited Date</th>
                    <th>Symptoms</th>
                    <th>Disease Diagnosed</th>
                    <th>Doctor Referred To</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    org.hibernate.Session hibernateSession = com.helper.FactoryProvider.getFactory().openSession();
                    org.hibernate.query.Query<com.entities.Patient> query = hibernateSession.createQuery("from Patient", com.entities.Patient.class);
                    java.util.List<com.entities.Patient> patients = query.list();
                    hibernateSession.close();
                    for (com.entities.Patient patient : patients) {
                        com.entities.Doctor doc = patient.getDoctor();
                %>
                    <tr>
                        <td><%= patient.getPid() %></td>
                        <td><%= patient.getName() %></td>
                        <td><%= patient.getEmail() %></td>
                        <td><%= patient.getPhone() %></td>
                        <td><%= patient.getAge() %></td>
                        <td><%= patient.getGender() %></td>
                        <td><%= patient.getBlood() %></td>
                        <td><%= patient.getVisited() %></td>
                        <td><%= patient.getSymptom() %></td>
                        <td><%= patient.getDisease() %></td>
                        <td><%= doc.getName() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
