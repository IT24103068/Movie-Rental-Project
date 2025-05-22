<%@ page import="com.app.movierental.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Your Reviews | MovieR&R</title>
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
  <div class="mb-8 border-b border-[#8E1616] pb-4">
    <h1 class="futuristic-text text-2xl text-[#D84040]">Your Movie Reviews</h1>
  </div>

  <%
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
    if (reviews != null && !reviews.isEmpty()) {
  %>
  <div class="space-y-6">
    <%
      for (Review r : reviews) {
    %>
    <div class="bg-[#1D1616] border border-[#8E1616] rounded-lg p-4 hover:border-[#D84040] transition-colors">
      <div class="flex justify-between items-start mb-3">
        <h3 class="futuristic-text text-lg text-[#EEEEEE]">Movie ID: <%= r.getMovieId() %></h3>
        <span class="flex items-center bg-[#8E1616] bg-opacity-30 px-2 py-1 rounded-full text-sm">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-yellow-400 mr-1" viewBox="0 0 20 20" fill="currentColor">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
            </svg>
            <%= r.getRating() %>/5
          </span>
      </div>

      <p class="text-[#EEEEEE] mb-4"><%= r.getComment() %></p>

      <div class="flex space-x-2">
        <form action="manage-reviews" method="get" class="flex-1">
          <input type="hidden" name="action" value="edit">
          <input type="hidden" name="movieId" value="<%= r.getMovieId() %>">
          <button type="submit" class="w-full py-1 px-3 border border-[#8E1616] text-[#EEEEEE] rounded hover:bg-[#8E1616] hover:bg-opacity-30 transition-colors text-sm">
            Edit Review
          </button>
        </form>

        <form action="manage-reviews" method="get" class="flex-1">
          <input type="hidden" name="action" value="delete">
          <input type="hidden" name="movieId" value="<%= r.getMovieId() %>">
          <button type="submit" onclick="return confirm('Are you sure you want to delete this review?');"
                  class="w-full py-1 px-3 bg-[#8E1616] text-[#EEEEEE] rounded hover:bg-[#D84040] transition-colors text-sm">
            Delete
          </button>
        </form>
      </div>
    </div>
    <%
      }
    %>
  </div>
  <%
  } else {
  %>
  <div class="text-center py-12">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-[#8E1616]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
    </svg>
    <h3 class="futuristic-text text-xl mt-4">No reviews yet</h3>
    <p class="text-[#EEEEEE] opacity-70 mt-2">Your reviews will appear here</p>
  </div>
  <%
    }
  %>
</div>
</body>
</html>