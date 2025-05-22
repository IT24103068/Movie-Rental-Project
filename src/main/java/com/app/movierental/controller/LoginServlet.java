package com.app.movierental.controller;

import com.app.movierental.dao.UserDAO;
import com.app.movierental.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = UserDAO.authenticate(username, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            // Redirect based on role
            if ("admin".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect("admin-dashboard");
            } else {
                resp.sendRedirect("dashboard");
            }
        } else {
            req.setAttribute("error", "Invalid credentials!");
            req.getRequestDispatcher("user/login.jsp").forward(req, resp);
        }
    }
}
