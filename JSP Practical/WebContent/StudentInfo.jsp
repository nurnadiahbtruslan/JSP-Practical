<%//This page is to create the main page of student information center %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Information Center</title>
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
    	  //load the jdbc driver
    	  Class.forName(driverName);
    	  //connect to the database server
    	  connection = DriverManager.getConnection( connectionUr1 + dbName, userId, password);
    	 
    	  //Create query statement for select student
    	  PreparedStatement stmt = connection.prepareStatement("select name from Student where id=? and password=password(?)");
    	  stmt.setString(1, request.getParameter("username"));
    	  stmt.setString(2, request.getParameter("password"));
    	  
    	  //output query statement
    	  System.out.println(stmt);
    	  //execute query statement
    	  ResultSet rs = stmt.executeQuery();
    	  if(rs.next()){
    		  login = true;
    	  }
    	  
      } catch(Exception e) {
    	  out.println(e.getMessage());
    	  }
      
      if(login){
      %>
  	 
      <p>
      <% 
         out.println("Welcome ");
      %> 
	  
      <%=request.getParameter("username")%>
      </p>
     
      <%
      try{
    	  //create and execute query statement for select student
    	  statement = connection.createStatement();
    	  ResultSet rs = statement.executeQuery("select id, name, department from Student");
    			  
    	  
    	  %>
    	  
    	  	  <script>
    	  function idleLogout() {
    	      var t;
    	      window.onload = resetTimer;
    	      window.onmousemove = resetTimer;
    	      window.onmousedown = resetTimer;       
    	      window.ontouchstart = resetTimer;  
    	      window.onclick = resetTimer;     
    	      window.onkeydown = resetTimer;   
    	      window.addEventListener('scroll', resetTimer, true); 

    	      function logout() {
    	         	alert("Your session has timed out.");
    	          window.location.href = 'Login.html';
    	      }

    	      function resetTimer() {
    	          clearTimeout(t);
    	          t = setTimeout(logout, 100000); 
    	      }
    	  }
    	  idleLogout();
    	  </script>
    	  
    	  <%//Create new student button %>
    	  <p>
    	  	 <a href ="NewStudent.jsp"><button type ='newStudent'>New Student</button></a>
    	  	 <a href ="Marks.jsp"><button type ='marks'>Student Marks</button></a>
    	  </p>
    	  <%//Create table for students %>
    	  <table border="1">
    	  <tr>
    	  <th>Student ID</th>
    	  <th>Name</th>
    	  <th>Department</th>
    	  </tr>
    	  
    	  <%
    	  //get students data from database
    	  while(rs.next()) {  
    	   
    	  %>
    	  
    	  <tr>
    	  <td><%=rs.getString("id") %></td>
    	  <td><%=rs.getString("name") %></td>
    	  <td><%=rs.getString("department") %></td>
    	  <td><a href ="Edit.jsp?id=<%=rs.getString("id") %>"><button type = 'edit'>Edit</button></a>
    	      <a href ="Delete.jsp?id=<%= rs.getString("id") %>"><button type = 'delete'>Delete</button></a>
    	  </td>
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
    	 
      } else {
       %>
    	  <p>login failed</p>
    	  <%
    	  //out.println("login failed");
      }
    	  %>

     </p>
</body>
</html>
