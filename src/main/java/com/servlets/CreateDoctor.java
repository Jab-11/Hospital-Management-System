package com.servlets;

import java.io.*;
import java.util.Date;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Doctor;
import com.helper.FactoryProvider;

public class CreateDoctor extends HttpServlet {

    private static final long serialVersionUID = 1L;

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("addDoctor.jsp");
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = session.beginTransaction();
        
    	try {
            

            String did = request.getParameter("did");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int age = Integer.parseInt(request.getParameter("age"));
            Date joinDate = new Date(); // Using current date as join date
            long salary = Long.parseLong(request.getParameter("sal"));
            String specialist = request.getParameter("spec");
            
            Doctor d = session.get(Doctor.class,did);
            if(d!=null) {
            	out.println("<script>alert('Doctor With id:"+ did +" exist already!!');</script>");
                rd.forward(request, response);
            }

            // Creating Doctor object
            Doctor doctor = new Doctor(did, name, email, phone, age, joinDate, salary, specialist);

            // Saving doctor object to database
            session.save(doctor);

            // Committing the transaction
            transaction.commit();

            // Closing session
            session.close();

            out.println("<h1 style=\"color: green; text-align:center;\">Succesfully Added:"+doctor.getName()+"</h1>");
            
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            out.println("<script>alert('Something went wrong!!');</script>");
            rd.include(request, response);
        }
    }

}
