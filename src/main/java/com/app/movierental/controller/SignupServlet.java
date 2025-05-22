package com.app.movierental.controller;

import com.app.movierental.dao.UserDAO;
import com.app.movierental.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    // Show the signup form on GET request
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("user/signup.jsp").forward(req, resp);  // To show signup.jsp
    }

    // Handle the signup form submission on POST request
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Check if the username already exists
        if (UserDAO.usernameExists(username)) {
            resp.getWriter().write("Username already exists!");
            return;
        }

        // Generate a unique ID for the new user
        String id = UUID.randomUUID().toString();
        String role = req.getParameter("role");

        // Create and save the user object
        User user = new User(id, username, password, fullName, role);
        UserDAO.saveUser(user);

        // Redirect to login page after successful signup
        resp.sendRedirect("user/login.jsp");
    }
}
