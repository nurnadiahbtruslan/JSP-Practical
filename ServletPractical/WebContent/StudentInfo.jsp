<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>
</head>
<body>
<center>
<form action="StudentInfoProcess" method = "GET">  

    <label for="id">Student ID: </label>
	<input id="id" type="text" name="ID" value="">
	<br/>
	<br/>
	<label for="password">Password: </label>
	<input id="password" type="password" name="password" value="">
	<br/>
	<br/>
	<input type="submit" value="Login">
	<br/>
	<br/>

</center>
</body>
</html>