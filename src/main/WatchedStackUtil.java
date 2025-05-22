package com.app.movierental.util;

import com.app.movierental.model.Movie;

import java.util.Stack;

public class WatchedStackUtil {
    private static final Stack<Movie> stack = new Stack<>();

    public static void push(Movie movie) {
        stack.push(movie);
    }

    public static Movie pop() {
        return stack.isEmpty() ? null : stack.pop();
    }

    public static boolean isEmpty() {
        return stack.isEmpty();
    }

    public static Stack<Movie> getAllWatched() {
        return stack;
    }
}
