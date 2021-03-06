<!DOCTYPE html>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
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

<title>Update User</title>

 <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">



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


				<div class="container">

					<%
						String Updated = (String) session.getAttribute("updated_message");
						String Updated_Failed = (String) session.getAttribute("update_failed_message");
						String Deactivated = (String) session.getAttribute("Deactivate_Message");
						String Deactivated_Failed = (String) session.getAttribute("Deactivate_Failed");
						String Activated = (String) session.getAttribute("Activate_Message");
						String Activated_Failed = (String) session.getAttribute("Activate_Failed");

						if (null != Updated) {
					%>
					<div class="alert alert-success" role="alert">User Updated
						Successfully..</div>
					<%
						} else if (null != Updated_Failed) {
					%>
					<div class="alert alert-danger" role="alert">Cannot Update
						the user..</div>
					<%
						} else if (null != Deactivated) {
					%>
					<div class="alert alert-success" role="alert">Deactivated
						successfully..</div>
					<%
						} else if (null != Deactivated_Failed) {
					%>
					<div class="alert alert-success" role="alert">Deactivate
						Failed..</div>
					<%
						} else if (null != Activated) {
					%>
					<div class="alert alert-success" role="alert">Activated
						successfully..</div>
					<%
						} else if (null != Activated_Failed) {
					%>
					<div class="alert alert-success" role="alert">Activate
						Failed..</div>
					<%
						}
					%>
						
						

					<div class="container" style='margin-left: 20%'>
						<form action="user_update.jsp" method="post">
						
						
							<br> <br> <br>
							<table>
								<tr>
									<td><font color="#111111"></font></td>
									<td><input type="text" name="name"
										placeholder="Enter Employee Number.." required /></td>
									<td><input type="submit" value="Search user"
										style='margin-left: 10px' /></td>
							</table>
						</form>

						<br />
					</div>



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
        function noBack()
        {
            window.history.forward();
        }
        
        window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 2000);
	</script>



</body>

</html>
