package com.app.movierental.controller;

import com.app.movierental.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect("login");
            return;
        }

        req.setAttribute("adminName", user.getFullName());
        req.getRequestDispatcher("user/admin-dashboard.jsp").forward(req, resp);
    }
}
