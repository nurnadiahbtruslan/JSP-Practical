<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		    	  //create and execute query statement for select student
		    	  statement = connection.createStatement();
		    	  ResultSet rs = statement.executeQuery("select * from marks");
		    	  
		    	  %>
		    	  
		    	  

		    	  <%//Create table for students %>
		    	  <table border="1">
		    	  <tr>
		    	  <th>Student ID</th>
		    	  <th>Science</th>
		    	  <th>Mathematics</th>
		    	  <th>English</th>
		    	  <th>Average</th>
		    	  </tr>
		    	  
		    	  <%
		    	  //get students data from database
		    	  while(rs.next()) { 
		    		  String science="";
		        	  String mathematics="";
		        	  String english="";
		        	  int average=0;
		        	  String studentId="";
		        	  
		        	  
		    	  %>
		    	  <%
		    	  studentId=rs.getString("student_id");
		    	  science=rs.getString("science");
		    	  mathematics=rs.getString("mathematics");
		    	  english=rs.getString("english");
		    	  int sc = Integer.parseInt(science);
		    	  int math = Integer.parseInt(mathematics);
		    	  int eng = Integer.parseInt(english);
		    	  
	    	   
		    	  %>
		    	  
		    	  
		    	  
		    	  <tr>
		    	  <td><%=studentId%></td>
		    	  <td><%=science%></td>
		    	  <td><%=mathematics%></td>
		    	  <td><%=english%></td>
		    	  <td><%=average=(sc + math + eng)/3%></td>
		    	  
		    	  </tr>
		    	  
		    	  <%
		    	  }
		    	  %>
		    	  </table>
		    	  
		      <%
		      //If execution fail
		      } catch(Exception e) {
		    	  //show error message
		    	  out.println(e.getMessage());
		      }	      
		  } else{ 
		        
		     %>
		    <p>login failed</p>
		    <%
	  }
		    %>
</body>
</html>