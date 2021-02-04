<%//This page is to create the process of creating new student information %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Student Process</title>
</head>
<body>
<p>
	  <%
      boolean login=false;
      //check username and password in the database
      //to connect to database server
      String driverName = "com.mysql.jdbc.Driver";
      String connectionUr1 = "jdbc:mysql://localhost:3306/";
      String dbName = "db1";
      String userId = "root";
      String password ="Iya030299";
      
      Connection connection = null;
	  Statement statement = null;
	  
	  try{
		  login = true;
    	  //load the jdbc driver
    	  Class.forName(driverName);
    	  //connect to the database server
    	  connection = DriverManager.getConnection( connectionUr1 + dbName, userId, password);

      } catch(Exception e) {
    	  out.println(e.getMessage());
    	  }
	  
	  if (login){
		  try{
			  //Set auto commit off
			  connection.setAutoCommit(false);
			  
			  //Create query statement for insert student data
			  PreparedStatement stmt = connection.prepareStatement("insert into Student values (?,?,?,password(?))");
			  stmt.setString(1,request.getParameter("id"));
			  stmt.setString(2,request.getParameter("name"));
			  stmt.setString(3,request.getParameter("department"));
			  stmt.setString(4,request.getParameter("password"));
			  
			  //Output query statement
			  System.out.println(stmt);
			  
			  //Execute query statement
			  int row = stmt.executeUpdate();
			  //Set connection to commit
			  connection.commit();
			  //show result
			  if(row>0){
				  out.println(row + " New student added ");
			  }  else{
				  out.println("Failed to add student");
			  }
		  
		  }
			   //If execution fail 
			   catch(Exception e) {
				   //show error message
		    	  out.println(e.getMessage());
		    	  
		    	  if(connection!= null){
		    		  try{
		    			  //Set connection to rollback
		    			  out.println("Transaction is rolled back");
		    			  connection.rollback();
		    		  } catch(SQLException ee){
		    			  out.println(ee.getMessage());
		    		  }
		    	  }  
			  }			      
		  } else{ 
		        
		     %>
		    <p>login failed</p>
		    <%
	  }
		    %>
	  </p>
</body>
</html>
