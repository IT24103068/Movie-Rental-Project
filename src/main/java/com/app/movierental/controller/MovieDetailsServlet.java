package com.app.movierental.controller;

import com.app.movierental.dao.MovieDAO;
import com.app.movierental.dao.ReviewDAO;
import com.app.movierental.model.Movie;
import com.app.movierental.model.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/movie-details")
public class MovieDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movieId = request.getParameter("movieId");
        Movie movie = MovieDAO.getMovieById(movieId);
        List<Review> reviews = ReviewDAO.getReviewsByMovie(movieId);

        request.setAttribute("movie", movie);
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("/movie/movieDetails.jsp").forward(request, response);
    }
}
