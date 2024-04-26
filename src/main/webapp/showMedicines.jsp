<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOW MEDICINES</title>
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
    <h2 align="center">ALL MEDICINES</h2>
    <div>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Stock Quantity</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    org.hibernate.Session hibernateSession = com.helper.FactoryProvider.getFactory().openSession();
                    org.hibernate.query.Query<com.entities.Medicine> query = hibernateSession.createQuery("from Medicine", com.entities.Medicine.class);
                    java.util.List<com.entities.Medicine> medicines = query.list();
                    hibernateSession.close();
                    for (com.entities.Medicine medicine : medicines) {
                %>
                    <tr>
                        <td><%= medicine.getMid() %></td>
                        <td><%= medicine.getName() %></td>
                        <td><%= medicine.getPrice() %></td>
                        <td><%= medicine.getCount() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
