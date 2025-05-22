package com.app.movierental.controller;

import com.app.movierental.model.Movie;
import com.app.movierental.util.WatchedStackUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.Stack;

@WebServlet("/view-watched")
public class ViewWatchedServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Stack<Movie> watchedStack = WatchedStackUtil.getAllWatched();
        req.setAttribute("watchedStack", watchedStack);
        req.getRequestDispatcher("/stack/view-watched.jsp").forward(req, resp);
    }
}
