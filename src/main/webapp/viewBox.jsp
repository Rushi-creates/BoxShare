<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View box</title>
    <!-- Include Tailwind CSS -->
      <script src="https://cdn.tailwindcss.com"></script>
      
      <!-- JavaScript to Copy Link to Clipboard -->
<script>
    function copyLinkToClipboard() {
        var copyText = document.getElementById("copyLink");
        var textArea = document.createElement("textarea");
        textArea.value = copyText.textContent;
        document.body.appendChild(textArea);
        textArea.select();
        document.execCommand('copy');
        document.body.removeChild(textArea);
        alert("Link copied to clipboard!");
    }
</script>
    
        
</head>

<body class="font-sans  p-0 m-0">
 <%@ include file="navbar.jsp" %>



  <div class = "flex h-screen">

    <div class="container  flex">
        <!-- Left side - Form -->
<div class="w-1/3 flex flex-col items-center justify-center bg-gradient-to-r from-purple-500 to-purple-700 p-8 rounded-lg shadow-lg relative">
    <!-- Go Back Button -->
<a href="index.jsp" class="absolute top-4 left-4 text-white hover:text-gray-300 flex items-center">
    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
    </svg>
    <span class="ml-2">Go Home</span>
</a>

    
    <!-- Your Box ID Text -->
    <h2 class="text-2xl font-bold text-white mb-4 text-left">Your Box code is ${param.boxId}</h2>
    
    <!-- Form -->
    <form action="AddFileServlet" method="post" class="w-3/4">
        <div class="flex flex-col items-center h-full">
            <textarea name="textContent" id="textContent" rows="5" class="w-full border-2 rounded p-4 focus:outline-none focus:border-purple-700 transition duration-300" placeholder="Put your content here" required></textarea>
            <input type="hidden" name="boxId" value="${param.boxId}">
            <button type="submit" class="mt-4 bg-gradient-to-r from-pink-500 to-pink-700 hover:from-pink-700 hover:to-pink-900 text-white font-bold py-2 px-4 rounded focus:outline-none focus:ring-2 focus:ring-pink-400 transition duration-300">
                Add to box
            </button>
        </div>
    </form>
          <!-- Copyable Section -->
<!-- Copyable Section -->
<div class="bg-white p-4 rounded-lg mt-4 text-left">
    <h6 class="text-sm font-bold mb-2 text-gray-700">Your sharable link is:</h6>
    <div class="flex items-center">
        <span id="copyLink" class="mr-2 text-xs text-gray-500">http://localhost:8080/BoxShare/viewBox.jsp?boxId=${param.boxId}</span>
        <button onclick="copyLinkToClipboard()" class="bg-indigo-500 text-white px-2 py-1 rounded text-xs hover:bg-indigo-700 focus:outline-none focus:ring focus:border-indigo-300">
            Copy to Clipboard
        </button>
    </div>
</div>


</div>

    
            <div style="width: 20px;"></div>
            
        

        <!-- Right side - Scrollable List -->
        <div class="w-2/3 overflow-y-auto my-8">
            <h1 class="text-3xl font-bold mb-4">Contents of this box</h1>
            <ul class="list-none p-0">
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
<li class="border-b my-2 p-4 bg-white shadow-md rounded border border-gray-300">
    <%= fileContent %>
</li>

                <%
                                }
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </ul>
        </div>
    </div>
  </div>


</body>

</html>
