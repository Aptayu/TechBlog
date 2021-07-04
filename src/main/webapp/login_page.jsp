<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Message"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href ="css/mystyle.css" rel="stylesheet" type = "text/css"/>
</head>
<body>
	<%@ include file="normal_navbar.jsp" %>
	<main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header align-center primary-background text-white text-center">
						<span class="fa fa-user-plus fa-3x"></span>
							<h2>Login here</h2>

						</div>
						<%
							/* One way to give the message on the login page itself but it's better
							if we make a proper of message so we can use it*/
							/* User user = (User)session.getAttribute("currentUser");
							if(user == null){
								out.print("<h3>Invalid credentials</h3>"); 
							} */
							Message m = (Message) session.getAttribute("msg");
                            if (m != null) {
                        %>
                        <div class="alert <%= m.getCssClass() %>" role="alert">
                            <%= m.getContent() %>
                        </div> 


                        <%        
                                session.removeAttribute("msg");
                            }
						%>
						
						<div class="card-body">
							<form action=  "LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label>
									<input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required> 
									<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label>
									<input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
								
							</form>
						</div>

					</div>

				</div>
			</div>

		</div>

	</main>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- <script src = "js/myjs.js" type= "text/javascript"></script> -->
</body>
</html>