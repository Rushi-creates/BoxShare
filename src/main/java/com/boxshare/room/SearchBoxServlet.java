package com.boxshare.room;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchBoxServlet")
public class SearchBoxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	   // JDBC connection parameters (replace with your actual values)
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/box_share";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin@123***";
    
    static {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();  // Handle the exception appropriately
        }
    }

    


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the box ID from the form
        String boxId = request.getParameter("boxId");

        // TODO: Validate input and handle potential errors

        // Check if the box ID exists in the database
        boolean boxExists = checkBoxExists(boxId);

        if (boxExists) {
            // Box exists, redirect to the viewBox page
            response.sendRedirect("viewBox.jsp?boxId=" + boxId);
            

            // Set the error message to an empty string
            request.setAttribute("errorMessage", "");
        } else {
            // Box doesn't exist, show a message
            request.setAttribute("errorMessage", "Box with ID " + boxId + " doesn't exist.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }

    private boolean checkBoxExists(String boxId) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String checkBoxQuery = "SELECT COUNT(*) FROM Box WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(checkBoxQuery)) {
                preparedStatement.setString(1, boxId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int count = resultSet.getInt(1);
                        return count > 0;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();  // Handle errors appropriately
        }
        return false;
    }


}
