<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View box</title>
</head>
<body >



    <h1>Box ID: ${param.boxId}</h1>

    <!-- Add your content to display files or any other information about the box -->
    
    
    <!-- Display list of files for the specific box ID -->
    <ul>
        <% 
            // Fetch data from the File table for the specific box ID
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/box_share", "root", "admin@123***")) {
                String selectFilesQuery = "SELECT fileContent FROM File WHERE box_id = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(selectFilesQuery)) {
                    preparedStatement.setString(1, request.getParameter("boxId"));
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        while (resultSet.next()) {
                            String fileContent = resultSet.getString("fileContent");
        %>
                            <li><%= fileContent %></li>
        <%
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </ul>
    


    
        <form action="AddFileServlet" method="post">
        <label for="textContent">Enter your text here</label><br>
        <textarea name="textContent" id="textContent" rows="10" cols="50" required></textarea><br>
        <input type="hidden" name="boxId" value="${param.boxId}">
        <input type="submit" value="Save your text">
    </form>
    

    <!-- Add any other content or styling as needed -->
</body>
</html>