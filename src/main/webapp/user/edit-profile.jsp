<%@ page import="com.app.movierental.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile | MovieR&R</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
        body {
            font-family: 'Roboto', sans-serif;
        }
        .futuristic-text {
            font-family: 'Orbitron', sans-serif;
        }
        .glass-effect {
            backdrop-filter: blur(10px);
            background: rgba(29, 22, 22, 0.85);
        }
    </style>
</head>
<body class="min-h-screen bg-[#1D1616] bg-[url('https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=1925&auto=format&fit=crop')] bg-cover bg-center flex items-center justify-center">
<div class="glass-effect border border-[#8E1616] rounded-xl p-8 w-full max-w-md mx-4">
    <div class="text-center mb-8">
        <h1 class="futuristic-text text-2xl text-[#D84040] mb-1">Edit Profile</h1>
        <p class="text-[#EEEEEE] opacity-80">Update your account details</p>
    </div>

    <form action="edit-profile" method="post" class="space-y-6">
        <div>
            <label class="block text-[#EEEEEE] mb-2">Full Name</label>
            <input type="text" name="fullName" value="<%= user.getFullName() %>" required
                   class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040] transition-colors">
        </div>

        <div>
            <label class="block text-[#EEEEEE] mb-2">Password</label>
            <input type="password" name="password" value="<%= user.getPassword() %>" required
                   class="w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040] transition-colors">
        </div>

        <div class="flex space-x-4">
            <button type="submit"
                    class="flex-1 futuristic-text py-2 px-4 bg-gradient-to-r from-[#8E1616] to-[#D84040] text-[#EEEEEE] rounded-lg hover:opacity-90 transition-opacity">
                Update Profile
            </button>
            <a href="dashboard"
               class="flex-1 text-center py-2 px-4 border border-[#8E1616] text-[#EEEEEE] rounded-lg hover:bg-[#8E1616] hover:bg-opacity-30 transition-colors">
                Cancel
            </a>
        </div>

        <% if (request.getAttribute("error") != null) { %>
        <div class="mt-4 p-3 bg-[#8E1616] bg-opacity-30 border border-[#D84040] rounded-lg text-[#EEEEEE] text-center">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
    </form>

    <div class="mt-8 pt-6 border-t border-[#8E1616]">
        <form action="delete-account" method="post" onsubmit="return confirm('Are you sure you want to delete your account? This cannot be undone.');">
            <button type="submit"
                    class="w-full futuristic-text py-2 px-4 bg-[#1D1616] border border-red-700 text-red-400 rounded-lg hover:bg-red-900 hover:bg-opacity-30 transition-colors">
                Delete Account
            </button>
        </form>
    </div>
</div>
</body>
</html>