package com.boxshare.room;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddFileServlet")
public class AddFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

    
    
    // JDBC connection parameters (replace with your actual values)
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/box_share";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin@123***";

    
    public AddFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    static {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();  // Handle the exception appropriately
        }
    }

    

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	      String textContent = request.getParameter("textContent");
	        String boxId = request.getParameter("boxId");

	        // TODO: Validate input and handle potential errors

	        // TODO: Insert the text content into the File table
	        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
	            String insertTextQuery = "INSERT INTO File (box_id, fileContent) VALUES (?, ?)";
	            try (PreparedStatement preparedStatement = connection.prepareStatement(insertTextQuery)) {
	                preparedStatement.setString(1, boxId);
	                preparedStatement.setString(2, textContent);

	                // Execute the SQL statement to insert the text content
	                preparedStatement.executeUpdate();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();  // Handle errors appropriately
	        }

	        // Redirect to the view box page or any other appropriate page
	        response.sendRedirect("viewBox.jsp?boxId=" + boxId);
	    }
	}


