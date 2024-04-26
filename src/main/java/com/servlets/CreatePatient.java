package com.servlets;

import java.io.*;
import java.util.Date;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Patient;
import com.entities.Doctor;
import com.helper.FactoryProvider;

public class CreatePatient extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("addPatient.jsp");
        response.setContentType("text/html");
        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            String pid = request.getParameter("pid");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int age = Integer.parseInt(request.getParameter("age"));
            String gender = request.getParameter("gender");
            String blood = request.getParameter("blood");
            Date visited = new Date();
            String symptom = request.getParameter("symptom");
            String disease = request.getParameter("disease");
            String did = request.getParameter("did");
            
            Patient p = session.get(Patient.class,pid);
            if(p!=null) {
            	out.println("<script>alert('Patient With id:"+ pid +" exist already!!');</script>");
                rd.forward(request, response);
            }
            Doctor doc = session.get(Doctor.class,did);

            Patient patient = new Patient(pid,name, email, phone, age, gender, blood, visited, symptom, disease, doc);
            session.save(patient);

            transaction.commit();
            session.close();

            out.println("<h1 style=\"color: green; text-align:center;\">Successfully Added Patient: " + name + "</h1>");

        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            out.println("<h1 style=\"color: red; text-align:center;\">Error: Unable to add patient</h1>");
        }
    }
}
