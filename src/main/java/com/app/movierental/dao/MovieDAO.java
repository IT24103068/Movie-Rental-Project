package com.app.movierental.dao;

import com.app.movierental.model.Movie;
import com.app.movierental.model.RentedMovie;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
    private static final String MOVIE_FILE_PATH = "data/78/movies.txt";
    private static final String RENTED_MOVIE_FILE_PATH = "data/78/rentedMovies.txt"; // New file for rented movies

    // Save a movie to the file
    public static void saveMovie(Movie movie) {
        try (FileWriter fw = new FileWriter(MOVIE_FILE_PATH, true);
             BufferedWriter bw = new BufferedWriter(fw)) {
            String line = String.join("|", movie.getId(), movie.getTitle(), movie.getDescription(),
                    movie.getGenre(), movie.getReleaseDate(), String.valueOf(movie.getPrice()),
                    movie.getPhotoPath());
            bw.write(line);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Get all movies
    public static List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(MOVIE_FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 7) { // Changed from 6 to 7
                    movies.add(new Movie(parts[0], parts[1], parts[2], parts[3], parts[4],
                            Double.parseDouble(parts[5]), parts[6]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return movies;
    }

    // Find movie by ID
    public static Movie getMovieById(String movieId) {
        try (BufferedReader br = new BufferedReader(new FileReader(MOVIE_FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 7 && parts[0].equals(movieId)) {
                    return new Movie(parts[0], parts[1], parts[2], parts[3], parts[4],
                            Double.parseDouble(parts[5]), parts[6]);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Delete movie by ID
    public static void deleteMovie(String movieId) {
        File inputFile = new File(MOVIE_FILE_PATH);
        File tempFile = new File("data/78/movies_temp.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 1 && !parts[0].equals(movieId)) {
                    writer.write(line);
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Rename temp file to original file
        if (inputFile.delete()) {
            tempFile.renameTo(inputFile);
        }
    }

    // Update movie
    public static void updateMovie(Movie movie) {
        deleteMovie(movie.getId());
        saveMovie(movie);
    }

    // Get rented movies by user
    public static List<RentedMovie> getRentedMoviesByUser(String username) {
        List<RentedMovie> rentedList = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(RENTED_MOVIE_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split("\\|");
                if (data.length == 3 && data[1].equals(username)) {
                    rentedList.add(new RentedMovie(data[0], data[1], data[2]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return rentedList;
    }

    // Add a rented movie entry
    public static void rentMovie(String movieId, String username, String releaseDate) {
        try (FileWriter fw = new FileWriter(RENTED_MOVIE_FILE_PATH, true);
             BufferedWriter bw = new BufferedWriter(fw)) {
            String line = String.join("|", movieId, username, releaseDate);
            bw.write(line);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void removeRentedMovie(String username, String movieId) {
        File inputFile = new File(RENTED_MOVIE_FILE_PATH);
        File tempFile = new File("data/78/rented_temp.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 3) {
                    String fileMovieId = parts[0];
                    String fileUser = parts[1];

                    // Skip the entry to be removed
                    if (!(fileMovieId.equals(movieId) && fileUser.equals(username))) {
                        writer.write(line);
                        writer.newLine();
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (inputFile.delete()) {
            tempFile.renameTo(inputFile);
        }
    }


}
