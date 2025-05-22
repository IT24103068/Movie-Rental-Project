<%@ page import="com.app.movierental.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard | MovieR&R</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
    body {
      font-family: 'Roboto', sans-serif;
    }
    .futuristic-text {
      font-family: 'Orbitron', sans-serif;
    }
    .dashboard-card:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(216, 64, 64, 0.2);
    }
    .glass-effect {
      backdrop-filter: blur(10px);
      background: rgba(29, 22, 22, 0.85);
    }
  </style>
</head>
<body class="min-h-screen bg-[#1D1616] bg-[url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1925&auto=format&fit=crop')] bg-cover bg-center">
<div class="container mx-auto px-4 py-12">
  <div class="glass-effect border border-[#8E1616] rounded-xl max-w-2xl mx-auto overflow-hidden">
    <!-- Header -->
    <div class="bg-gradient-to-r from-[#1D1616] to-[#8E1616] p-6 border-b border-[#D84040]">
      <h1 class="futuristic-text text-3xl text-[#EEEEEE] mb-1">MovieR&R</h1>
      <h2 class="futuristic-text text-xl text-[#D84040]">Welcome back, <span class="text-[#EEEEEE]"><%= user.getFullName() %></span></h2>
    </div>

    <!-- Dashboard Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 p-6">
      <a href="edit-profile" class="dashboard-card group flex items-center p-4 bg-[#1D1616] border border-[#8E1616] rounded-lg hover:border-[#D84040] transition-all duration-300">
        <div class="bg-[#8E1616] bg-opacity-30 p-3 rounded-full mr-4 group-hover:bg-opacity-50 transition-all">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
          </svg>
        </div>
        <div>
          <h3 class="futuristic-text text-[#EEEEEE]">Edit Profile</h3>
          <p class="text-xs text-[#EEEEEE] opacity-70">Update your account details</p>
        </div>
      </a>

      <a href="dashboard" class="dashboard-card group flex items-center p-4 bg-[#1D1616] border border-[#8E1616] rounded-lg hover:border-[#D84040] transition-all duration-300">
        <div class="bg-[#8E1616] bg-opacity-30 p-3 rounded-full mr-4 group-hover:bg-opacity-50 transition-all">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
          </svg>
        </div>
        <div>
          <h3 class="futuristic-text text-[#EEEEEE]">Main Dashboard</h3>
          <p class="text-xs text-[#EEEEEE] opacity-70">Browse all movies</p>
        </div>
      </a>

      <a href="watchlist-page" class="dashboard-card group flex items-center p-4 bg-[#1D1616] border border-[#8E1616] rounded-lg hover:border-[#D84040] transition-all duration-300">
        <div class="bg-[#8E1616] bg-opacity-30 p-3 rounded-full mr-4 group-hover:bg-opacity-50 transition-all">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15l8-8m0 0l-8-8m8 8H4" />
          </svg>
        </div>
        <div>
          <h3 class="futuristic-text text-[#EEEEEE]">Watchlist</h3>
          <p class="text-xs text-[#EEEEEE] opacity-70">Your saved movies</p>
        </div>
      </a>

      <a href="rented-movies" class="dashboard-card group flex items-center p-4 bg-[#1D1616] border border-[#8E1616] rounded-lg hover:border-[#D84040] transition-all duration-300">
        <div class="bg-[#8E1616] bg-opacity-30 p-3 rounded-full mr-4 group-hover:bg-opacity-50 transition-all">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7v8a2 2 0 002 2h6M8 7V5a2 2 0 012-2h4.586a1 1 0 01.707.293l4.414 4.414a1 1 0 01.293.707V15a2 2 0 01-2 2h-2M8 7H6a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2v-2" />
          </svg>
        </div>
        <div>
          <h3 class="futuristic-text text-[#EEEEEE]">Rental History</h3>
          <p class="text-xs text-[#EEEEEE] opacity-70">Past rentals</p>
        </div>
      </a>

      <a href="view-watched" class="dashboard-card group flex items-center p-4 bg-[#1D1616] border border-[#8E1616] rounded-lg hover:border-[#D84040] transition-all duration-300">
        <div class="bg-[#8E1616] bg-opacity-30 p-3 rounded-full mr-4 group-hover:bg-opacity-50 transition-all">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
          </svg>
        </div>
        <div>
          <h3 class="futuristic-text text-[#EEEEEE]">Recently Watched</h3>
          <p class="text-xs text-[#EEEEEE] opacity-70">Your viewing history</p>
        </div>
      </a>

      <a href="payment-history" class="dashboard-card group flex items-center p-4 bg-[#1D1616] border border-[#8E1616] rounded-lg hover:border-[#D84040] transition-all duration-300">
        <div class="bg-[#8E1616] bg-opacity-30 p-3 rounded-full mr-4 group-hover:bg-opacity-50 transition-all">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        </div>
        <div>
          <h3 class="futuristic-text text-[#EEEEEE]">Payment History</h3>
          <p class="text-xs text-[#EEEEEE] opacity-70">Transaction records</p>
        </div>
      </a>

      <a href="manage-reviews" class="dashboard-card group flex items-center p-4 bg-[#1D1616] border border-[#8E1616] rounded-lg hover:border-[#D84040] transition-all duration-300">
        <div class="bg-[#8E1616] bg-opacity-30 p-3 rounded-full mr-4 group-hover:bg-opacity-50 transition-all">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#D84040]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        </div>
        <div>
          <h3 class="futuristic-text text-[#EEEEEE]">Reviews</h3>
          <p class="text-xs text-[#EEEEEE] opacity-70">Your Reviews</p>
        </div>
      </a>
    </div>

    <!-- Footer -->
    <div class="border-t border-[#8E1616] p-4 flex justify-between items-center">
      <a href="logout" class="futuristic-text px-4 py-2 bg-[#8E1616] text-[#EEEEEE] rounded-lg hover:bg-[#D84040] transition-colors">
        Logout
      </a>
    </div>
  </div>
</div>
</body>
</html>