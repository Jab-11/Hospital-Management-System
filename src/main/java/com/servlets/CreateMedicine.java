package com.servlets;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Medicine;
import com.helper.FactoryProvider;


public class CreateMedicine extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd = request.getRequestDispatcher("addMedicine.jsp");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = session.beginTransaction();
        
        try {
            

            String mid = request.getParameter("mid");
            System.out.print(mid);
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int count = Integer.parseInt(request.getParameter("count"));

            // Check if medicine with the given mid exists
            Medicine existingMedicine = session.get(Medicine.class, mid);
            if(existingMedicine != null) {
                // If medicine exists, update the quantity
            	System.out.print("NOT");
                existingMedicine.setCount(existingMedicine.getCount() + count);
                session.update(existingMedicine);
            } else {
                // If medicine doesn't exist, create a new entry
            	System.out.print("YES");
                Medicine newMedicine = new Medicine(mid, name, price, count);
                session.save(newMedicine);
            }

            // Committing the transaction
            transaction.commit();

            // Closing session
            session.close();

            response.setContentType("text/html");
            out.println("<h1 style=\"color: green; text-align:center;\">Successfully Added: " + name + ", Quantity: " + count + "</h1>");

        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            out.println("<script>alert('Something went wrong!!');</script>");
            rd.include(request, response);
        }
    }
}
