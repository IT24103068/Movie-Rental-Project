<%@ page contentType="text/html" %>
<html>
<head>
  <title>Edit Movie</title>
</head>
<body>
<h2>Edit Movie</h2>
<form action="movie" method="post">
  <input type="hidden" name="action" value="update"/>
  <input type="hidden" name="movieId" value="${movie.id}"/>
  Title: <input type="text" name="title" value="${movie.title}" required/><br/>
  Description: <textarea name="description">${movie.description}</textarea><br/>
  Genre: <input type="text" name="genre" value="${movie.genre}" required/><br/>
  Release Date: <input type="date" name="releaseDate" value="${movie.releaseDate}" required/><br/>
  Price: <input type="number" step="0.01" name="price" value="${movie.price}" required/><br/>
  <input type="submit" value="Update Movie"/>
</form>
</body>
</html>
