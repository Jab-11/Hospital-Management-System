package com.filters;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.regex.Pattern;

public class FilterMedicine implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("addMedicine.jsp");
        
        String medicineID = request.getParameter("mid");
        String price = request.getParameter("price");
        String count = request.getParameter("count");

        // Validate input data
        if (!isValidMedicineID(medicineID)) {
            // Invalid medicine ID
            out.println("Invalid medicine ID format. It should be like 'M001'.");
            rd.include(request, response);
        } else if (!isValidPrice(price)) {
            // Invalid price
            out.println("Invalid price format. It should be a positive number.");
            rd.include(request, response);
        } else if (!isValidCount(count)) {
            // Invalid count
            out.println("Invalid count format. It should be a positive integer.");
            rd.include(request, response);
        } else {
            // Data is valid, continue with the servlet chain
            chain.doFilter(request, response);
        }

    }

    public void destroy() {
        // Cleanup code, if any
    }

    // Validation methods
    private boolean isValidMedicineID(String medicineID) {
        return Pattern.matches("M\\d{4}", medicineID);
    }

    private boolean isValidPrice(String price) {
        return Pattern.matches("\\d+", price);
    }

    private boolean isValidCount(String count) {
        return Pattern.matches("\\d+", count);
    }

    
}
