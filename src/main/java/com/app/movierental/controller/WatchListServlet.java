package com.app.movierental.controller;

import com.app.movierental.dao.WatchListDAO;
import com.app.movierental.model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/watchlist")
public class WatchListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String movieId = req.getParameter("movieId");
            String action = req.getParameter("action");

            if ("add".equals(action)) {
                WatchListDAO.addToWatchList(user.getUsername(), movieId);
            } else if ("remove".equals(action)) {
                WatchListDAO.removeFromWatchList(user.getUsername(), movieId);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/dashboard");
    }
}
