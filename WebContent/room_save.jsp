<!DOCTYPE html>


<html lang="en">


<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="js/clock.js"></script>


 <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">




<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Room Management</title>

</head>

<body>
<body onload="startTime()">



	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<h3>Save Rooms</h3>

				<div class="container">

					<!-- /#Type Body Here -->

					<form action="" method="post">
					
					
					
						<div class="row">
							<div class="col-75">
								
								<input type="text" name="" placeholder="Enter Room Number"
									required>
							</div>
						</div>

						<div class="row">

							<div class="col-75">
								
									
									<select name="Block_branch" required>
									<option value="" disabled selected>Select Room Type</option>
									
									<option></option>
									
									

								</select>
							</div>
						</div>


						<div class="row">

							<div class="col-75">
								<select name="Block_status" required>
									<option value="Active" selected>Select Block ID</option>
									
									<option></option>
									
								</select>
							</div>
						</div>

						<br>



						<div class="row">

							<input type="submit" value="Save Room" style='margin-right: 16px'>
						</div>



					</form>

				</div>

			</div>

		</div>

	</div>


	<!-- /#page-content-wrapper -->

	<jsp:include page="Footer.jsp"></jsp:include>




	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("active");
		});

		$(document).ready(function() {

			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});

		});

		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}

		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</script>



</body>

</html>
