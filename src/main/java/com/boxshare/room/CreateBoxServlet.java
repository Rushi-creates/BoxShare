package com.boxshare.room;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/CreateBoxServlet")
public class CreateBoxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    // JDBC connection parameters (replace with your actual values)
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/box_share";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin@123***";

    
    public CreateBoxServlet() {
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
		// Inside the doPost method
		String insertBoxQuery = "INSERT INTO Box (name) VALUES (?)";
		
		// Inside the doPost method
		try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
		     PreparedStatement preparedStatement = connection.prepareStatement(insertBoxQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
			
			

		    // Set parameters for the prepared statement
		    preparedStatement.setString(1, "Box Name"); // You can set the box name as needed

		    // Execute the SQL statement to insert the new box
		    int affectedRows = preparedStatement.executeUpdate();

		    if (affectedRows > 0) {
		        // Retrieve the generated ID from the database
		        try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
		            if (generatedKeys.next()) {
		                int boxId = generatedKeys.getInt(1); // Assuming the ID is an integer

		                // Redirect to a new page with the ID of the created box
		                response.sendRedirect("viewBox.jsp?boxId=" + boxId);
		            }
		        }
		    }

		} catch (SQLException e) {
		    e.printStackTrace();  // Handle errors appropriately
		}


		
	}

}







