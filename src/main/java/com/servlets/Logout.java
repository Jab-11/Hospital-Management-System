package com.servlets;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class Logout extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.removeAttribute("user");
            session.invalidate();
        }

        response.sendRedirect("index.jsp");
    }
}
