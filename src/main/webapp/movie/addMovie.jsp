<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Add Movie | MovieR&R</title>
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
<div class="container mx-auto px-4 py-8 max-w-2xl">
  <div class="mb-8 border-b border-[#8E1616] pb-4">
    <h1 class="futuristic-text text-2xl text-[#D84040]">Add New Movie</h1>
    <a href="${pageContext.request.contextPath}/admin-dashboard" class="text-[#EEEEEE] hover:text-[#D84040] transition-colors">
      Back to Dashboard
    </a>
  </div>

  <!-- Add enctype="multipart/form-data" for file upload -->
  <form action="${pageContext.request.contextPath}/movie?action=add" method="post" enctype="multipart/form-data" class="space-y-6">
    <input type="hidden" name="action" value="add">

    <div>
      <label class="block text-[#EEEEEE] mb-2">Title</label>
      <input type="text" name="title" required
             class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040]">
    </div>

    <div>
      <label class="block text-[#EEEEEE] mb-2">Description</label>
      <textarea name="description" rows="4" required
                class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040]"></textarea>
    </div>

    <div>
      <label class="block text-[#EEEEEE] mb-2">Genre</label>
      <input type="text" name="genre" required
             class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040]">
    </div>

    <div>
      <label class="block text-[#EEEEEE] mb-2">Release Date</label>
      <input type="date" name="releaseDate" required
             class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040]">
    </div>

    <div>
      <label class="block text-[#EEEEEE] mb-2">Price (LKR)</label>
      <input type="number" step="0.01" name="price" required
             class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040]">
    </div>

    <!-- Add file upload field -->
    <div>
      <label class="block text-[#EEEEEE] mb-2">Movie Poster</label>
      <input type="file" name="photo" accept="image/*" required
             class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040]">
    </div>

    <div class="pt-4">
      <button type="submit"
              class="w-full futuristic-text py-3 px-4 bg-gradient-to-r from-[#8E1616] to-[#D84040] text-[#EEEEEE] rounded-lg hover:opacity-90 transition-opacity">
        Add Movie
      </button>
    </div>
  </form>
</div>
</body>
</html>