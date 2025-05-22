<%@ page import="com.app.movierental.model.Movie" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
    body {
      font-family: 'Roboto', sans-serif;
    }
    .futuristic-text {
      font-family: 'Orbitron', sans-serif;
    }
    .movie-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(216, 64, 64, 0.3);
    }
  </style>
</head>
<body class="bg-[#1D1616] text-[#EEEEEE] min-h-screen">
<div class="container mx-auto px-4 py-8">
  <!-- Header -->
  <header class="flex justify-between items-center mb-12 border-b border-[#8E1616] pb-6">
    <div>
      <h1 class="futuristic-text text-3xl font-bold text-[#D84040]">MovieR&R</h1>
    </div>
    <div class="text-right">
      <h2 class="futuristic-text text-xl">Welcome, <a href="<%= request.getContextPath() %>/user-dashboard" class="text-[#D84040] hover:text-[#8E1616] transition-colors">${user.fullName}!</a></h2>
    </div>
  </header>

  <!-- Main Content -->
  <main>

    <div>
      <div class="flex justify-between items-center mb-6">
        <h2 class="futuristic-text text-2xl border-l-4 border-[#D84040] pl-4">All Movies</h2>
        <div class="relative">
          <input type="text" placeholder="Search movies..." class="bg-[#1D1616] border border-[#8E1616] rounded-full py-2 px-4 pr-10 focus:outline-none focus:ring-2 focus:ring-[#D84040]">
          <button class="absolute right-3 top-2 text-[#D84040]">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </button>
        </div>
      </div>

      <!-- Movie Grid -->
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
        <%
          List<Movie> movies = (List<Movie>) request.getAttribute("movies");
          if (movies != null && !movies.isEmpty()) {
            for (Movie m : movies) {
        %>
        <div class="movie-card bg-[#1D1616] border border-[#8E1616] rounded-lg overflow-hidden transition-all duration-300 hover:cursor-pointer"
             onclick="location.href='<%= request.getContextPath() %>/movie-details?movieId=<%= m.getId() %>'">
          <div class="h-48 bg-[#8E1616] flex items-center justify-center">
            <img src="<%= request.getContextPath() + "/" + m.getPhotoPath() %>"
                 alt="<%= m.getTitle() %>"
                 class="h-full w-full object-cover">
          </div>
          <div class="p-4">
            <h3 class="futuristic-text text-lg font-semibold text-[#D84040] mb-1"><%= m.getTitle() %></h3>
            <p class="text-sm text-[#EEEEEE] opacity-80 mb-2"><%= m.getGenre() %></p>
            <div class="flex justify-between items-center">
              <span class="futuristic-text text-[#D84040] font-medium"><%= m.getPrice() %> LKR</span>
              <span class="text-xs text-[#EEEEEE] opacity-70"><%= m.getReleaseDate() %></span>
            </div>
          </div>
        </div>
        <%
          }
        } else {
        %>
        <div class="col-span-full text-center py-12">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-[#8E1616]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <h3 class="futuristic-text text-xl mt-4 text-[#EEEEEE]">No movies found</h3>
          <p class="text-[#EEEEEE] opacity-70 mt-2">Check back later for new releases</p>
        </div>
        <%
          }
        %>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <footer class="mt-16 border-t border-[#8E1616] pt-6 text-center text-sm text-[#EEEEEE] opacity-70">
    <p>© 2025 MovieR&R Futuristic Movie Rental. All rights reserved.</p>
  </footer>
</div>
</body>
</html>