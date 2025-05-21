package com.app.movierental.controller;

import com.app.movierental.dao.MovieDAO;
import com.app.movierental.model.Movie;
import com.app.movierental.util.FileUploadUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/movie")
@MultipartConfig
public class MovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("viewAll".equals(action)) {
            // View all movies
            req.setAttribute("movies", MovieDAO.getAllMovies());
            req.getRequestDispatcher("/movie/viewAll.jsp").forward(req, resp);
        } else if ("edit".equals(action)) {
            // Edit movie
            String movieId = req.getParameter("movieId");
            Movie movie = MovieDAO.getMovieById(movieId);
            req.setAttribute("movie", movie);
            req.getRequestDispatcher("/movie/edit.jsp").forward(req, resp);
        } else if ("delete".equals(action)) {
            // Delete movie
            String movieId = req.getParameter("movieId");
            MovieDAO.deleteMovie(movieId);
            resp.sendRedirect(req.getContextPath() + "/movie?action=viewAll");
        } else if ("add".equals(action)) {
            req.getRequestDispatcher("/movie/addMovie.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

            if ("add".equals(action)) {
                // Handle file upload
                Part filePart = req.getPart("photo");
                String photoPath = FileUploadUtil.saveFile(filePart, req);

                // Add movie with photo path
                String title = req.getParameter("title");
                String description = req.getParameter("description");
                String genre = req.getParameter("genre");
                String releaseDate = req.getParameter("releaseDate");
                double price = Double.parseDouble(req.getParameter("price"));

                Movie movie = new Movie(UUID.randomUUID().toString(), title, description,
                        genre, releaseDate, price, photoPath);
                MovieDAO.saveMovie(movie);
                resp.sendRedirect(req.getContextPath() + "/movie?action=viewAll");

            } else if ("update".equals(action)) {
            // Update movie
            String id = req.getParameter("movieId");
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            String genre = req.getParameter("genre");
            String releaseDate = req.getParameter("releaseDate");
            double price = Double.parseDouble(req.getParameter("price"));

            Movie movie = new Movie(id, title, description, genre, releaseDate, price);
            MovieDAO.updateMovie(movie);
            resp.sendRedirect(req.getContextPath() + "/movie?action=viewAll");

        } else if ("delete".equals(action)) {
            // Delete movie
            String movieId = req.getParameter("movieId");
            MovieDAO.deleteMovie(movieId);
            resp.sendRedirect(req.getContextPath() + "/movie?action=viewAll");
        }
    }

}
