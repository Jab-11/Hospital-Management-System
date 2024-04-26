package com.servlets;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.*;
import com.helper.FactoryProvider;

public class Discharge extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        int days = Integer.parseInt(request.getParameter("days"));
        double dayCost = Double.parseDouble(request.getParameter("daycost"));
        
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("receipt.jsp");

        Session session = FactoryProvider.getFactory().openSession();
        Transaction transaction = session.beginTransaction();
        
        try {
            
            
            
            Map<Medicine, Integer> medicineMap = new HashMap<>();
            int i = 0;
            while (request.getParameter("mid" + i) != null) {
                String mid = request.getParameter("mid" + i);
                int quant = Integer.parseInt(request.getParameter("quant" + i));
                Medicine medicine = session.get(Medicine.class, mid);
                medicine.setCount(medicine.getCount() - quant);
                
                if (medicine != null) {
                    medicineMap.put(medicine, quant);
                    // Update total cost if needed
                }
                i++;
            }
            

            // Set attributes for forwarding to receipt.jsp
            request.setAttribute("medList", medicineMap);
            request.setAttribute("days", days);
            request.setAttribute("dayCost", dayCost);
            request.setAttribute("pid", pid);
            
            // Remove patient from table
            Patient p = session.get(Patient.class, pid);
            request.setAttribute("name", p.getName());
            
            
            // Delete the patient
            session.delete(p);

            // Commit transaction and close session
            transaction.commit();
            session.close();
            
            // Forward the request to receipt.jsp to display the receipt
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            out.println("<script>alert('Something went wrong!!');</script>");
        }
    }
}
