<%@ page import="java.util.*, com.app.movierental.model.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>All Movies | MovieR&R</title>
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
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(216, 64, 64, 0.2);
    }
  </style>
</head>
<body class="min-h-screen bg-[#1D1616] text-[#EEEEEE]">
<div class="container mx-auto px-4 py-8">
  <div class="flex justify-between items-center mb-8 border-b border-[#8E1616] pb-4">
    <h1 class="futuristic-text text-2xl text-[#D84040]">All Movies</h1>
    <div>
      <a href="${pageContext.request.contextPath}/admin-dashboard" class="text-[#EEEEEE] hover:text-[#D84040] transition-colors mr-4">
        Dashboard
      </a>
      <a href="movie?action=add" class="px-4 py-2 bg-[#8E1616] text-[#EEEEEE] rounded-lg hover:bg-[#D84040] transition-colors">
        Add New
      </a>
    </div>
  </div>

  <%
    List<Movie> movies = (List<Movie>) request.getAttribute("movies");
    if (movies != null && !movies.isEmpty()) {
  %>
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <%
      for (Movie m : movies) {
    %>
    <div class="movie-card bg-[#1D1616] border border-[#8E1616] rounded-xl overflow-hidden transition-all">
      <div class="h-48 bg-[#1D1616] flex items-center justify-center overflow-hidden">
        <% if (m.getPhotoPath() != null && !m.getPhotoPath().isEmpty()) { %>

        <img src="<%= request.getContextPath() + "/" + m.getPhotoPath() %>"
             alt="<%= m.getTitle() %>"
             class="h-full w-full object-cover">

        <% } else { %>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" />
        </svg>
        <% } %>
      </div>
      <div class="p-4">
        <h3 class="futuristic-text text-lg text-[#D84040] mb-1"><%= m.getTitle() %></h3>
        <p class="text-sm text-[#EEEEEE] opacity-80 mb-2"><%= m.getGenre() %></p>
        <p class="text-sm text-[#EEEEEE] mb-3 line-clamp-2"><%= m.getDescription() %></p>
        <div class="flex justify-between items-center mb-4">
          <span class="text-sm text-[#EEEEEE] opacity-80"><%= m.getReleaseDate() %></span>
          <span class="futuristic-text text-[#D84040]"><%= m.getPrice() %> LKR</span>
        </div>
        <div class="flex space-x-2">
          <form action="<%= request.getContextPath() %>/movie" method="get" class="flex-1">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="movieId" value="<%= m.getId() %>">
            <button type="submit" class="w-full py-1 px-3 border border-[#8E1616] text-[#EEEEEE] rounded hover:bg-[#8E1616] hover:bg-opacity-30 transition-colors text-sm">
              Edit
            </button>
          </form>
          <form action="<%= request.getContextPath() %>/movie" method="post" class="flex-1">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="movieId" value="<%= m.getId() %>">
            <button type="submit" onclick="return confirm('Are you sure you want to delete this movie?');"
                    class="w-full py-1 px-3 bg-[#8E1616] text-[#EEEEEE] rounded hover:bg-[#D84040] transition-colors text-sm">
              Delete
            </button>
          </form>
        </div>
      </div>
    </div>
    <%
      }
    %>
  </div>
  <%
  } else {
  %>
  <div class="text-center py-12 border border-[#8E1616] rounded-lg">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-[#8E1616]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" />
    </svg>
    <h3 class="futuristic-text text-xl mt-4">No movies found</h3>
    <p class="text-[#EEEEEE] opacity-70 mt-2">Add your first movie to get started</p>
    <a href="movie?action=add" class="inline-block mt-4 px-4 py-2 bg-[#8E1616] text-[#EEEEEE] rounded-lg hover:bg-[#D84040] transition-colors">
      Add Movie
    </a>
  </div>
  <%
    }
  %>
</div>
</body>
</html>