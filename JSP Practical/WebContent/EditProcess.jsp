<%//This page is to create the process of editing student information %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Process</title>
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
			  
			  //Turn off autocommit
			  connection.setAutoCommit(false);
			 
			  //Create query for update student
			  PreparedStatement stmt = connection.prepareStatement("update Student set name= ?,password=password(?), department=? where id = ?");
			  stmt.setString(1,request.getParameter("newName"));
			  stmt.setString(2,request.getParameter("newPass"));
			  stmt.setString(3,request.getParameter("newDepartment"));
			  stmt.setString(4,request.getParameter("id"));
			  
			  //Output the query statement
			  System.out.println(stmt);
			  
			  //Execute the query statement
			  int row = stmt.executeUpdate();
			  
			  //Set connection to commit
			  connection.commit();
			  
			  //Show result
			  if(row>0){
				  out.println(row + " Student updated ");
			  }  else{
				  out.println("Failed to update student");
			  }
			  
			  //If execution fail
			  } catch(Exception e) {
				  //show error message
		    	  out.println(e.getMessage());
		    	  //Set connection to rollbsck
		    	  connection.rollback();
		      } 
		      } else {
		     %>
		    	  <p>login failed</p>
		     <%
		    }%>
	  </p>
</body>
</html>
