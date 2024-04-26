package com.filters;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.regex.Pattern;

public class FilterPatient implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("addPatient.jsp");
        
        String patientID = request.getParameter("pid");
        String phone = request.getParameter("phone");
        String age = request.getParameter("age");
        String doctorID = request.getParameter("did");

        // Validate input data
        if (!isValidPatientID(patientID)) {
            // Invalid patient ID
        	out.println("Invalid patient ID format. It should be like 'P0001'.");
            rd.include(request, response);
        }else if (!isValidDoctorID(doctorID)) {
            // Invalid doctor ID
        	out.println("Invalid doctor ID format. It should be like 'D001'.");
            rd.include(request, response);
        } else if (!isValidPhone(phone)) {
            // Invalid phone number
        	out.println("Invalid phone number format. It should contain 10 digits.");
            rd.include(request, response);
        } else if (!isValidAge(age)) {
            // Invalid age
        	out.println("Invalid age format. It should be a number with at most 3 digits.");
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

    private boolean isValidPatientID(String patientID) {
        return Pattern.matches("P\\d{4}+", patientID);
    }
}
