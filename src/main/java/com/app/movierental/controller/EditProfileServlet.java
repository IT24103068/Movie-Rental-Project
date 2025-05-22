package com.app.movierental.controller;

import com.app.movierental.dao.UserDAO;
import com.app.movierental.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/user/edit-profile.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String fullName = req.getParameter("fullName");
            String password = req.getParameter("password");

            user.setFullName(fullName);
            user.setPassword(password);

            boolean updated = UserDAO.updateUser(user);
            if (updated) {
                session.setAttribute("user", user);
                resp.sendRedirect("dashboard");
            } else {
                req.setAttribute("error", "Profile update failed.");
                req.getRequestDispatcher("/user/edit-profile.jsp").forward(req, resp);
            }
        } else {
            resp.sendRedirect("login");
        }
    }
}
