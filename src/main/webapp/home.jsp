<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entities.*,java.util.*,com.helper.FactoryProvider,org.hibernate.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<style>
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 50vh;
    }
    .card {
        width: 200px;
        height: 150px;
        background-color: #eee;
        border-radius: 8px;
        margin: 10px;
        padding: 20px;
        text-align: center;
    }
    .card h2{
    	font-size: 2.5em;
    }
</style>
</head>
<body>
<%  
    Session ss = FactoryProvider.getFactory().openSession();
    Transaction transaction = ss.beginTransaction();
    
    Query<Doctor> qd = ss.createQuery("from Doctor",Doctor.class);
    Query<Patient> qp = ss.createQuery("from Patient",Patient.class);
    Query<Medicine> qm = ss.createQuery("from Medicine",Medicine.class);
    
    List<Doctor> ld = qd.list();
    List<Patient> lp = qp.list();
    List<Medicine> lm = qm.list();
%>
<div class="container">
    <div class="card">
    	<h2><%= ld.size() %></h2>
        <p>DOCTORS</p>
    </div>
    <div class="card">
        <h2><%= lp.size() %></h2>
        <p>PATIENTS</p>
    </div>
    <div class="card">
        <h2><%= lm.size() %></h2>
        <p>MEDICINES</p>
    </div>
</div>
</body>
</html>
