package com.servlets;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import org.hibernate.Session;

import com.entities.Assistant;
import com.helper.FactoryProvider;

@WebServlet("/Login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");

		try {
			Session session = FactoryProvider.getFactory().openSession();

			Assistant assistant = (Assistant) session.createQuery("FROM Assistant WHERE email = :email")
					.setParameter("email", email).uniqueResult();
			
//			System.out.println(assistant.getEmail()+assistant.getPassword());
			
			if (assistant != null && assistant.getPassword().equals(pwd)) {
                // If login is successful, create a session and store user information
                HttpSession userSession = request.getSession();
                userSession.setAttribute("user", assistant);

                // Redirect to the welcome page
                response.sendRedirect("welcome.jsp");
            } else {
                // If login fails, display an error message
                out.println("<script>alert('Invalid email or password');</script>");
                rd.include(request, response);
            }

		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script>alert('Something went wrong!!');</script>");
            rd.include(request, response);
		}

	}

}
