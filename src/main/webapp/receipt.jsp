<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.entities.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        .total {
            text-align: right;
            margin-top: 20px;
        }
        
        .patient-details {
            margin: 20px auto;
            text-align: center;
        }
        
    </style>
</head>
<body>
    <h2 style="text-align: center;">Receipt</h2>
    <div class="patient-details">
        <h3>Patient Details</h3>
        <% 
            String pid = (String) request.getAttribute("pid");
            String patientName = (String) request.getAttribute("name");
        %>
        <p>Patient ID: <%= pid %></p>
        <p>Patient Name: <%= patientName %></p>
    </div>
    <table>
        <thead>
            <tr>
                <th>Medicine</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <% 
            @SuppressWarnings("unchecked")
            Map<Medicine, Integer> medList = (Map<Medicine, Integer>) request.getAttribute("medList");
            int days = (int) request.getAttribute("days");
            double dayCost = (double) request.getAttribute("dayCost");

            double grandTotal = 0.0;

            for (Map.Entry<Medicine, Integer> entry : medList.entrySet()) {
                Medicine medicine = entry.getKey();
                int quantity = entry.getValue();
                double price = medicine.getPrice();
                double subtotal = quantity * price;
                grandTotal += subtotal;
            %>
            <tr>
                <td><%= medicine.getName() %></td>
                <td><%= quantity %></td>
                <td><%= price %> Rs.</td>
                <td><%= subtotal %> Rs.</td>
            </tr>
            <% } %>
            <tr>
                <td>Days Admitted</td>
                <td colspan="3"><%= days %></td>
            </tr>
            <tr>
                <td>Day Cost</td>
                <td colspan="3"><%= dayCost %> Rs.</td>
            </tr>
            <tr>
                <td>Total Cost:</td>
            	<td colspan="3"><%= days %> days x <%= dayCost %> Rs./day + <%= grandTotal %> Rs. (Medicine cost) = <b><%= days*dayCost + grandTotal %> Rs. (Total)</b></td>    
            </tr>
        </tbody>
    </table>
</body>
</html>
