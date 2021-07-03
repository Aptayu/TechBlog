<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href ="css/mystyle.css" rel="stylesheet" type = "text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<main class="d-flex align-items-center primary-background p-4 banner-background">

		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header align-center primary-background text-white text-center">
							<span class="fa-2x fa fa-user-circle"></span><h3>Register</h3>
						</div>
						<div class="card-body">
							<form id="reg-form" action="RegisterServlet" method="POST">
								<div class="form-group">
									<label for="userName">Username</label> 
									<input name="user_name" type="text" class="form-control" id="userName" aria-describedby="emailHelp" placeholder="Enter username">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> 
									<input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"> 
									<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> 
									<input name="user_password"  type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
								</div>
								<div class="form-group">
									<label for="gender">Select Gender</label> 
									<br>
									<input type="radio"  id="gender" placeholder="Password" name="gender" >Male
									<input type="radio"  id="gender" placeholder="Password" name="gender">Female
								</div>
								<div class="form-group">
									<textarea name ="about" class="form-control" rows ="4" placeholder="Introduce yourself..."></textarea>
								</div>
								<div class="form-check">
									<input name="check" type="checkbox" class="form-check-input" id="exampleCheck1"> <label class="form-check-label" for="exampleCheck1">Accept T & C</label>
								</div>
								<div class= "text-center" id="loader" style="display: none">
									<span class="fa fa-refresh fa-spin fa-3x"></span>
									<h3>Please wait..</h3>
								</div>
								
								<button id= "submit-btn" type="submit" class="btn btn-primary" style="margin-left:200px">Submit</button>
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
<!-- Sweet alert cdn  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
			$(document).ready(function(){
				console.log("loaded....")
				
				$('#reg-form').on('submit', function(event){
					event.preventDefault();
					$("#submit-btn").hide();
					$("#loader").show();
					let form = new FormData(this);
					
					/* sendform data to register servlet */
					$.ajax({
						url: "RegisterServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR){
							console.log(data)
							$("#submit-btn").show();
							$("#loader").hide();
							if(data.trim() === 'Done'){
								swal({
									  title: "Good job!",
									  text: "Registered Successfully!. Press OK to go to the Login Page",
									  icon: "success",
									})
										.then((value) => {
											window.location = "login_page.jsp"
										});
							}else{
								 	swal(data);
							} 
							
							
						},
						error: function(jqXHR, textStatus, errorThrown){
							$("#submit-btn").show();
							$("#loader").hide();
							swal("Something went wrong..try again");
						},
						processData: false,
						contentType: false
					});
				});
			});

	</script>
</body>
</html>