package com.app.movierental.model;

public class RentedMovie {
    private String movieId;
    private String username;
    private String rentDate;

    public RentedMovie(String movieId, String username, String rentDate) {
        this.movieId = movieId;
        this.username = username;
        this.rentDate = rentDate;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRentDate() {
        return rentDate;
    }

    public void setRentDate(String rentDate) {
        this.rentDate = rentDate;
    }
}
