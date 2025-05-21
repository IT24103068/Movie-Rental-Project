<%@ page import="com.app.movierental.model.Movie" %>
<%@ page import="com.app.movierental.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    Movie movie = (Movie) request.getAttribute("movie");
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= movie.getTitle() %> | MovieR&R</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
        body {
            font-family: 'Roboto', sans-serif;
        }
        .futuristic-text {
            font-family: 'Orbitron', sans-serif;
        }
        .movie-poster {
            background: linear-gradient(45deg, #1D1616 0%, #8E1616 100%);
        }
        .review-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(216, 64, 64, 0.2);
        }
    </style>
</head>
<body class="min-h-screen bg-[#1D1616] text-[#EEEEEE]">
<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-8">
        <a href="<%= request.getContextPath() %>/dashboard" class="text-[#EEEEEE] hover:text-[#D84040] transition-colors flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd" />
            </svg>
            Back to Dashboard
        </a>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-12">
        <!-- Movie Poster -->
        <div class="movie-poster flex items-center justify-center rounded-xl h-96 lg:h-full bg-[#1D1616]">
            <img src="<%= request.getContextPath() %>/<%= movie.getPhotoPath() %>"
                 alt="<%= movie.getTitle() %>"
                 class="h-full w-full object-cover rounded-xl">
        </div>

        <!-- Movie Details -->
        <div class="lg:col-span-2">
            <h1 class="futuristic-text text-3xl text-[#D84040] mb-2"><%= movie.getTitle() %></h1>
            <div class="flex items-center mb-4">
                    <span class="bg-[#8E1616] bg-opacity-30 px-3 py-1 rounded-full text-sm flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-yellow-400 mr-1" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                        </svg>
                        <%= reviews != null && !reviews.isEmpty() ?
                                String.format("%.1f", reviews.stream().mapToInt(Review::getRating).average().orElse(0)) + "/5" : "No ratings" %>
                    </span>
                <span class="ml-3 text-[#EEEEEE] opacity-80"><%= movie.getReleaseDate() %></span>
            </div>

            <div class="mb-6">
                <h2 class="futuristic-text text-xl text-[#EEEEEE] mb-2">Description</h2>
                <p class="text-[#EEEEEE] opacity-90"><%= movie.getDescription() %></p>
            </div>

            <div class="grid grid-cols-2 gap-4 mb-8">
                <div>
                    <h3 class="futuristic-text text-[#D84040] mb-1">Genre</h3>
                    <p class="text-[#EEEEEE]"><%= movie.getGenre() %></p>
                </div>
                <div>
                    <h3 class="futuristic-text text-[#D84040] mb-1">Price</h3>
                    <p class="text-[#EEEEEE]"><%= movie.getPrice() %> LKR</p>
                </div>
            </div>

            <div class="flex space-x-4 mb-8">
                <form action="<%= request.getContextPath() %>/pay" method="post" class="flex-1">
                    <input type="hidden" name="movieId" value="<%= movie.getId() %>">
                    <button type="submit" class="w-full futuristic-text py-3 px-4 bg-gradient-to-r from-[#8E1616] to-[#D84040] text-[#EEEEEE] rounded-lg hover:opacity-90 transition-opacity">
                        Rent Now
                    </button>
                </form>
                <form action="<%= request.getContextPath() %>/watchlist" method="post" class="flex-1">
                    <input type="hidden" name="movieId" value="<%= movie.getId() %>">
                    <input type="hidden" name="action" value="add">
                    <button type="submit" class="w-full py-3 px-4 border border-[#8E1616] text-[#EEEEEE] rounded-lg hover:bg-[#8E1616] hover:bg-opacity-30 transition-colors">
                        + Watchlist
                    </button>
                </form>
            </div>
        </div>
    </div>

    <!-- Reviews Section -->
    <div class="border-t border-[#8E1616] pt-8">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Submit Review Form -->
            <div class="bg-[#1D1616] border border-[#8E1616] rounded-xl p-6">
                <h2 class="futuristic-text text-xl text-[#D84040] mb-4">Submit Review</h2>
                <form action="<%= request.getContextPath() %>/review" method="post">
                    <input type="hidden" name="movieId" value="<%= movie.getId() %>">

                    <div class="mb-4">
                        <label class="block text-[#EEEEEE] mb-2">Rating</label>
                        <select name="rating" class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040]">
                            <option value="1">1 ⭐</option>
                            <option value="2">2 ⭐⭐</option>
                            <option value="3" selected>3 ⭐⭐⭐</option>
                            <option value="4">4 ⭐⭐⭐⭐</option>
                            <option value="5">5 ⭐⭐⭐⭐⭐</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="block text-[#EEEEEE] mb-2">Comment</label>
                        <textarea name="comment" rows="4" class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040]"></textarea>
                    </div>

                    <button type="submit" class="w-full futuristic-text py-3 px-4 bg-[#8E1616] text-[#EEEEEE] rounded-lg hover:bg-[#D84040] transition-colors">
                        Submit Review
                    </button>
                </form>
            </div>

            <!-- Reviews List -->
            <div>
                <h2 class="futuristic-text text-xl text-[#D84040] mb-4">User Reviews</h2>

                <%
                    if (reviews != null && !reviews.isEmpty()) {
                %>
                <div class="space-y-4">
                    <%
                        for (Review r : reviews) {
                    %>
                    <div class="review-card bg-[#1D1616] border border-[#8E1616] rounded-xl p-4 transition-all">
                        <div class="flex justify-between items-start mb-2">
                            <h3 class="futuristic-text text-[#EEEEEE]"><%= r.getUsername() %></h3>
                            <div class="flex items-center">
                                <%
                                    for (int i = 1; i <= 5; i++) {
                                        if (i <= r.getRating()) {
                                %>
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-yellow-400" viewBox="0 0 20 20" fill="currentColor">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                </svg>
                                <%
                                } else {
                                %>
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-500" viewBox="0 0 20 20" fill="currentColor">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                </svg>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <p class="text-[#EEEEEE] opacity-90"><%= r.getComment() %></p>
                    </div>
                    <%
                        }
                    %>
                </div>
                <%
                } else {
                %>
                <div class="text-center py-8 border border-[#8E1616] rounded-lg">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-[#8E1616]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
                    </svg>
                    <h3 class="futuristic-text text-lg mt-4">No reviews yet</h3>
                    <p class="text-[#EEEEEE] opacity-70 mt-1">Be the first to review this movie</p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>