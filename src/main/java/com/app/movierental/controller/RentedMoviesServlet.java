package com.app.movierental.controller;

import com.app.movierental.dao.MovieDAO;
import com.app.movierental.model.RentedMovie;
import com.app.movierental.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/rented-movies")
public class RentedMoviesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user != null) {
            List<RentedMovie> rentedMovies = MovieDAO.getRentedMoviesByUser(user.getUsername());
            request.setAttribute("rentedMovies", rentedMovies);
            request.getRequestDispatcher("/rental/rented-movies.jsp").forward(request, response);
        } else {
            response.sendRedirect("/login");
        }
    }
}

