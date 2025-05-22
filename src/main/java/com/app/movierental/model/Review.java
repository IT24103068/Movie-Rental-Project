package com.app.movierental.model;

public class Review {
    private String username;
    private String movieId;
    private int rating; // 1 to 5
    private String comment;

    public Review(String username, String movieId, int rating, String comment) {
        this.username = username;
        this.movieId = movieId;
        this.rating = rating;
        this.comment = comment;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
