package com.filters;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.regex.Pattern;


public class FilterDoctor implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("addDoctor.jsp");
        
        String doctorID = request.getParameter("did");
        String phone = request.getParameter("phone");
        String age = request.getParameter("age");
        String salary = request.getParameter("sal");

        // Validate input data
        if (!isValidDoctorID(doctorID)) {
            // Invalid doctor ID
            out.println("Invalid doctor ID format. It should be like 'D001'.");
            rd.include(request, response);
        } else if (!isValidPhone(phone)) {
            // Invalid phone number
            out.println("Invalid phone number. It should contain 10 digits.");
            rd.include(request, response);
        } else if (!isValidAge(age)) {
            // Invalid age
            out.println("Invalid age. It should be a 3-digit number.");
            rd.include(request, response);
        } else if (!isValidSalary(salary)) {
            // Invalid salary
            out.println("Invalid salary. It should be a positive integer.");
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
    private boolean isValidDoctorID(String doctorID) {
        return Pattern.matches("D\\d{3}", doctorID);
    }

    private boolean isValidPhone(String phone) {
        return Pattern.matches("\\d{10}", phone);
    }

    private boolean isValidAge(String age) {
        return Pattern.matches("\\d{1,3}", age);
    }

    private boolean isValidSalary(String salary) {
        return Pattern.matches("\\d+", salary);
    }
}
