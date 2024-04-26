<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOW DOCTORS</title>
<style>
table {
    font-family: Arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
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
    <h2 align="center">ALL DOCTORS</h2>
    <div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Age</th>
                    <th>Join Date</th>
                    <th>Specialist</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    org.hibernate.Session hibernateSession = com.helper.FactoryProvider.getFactory().openSession();
                    org.hibernate.query.Query<com.entities.Doctor> query = hibernateSession.createQuery("from Doctor", com.entities.Doctor.class);
                    java.util.List<com.entities.Doctor> doctors = query.list();
                    hibernateSession.close();
                    for (com.entities.Doctor doctor : doctors) {
                %>
                    <tr>
                        <td><%= doctor.getId() %></td>
                        <td><%= doctor.getName() %></td>
                        <td><%= doctor.getEmail() %></td>
                        <td><%= doctor.getPhone() %></td>
                        <td><%= doctor.getAge() %></td>
                        <td><%= doctor.getJoinDate() %></td>
                        <td><%= doctor.getSpecialist() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
