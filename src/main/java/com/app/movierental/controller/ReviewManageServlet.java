package com.app.movierental.controller;

import com.app.movierental.dao.ReviewDAO;
import com.app.movierental.model.Review;
import com.app.movierental.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/manage-reviews")
public class ReviewManageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("/login");
            return;
        }

        if ("edit".equals(action)) {
            String movieId = req.getParameter("movieId");
            Review review = ReviewDAO.getReview(user.getUsername(), movieId);
            req.setAttribute("review", review);
            req.getRequestDispatcher("/review/edit-review.jsp").forward(req, resp);

        } else if ("delete".equals(action)) {
            String movieId = req.getParameter("movieId");
            String username = req.getParameter("username");

            if ("admin".equalsIgnoreCase(user.getRole()) && username != null) {
                ReviewDAO.deleteReview(username, movieId);
            } else {
                ReviewDAO.deleteReview(user.getUsername(), movieId);
            }

            resp.sendRedirect("manage-reviews" + ("admin".equalsIgnoreCase(user.getRole()) ? "?action=all" : ""));
        } else if ("all".equals(action)) {
            if (!"admin".equalsIgnoreCase(user.getRole())) {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied.");
                return;
            }
            List<Review> allReviews = ReviewDAO.getAllReviews();
            req.setAttribute("reviews", allReviews);
            req.getRequestDispatcher("/review/all-reviews.jsp").forward(req, resp);

        } else {
            // Default: list reviews by current user
            List<Review> reviews = ReviewDAO.getReviewsByUser(user.getUsername());
            req.setAttribute("reviews", reviews);
            req.getRequestDispatcher("/review/user-reviews.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("/login");
            return;
        }

        String movieId = req.getParameter("movieId");
        int rating = Integer.parseInt(req.getParameter("rating"));
        String comment = req.getParameter("comment");

        Review updated = new Review(user.getUsername(), movieId, rating, comment);
        ReviewDAO.updateReview(updated);

        resp.sendRedirect("manage-reviews");
    }
}


