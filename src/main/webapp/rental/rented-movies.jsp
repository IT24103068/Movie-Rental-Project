<%@ page import="com.app.movierental.model.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.movierental.model.RentedMovie" %>
<%@ page import="com.app.movierental.dao.MovieDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rented Movies | MovieR&R</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
        body {
            font-family: 'Roboto', sans-serif;
        }
        .futuristic-text {
            font-family: 'Orbitron', sans-serif;
        }
    </style>
</head>
<body class="min-h-screen bg-[#1D1616] text-[#EEEEEE]">
<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-8 border-b border-[#8E1616] pb-4">
        <h1 class="futuristic-text text-2xl text-[#D84040]">Your Rented Movies</h1>
        <a href="<%= request.getContextPath() %>/dashboard" class="text-[#EEEEEE] hover:text-[#D84040] transition-colors">Back to Dashboard</a>
    </div>

    <%
        List<RentedMovie> rentedMovies = (List<RentedMovie>) request.getAttribute("rentedMovies");
        if (rentedMovies != null && !rentedMovies.isEmpty()) {
    %>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <%
            for (RentedMovie rm : rentedMovies) {
                Movie m = MovieDAO.getMovieById(rm.getMovieId());
                if (m != null) {
        %>
        <div class="bg-[#1D1616] border border-[#8E1616] rounded-lg overflow-hidden hover:border-[#D84040] transition-colors">
            <div class="p-4">
                <h3 class="futuristic-text text-lg text-[#D84040] mb-1"><%= m.getTitle() %></h3>
                <p class="text-sm text-[#EEEEEE] opacity-80 mb-3">Rented on: <%= rm.getRentDate() %></p>

                <div class="flex space-x-2">
                    <form action="<%= request.getContextPath() %>/rent" method="post" class="flex-1">
                        <input type="hidden" name="movieId" value="<%= m.getId() %>">
                        <input type="hidden" name="action" value="return">
                        <button type="submit" class="w-full py-1 px-3 bg-[#8E1616] text-[#EEEEEE] rounded hover:bg-[#D84040] transition-colors text-sm">
                            Return
                        </button>
                    </form>

                    <form action="<%= request.getContextPath() %>/mark-watched" method="post" class="flex-1">
                        <input type="hidden" name="movieId" value="<%= m.getId() %>">
                        <button type="submit" class="w-full py-1 px-3 border border-[#8E1616] text-[#EEEEEE] rounded hover:bg-[#8E1616] hover:bg-opacity-30 transition-colors text-sm">
                            Mark Watched
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
    <%
    } else {
    %>
    <div class="text-center py-12">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-[#8E1616]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" />
        </svg>
        <h3 class="futuristic-text text-xl mt-4">No rented movies</h3>
        <p class="text-[#EEEEEE] opacity-70 mt-2">Your rentals will appear here</p>
    </div>
    <%
        }
    %>
</div>
</body>
</html>