package com.app.movierental.controller;

import com.app.movierental.model.User;
import com.app.movierental.model.Review;
import com.app.movierental.dao.ReviewDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String movieId = req.getParameter("movieId");
            int rating = Integer.parseInt(req.getParameter("rating"));
            String comment = req.getParameter("comment");

            Review review = new Review(user.getUsername(), movieId, rating, comment);
            ReviewDAO.addReview(review);
        }


        // Redirect back to the movie details page with movieId
        String movieId = req.getParameter("movieId");
        resp.sendRedirect(req.getContextPath() + "/movie-details?movieId=" + movieId);
    }
}
