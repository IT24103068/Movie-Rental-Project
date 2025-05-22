<%@ page import="com.app.movierental.model.Review" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Reviews | MovieR&R</title>
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
        <h1 class="futuristic-text text-2xl text-[#D84040]">All Reviews</h1>
        <a href="${pageContext.request.contextPath}/admin-dashboard" class="text-[#EEEEEE] hover:text-[#D84040] transition-colors">
            Back to Dashboard
        </a>
    </div>

    <div class="overflow-x-auto">
        <table class="w-full border-collapse">
            <thead>
            <tr class="bg-[#8E1616] bg-opacity-30">
                <th class="p-3 text-left futuristic-text">Username</th>
                <th class="p-3 text-left futuristic-text">Movie ID</th>
                <th class="p-3 text-left futuristic-text">Rating</th>
                <th class="p-3 text-left futuristic-text">Comment</th>
                <th class="p-3 text-left futuristic-text">Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Review> reviews = (List<Review>) request.getAttribute("reviews");
                for (Review review : reviews) {
            %>
            <tr class="border-b border-[#8E1616] hover:bg-[#1D1616]">
                <td class="p-3"><%= review.getUsername() %></td>
                <td class="p-3"><%= review.getMovieId() %></td>
                <td class="p-3">
                    <div class="flex items-center">
                        <% for (int i = 0; i < review.getRating(); i++) { %>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-yellow-400" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                        </svg>
                        <% } %>
                    </div>
                </td>
                <td class="p-3"><%= review.getComment() %></td>
                <td class="p-3">
                    <a href="manage-reviews?action=delete&movieId=<%= review.getMovieId() %>&username=<%= review.getUsername() %>"
                       class="text-[#D84040] hover:text-[#8E1616] transition-colors"
                       onclick="return confirm('Are you sure you want to delete this review?');">
                        Delete
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>