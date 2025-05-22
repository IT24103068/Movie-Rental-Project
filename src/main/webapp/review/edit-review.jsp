<%@ page import="com.app.movierental.model.Review" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Edit Review</title></head>
<body>

<h2>Edit Your Review</h2>
<%
    Review review = (Review) request.getAttribute("review");
    if (review != null) {
%>
<form action="manage-reviews" method="post">
    <input type="hidden" name="movieId" value="<%= review.getMovieId() %>">

    <label>Rating (1-5):</label>
    <input type="number" name="rating" min="1" max="5" value="<%= review.getRating() %>" required><br><br>

    <label>Comment:</label><br>
    <textarea name="comment" rows="4" cols="50" required><%= review.getComment() %></textarea><br><br>

    <input type="submit" value="Update Review">
</form>
<%
} else {
%>
<p>Review not found.</p>
<%
    }
%>

</body>
</html>
