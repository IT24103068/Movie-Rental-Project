package com.app.movierental.controller;

import com.app.movierental.dao.MovieDAO;
import com.app.movierental.model.Movie;
import com.app.movierental.model.RentedMovie;
import com.app.movierental.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser != null) {
            // Fetch all rented records for the user
            List<RentedMovie> rentedRecords = MovieDAO.getRentedMoviesByUser(loggedInUser.getUsername());

            req.setAttribute("movies", MovieDAO.getAllMovies());
            req.setAttribute("user", loggedInUser);
            req.setAttribute("rentedMovies", rentedRecords);

            req.getRequestDispatcher("/user/dashboard.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("login");
        }
    }

}
