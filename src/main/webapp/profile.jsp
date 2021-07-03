<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.User" %>   
<%@page errorPage="error_page.jsp" %>   

<%
		User user = (User)session.getAttribute("currentUser");
		if(user == null){
			response.sendRedirect("login.jsp");
			
		}
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 <%= user.getUser_name() %>
	 <br>
	 <%= user.getEmail() %>
	 <br>
	 

</body>
</html>