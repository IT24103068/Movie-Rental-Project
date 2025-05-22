<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.app.movierental.model.User" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard | MovieR&R</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
    body {
      font-family: 'Roboto', sans-serif;
    }
    .futuristic-text {
      font-family: 'Orbitron', sans-serif;
    }
    .admin-card:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(216, 64, 64, 0.2);
    }
  </style>
</head>
<body class="min-h-screen bg-[#1D1616] text-[#EEEEEE]">
<div class="container mx-auto px-4 py-8">
  <div class="mb-8 border-b border-[#8E1616] pb-4">
    <h1 class="futuristic-text text-3xl text-[#D84040]">Admin Dashboard</h1>
    <p class="text-[#EEEEEE] opacity-80">Welcome back, ${adminName}</p>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
    <a href="movie?action=add" class="admin-card group flex flex-col items-center p-6 bg-[#1D1616] border border-[#8E1616] rounded-xl hover:border-[#D84040] transition-all">
      <div class="bg-[#8E1616] bg-opacity-30 p-4 rounded-full mb-4 group-hover:bg-opacity-50">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
        </svg>
      </div>
      <h3 class="futuristic-text text-lg text-center">Add New Movies</h3>
    </a>

    <a href="movie?action=viewAll" class="admin-card group flex flex-col items-center p-6 bg-[#1D1616] border border-[#8E1616] rounded-xl hover:border-[#D84040] transition-all">
      <div class="bg-[#8E1616] bg-opacity-30 p-4 rounded-full mb-4 group-hover:bg-opacity-50">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" />
        </svg>
      </div>
      <h3 class="futuristic-text text-lg text-center">Manage Movies</h3>
    </a>

    <a href="manage-reviews?action=all" class="admin-card group flex flex-col items-center p-6 bg-[#1D1616] border border-[#8E1616] rounded-xl hover:border-[#D84040] transition-all">
      <div class="bg-[#8E1616] bg-opacity-30 p-4 rounded-full mb-4 group-hover:bg-opacity-50">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
        </svg>
      </div>
      <h3 class="futuristic-text text-lg text-center">View Reviews</h3>
    </a>

    <a href="logout" class="admin-card group flex flex-col items-center p-6 bg-[#1D1616] border border-[#8E1616] rounded-xl hover:border-[#D84040] transition-all">
      <div class="bg-[#8E1616] bg-opacity-30 p-4 rounded-full mb-4 group-hover:bg-opacity-50">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
        </svg>
      </div>
      <h3 class="futuristic-text text-lg text-center">Logout</h3>
    </a>
  </div>
</div>
</body>
</html>