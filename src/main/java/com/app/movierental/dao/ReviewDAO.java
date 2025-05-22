package com.app.movierental.dao;

import com.app.movierental.model.Review;
import java.io.*;
import java.util.*;

public class ReviewDAO {
    private static final String FILE_PATH = "data/78/reviews.txt";

    public static void addReview(Review review) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            bw.write(review.getUsername() + "|" + review.getMovieId() + "|" + review.getRating() + "|" + review.getComment().replaceAll("\\n", " "));
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Review> getReviewsByMovie(String movieId) {
        List<Review> reviews = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|", 4);
                if (parts.length == 4 && parts[1].equals(movieId)) {
                    reviews.add(new Review(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return reviews;
    }


    // Fetch a specific review by username and movieId
    public static Review getReview(String username, String movieId) {
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|", 4);
                if (parts[0].equals(username) && parts[1].equals(movieId)) {
                    return new Review(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3]);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update a review by replacing matching line
    public static void updateReview(Review updatedReview) {
        File inputFile = new File(FILE_PATH);
        File tempFile = new File("temp_reviews.txt");

        try (BufferedReader br = new BufferedReader(new FileReader(inputFile));
             BufferedWriter bw = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|", 4);
                if (parts[0].equals(updatedReview.getUsername()) && parts[1].equals(updatedReview.getMovieId())) {
                    line = updatedReview.getUsername() + "|" + updatedReview.getMovieId() + "|" +
                            updatedReview.getRating() + "|" + updatedReview.getComment().replaceAll("\\n", " ");
                }
                bw.write(line);
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (!inputFile.delete() || !tempFile.renameTo(inputFile)) {
            System.err.println("Could not update review file properly.");
        }
    }

    // Delete a review
    public static void deleteReview(String username, String movieId) {
        File inputFile = new File(FILE_PATH);
        File tempFile = new File("temp_reviews.txt");

        try (BufferedReader br = new BufferedReader(new FileReader(inputFile));
             BufferedWriter bw = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|", 4);
                if (!(parts[0].equals(username) && parts[1].equals(movieId))) {
                    bw.write(line);
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (!inputFile.delete() || !tempFile.renameTo(inputFile)) {
            System.err.println("Could not delete review properly.");
        }
    }

    public static List<Review> getReviewsByUser(String username) {
        List<Review> reviews = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|", 4);
                if (parts.length == 4 && parts[0].equals(username)) {
                    reviews.add(new Review(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public static List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|", 4);
                if (parts.length == 4) {
                    reviews.add(new Review(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return reviews;
    }


}
