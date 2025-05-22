<%@ page contentType="text/html" %>
<html>
<head>
    <title>Sign Up | MovieR&R</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Roboto:wght@300;400;500&display=swap');
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #1D1616;
        }
        .futuristic-text {
            font-family: 'Orbitron', sans-serif;
        }
        .auth-container {
            backdrop-filter: blur(10px);
            background: rgba(29, 22, 22, 0.8);
        }
        .input-field:focus {
            box-shadow: 0 0 0 2px #D84040;
        }
        select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%23D84040' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center bg-[url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070&auto=format&fit=crop')] bg-cover bg-center">
<div class="auth-container border border-[#8E1616] rounded-xl p-8 w-full max-w-md mx-4">
    <div class="text-center mb-8">
        <h1 class="futuristic-text text-3xl text-[#D84040] mb-2">MovieR&R</h1>
        <p class="text-[#EEEEEE] opacity-80">Future of Movie Experience</p>
    </div>

    <h2 class="futuristic-text text-xl text-[#EEEEEE] mb-6 text-center">Create Account</h2>

    <form action="/movieRental_war_exploded/signup" method="post" class="space-y-6">
        <div>
            <label class="block text-[#EEEEEE] mb-2">Full Name</label>
            <input type="text" name="fullName" required
                   class="input-field w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040] transition-colors" />
        </div>

        <div>
            <label class="block text-[#EEEEEE] mb-2">Username</label>
            <input type="text" name="username" required
                   class="input-field w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040] transition-colors" />
        </div>

        <div>
            <label class="block text-[#EEEEEE] mb-2">Password</label>
            <input type="password" name="password" required
                   class="input-field w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040] transition-colors" />
        </div>

        <div>
            <label class="block text-[#EEEEEE] mb-2">Role</label>
            <select name="role" required
                    class="input-field w-full px-4 py-2 bg-[#1D1616] border border-[#8E1616] rounded-lg text-[#EEEEEE] focus:outline-none focus:border-[#D84040] transition-colors pr-10">
                <option value="user" class="bg-[#1D1616]">User</option>
                <option value="admin" class="bg-[#1D1616]">Admin</option>
            </select>
        </div>

        <button type="submit"
                class="w-full futuristic-text py-3 px-4 bg-gradient-to-r from-[#8E1616] to-[#D84040] text-[#EEEEEE] rounded-lg hover:opacity-90 transition-opacity font-medium">
            Register
        </button>
    </form>

    <div class="mt-6 text-center">
        <p class="text-[#EEEEEE] opacity-80">Already have an account?
            <a href="/movieRental_war_exploded/login" class="text-[#D84040] hover:underline">Login</a>
        </p>
    </div>
</div>
</body>
</html>