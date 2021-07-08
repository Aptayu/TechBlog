<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.User" %>   
<%@page errorPage="error_page.jsp" %>  
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%> 

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
<title>Profile page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href ="css/mystyle.css" rel="stylesheet" type = "text/css"/>
</head>
<body>
	<%--  <%= user.getUser_name() %>
	 <br>
	 <%= user.getEmail() %>
	 <br> --%>
            <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-angellist"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> LearnCode <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="	fa fa-address-card-o"></span> Contact</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-edit"></span> Do Post</a>
                    </li>



                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= user.getUser_name()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Logout"> <span class="fa fa-user-plus "></span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>



        <!--end of navbar-->
        <!--Profile update -->
        <!-- Button trigger modal -->


<!-- Modal -->
<!-- Modal -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Hi! <%= user.getUser_name() %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <!--Profile Details  -->
          <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getReg_date().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
        <!--Edit profile  -->
        <div id="profile-edit" style="display: none">
        	<h3>Please edit carefully</h3>
        	<form action="EditServlet" method="POST">
							<table class="table">
								<tr>
									<td>ID:</td>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<td>Email :</td>
									<td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<td>Name :</td>
									<td><input type="text" class="form-control" name="user_name" value="<%=user.getUser_name()%>"></td>
								</tr>
								<tr>
									<td>Password :</td>
									<td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
								</tr>
								<tr>
									<td>Gender :</td>
									<td><%=user.getGender()%></td>
								</tr>
								<tr>
									<td>About :</td>
									<td><textarea rows="3" class="form-control" name="user_about"><%=user.getAbout()%>
                                                </textarea></td>
								</tr>

							</table>
								<div class="container text-center">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

								

						</form>
        	
        </div>
        
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button  id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

	<!-- End of Profile -->
    
    <!--Do post  -->
    <!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">What's in your mind</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
									PostDao postd = new PostDao(ConnectionProvider.getCon());
									ArrayList<Categories> list = postd.getAllCategories();
									for(Categories c: list){
								%>
									<option value="<%= c.getCid()%>"><%= c.getName()%></option>
								<%
									}
								
								%>
							
							</select>
						
						
						</div>
					
					
						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post Title" class="form-control" />
						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select your pic..</label> <br> 
							<input type="file" name="pic">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>


					</form>
				</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    
    
    
    
    <!--End post  -->  
        
        
        
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script>
			$(document).ready(function(){
				let editStatus = false;
				$('#edit-profile-button').click(function(){
					/* alert("button clicked") */
					
					if(editStatus == false){
						$('#profile-details').hide();
						$('#profile-edit').show();
						editStatus = true;
						$(this).text("Back");
					}
					else{
						$('#profile-edit').hide();
						$('#profile-details').show();
						
					}
					
				})
			});
		
		</script>
		<!--add post js  -->
		<script>
				$(document).ready(function(e){
					$('#add-post-form').on('submit', function(event){
						event.preventDefault();
						console.log("you have clicked submit..")
						let form = new FormData(this);
						
						/* requesting to server */
						$.ajax({
							 	url: "AddPostServlet",
		                        type: 'POST',
		                        data: form,
		                        success: function (data, textStatus, jqXHR) {
		                            //success ..
		                            console.log(data);
		                            if (data.trim() == 'done')
		                            {
		                                swal("Good job!", "saved successfully", "success");
		                            } else
		                            {
		                                swal("Error!!", "Something went wrong try again...", "error");
		                            }
		                        },
		                        error: function (jqXHR, textStatus, errorThrown) {
		                            //error..
		                            swal("Error!!", "Something went wrong try again...", "error");
		                        },
		                        processData: false,
		                        contentType: false
		                        
						})
						
					})
					
					
					
				})
		
		
		</script>
				
		
</body>
</html>