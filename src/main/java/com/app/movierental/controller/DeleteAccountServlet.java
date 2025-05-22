package com.app.movierental.controller;

import com.app.movierental.dao.UserDAO;
import com.app.movierental.model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete-account")
public class DeleteAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user != null) {
            boolean deleted = UserDAO.deleteUser(user.getUsername());
            if (deleted) {
                session.invalidate(); // log out user
                resp.sendRedirect("login");
            } else {
                resp.sendRedirect("edit-profile?error=delete-failed");
            }
        } else {
            resp.sendRedirect("login");
        }
    }
}
