<!DOCTYPE html>
<%@page import="connections.DBConnection"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="Roles.RoleDao"%>
<%@page import="Roles.Role"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Branches.Branch"%>


<html lang="en">

<%
	ResultSet resultset = null;
	ResultSet rs = null;
%>

	<%
		//Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		try {
			
			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);

			Statement statement = con.createStatement();
			Statement st = con.createStatement();

			resultset = statement.executeQuery("select * from role");
			rs = st.executeQuery("select * from branches");
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	

<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="js/clock.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Room type Management</title>

</head>

<body onload="startTime()">



	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<h3>Add New Room Type</h3>

				<div class="container">

					<!-- /#Type Body Here -->

					<form action="RoomType_saveServlet" method="post">
					
					

						<div class="row">

							<div class="col-75">
								<input type="text" name="room_type_name" placeholder="Enter Room Type name.."
									required>
							</div>
						</div>


						
						<br>



						<div class="row">

							<input type="submit" value="Save room type" style='margin-right: 16px'>
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
