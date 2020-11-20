// Import required java libraries
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*; 

// Extend HttpServlet class
public class StudentInfoProcess extends HttpServlet{

	     
	   boolean login=false;
		Statement statement=null;
		Connection connection = null;
		
	   public void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
		   
		   String id=request.getParameter("ID");
		   String password=request.getParameter("password");
	      
	      response.setContentType("text/html");
	      
	      try{
	    	  Class.forName("com.mysql.jdbc.Driver");

	    	  connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "Iya030299");	
	    	  	
	    	  		statement = connection.createStatement();        

	    	  		String sql = "select name from Student where id='"+ id +"' and password='"+ password +"'";
	  
	    	  		ResultSet rs = statement.executeQuery (sql); 
	    	  		
	    	  		if(rs.next()) {
	    	  	    	login = true;
	    	  	    	
	    	  	    } 
	    	  		}
	    	  catch(Exception e) {
	    	  	   e.getMessage();
	    	  	}

	      if(login) {

	    	  PrintWriter out = response.getWriter();
	          String title = "Welcome "+ id;
	          String docType =
	             "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
	          
	         
	          out.println(docType +
	             "<html>\n" +
	                "<head><title>" + "Student Info" + "</title></head>\n" +
	                   "<h2>" + title + "</h2>\n" +
	                "</body>" +
	             "</html>"
	          );
	          
	          try {
	  		    statement = connection.createStatement();
	  		    ResultSet rs = statement.executeQuery("select id, name, department from Student");
	  		    
	  		    
	  		    out.println(docType +
	  		    		"<table border=\"1\">\n" +
	  		    		  "<tr>" +
	  		  	  	        "<th>Student ID</th>" + 
	  		  	  	        "<th>Name</th>" +
	  		  	  	        "<th>Department</th>" +
	  		  	  	      "</tr>" 	);
	          
	  		  while(rs.next()) { 
	  			 
	             out.println(docType +
	            		 "<tr>" + 
	              	    "<td>" + rs.getString("id") +"</td>" +
	              	    "<td>" + rs.getString("name") + "</td>" + 
	              	    "<td>" + rs.getString("department") + "</td>" + 
	              	    "<tr>"  
	            		 );
	          }
	  		  
	    	  
	      }
	          catch(Exception e) {
	  	    	out.println(e.getMessage());
	  	    }
	      
	   }
	      else {
	    	  System.out.println("login failed!!");
	      }
	} }