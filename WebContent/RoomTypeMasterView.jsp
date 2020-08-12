<!DOCTYPE html>
<%@page import="RoomTypeMaster.roomTypeDAO"%>
<%@page import="RoomTypeMaster.Room_type"%>
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

<title>Room Type Master View</title>

</head>

<body onload="startTime()">



	<div class="d-flex" id="sidebar-wrapper">

		<!-- Side-bar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#side-bar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>


				<div class="container">

					<!-- /#Type Body Here -->
					
					<%
						String Deleted = (String) session.getAttribute("delete_succeed_Message");
						String Delete_Failed = (String) session.getAttribute("delete_failed_Message");
						String Edited = (String) session.getAttribute("edit_succeed_Message");
						String Edited_Failed = (String) session.getAttribute("edit_failed_Message");
						String Saved = (String) session.getAttribute("save_succeed_Message");
						String Saved_Failed = (String) session.getAttribute("save_failed_Message");

						if (null != Deleted) {
					%>
					<div class="alert alert-success" role="alert">Deleted
						Successfully..!</div>
					<%
						} else if (null != Delete_Failed) {
					%>
					<div class="alert alert-danger" role="alert">Delete Failed..!</div>

					<%
						} else if (null != Edited) {
					%>
					<div class="alert alert-success" role="alert">Edited
						Successfully..!</div>
					<%
						} else if (null != Edited_Failed) {
					%>
					<div class="alert alert-danger" role="alert">Edit Failed..!</div>
					<%
						} else if (null != Saved) {
					%>
					<div class="alert alert-success" role="alert">Saved
						Successfully..!</div>
					<%
						} else if (null != Saved_Failed) {
					%>
					<div class="alert alert-danger" role="alert">Save Failed..!</div>
					<%
						}
					%>


					<a href='RoomType_Save.jsp'>Add New Room Type</a> <br>

					<%
						List<Room_type> list = roomTypeDAO.getAllRoomType();
					%>

					<br>
					<table class="table">
						<thead class="thead-dark">
							<tr>

								<th scope="col">Room Type</th>
							
								<th scope="col">Edit</th>
								<th scope="col">Delete</th>

							</tr>
						</thead>
						<tbody>

							<%
								for (Room_type e : list) {
									
							%>
							<tr>

								<td><%=e.getRoom_Type()%></td>


								<td><a href='RoomTypeMasterEdit.jsp?id=<%=e.getId()%>'> edit <img
										src="images/edt.png" alt="" border=3 height=23 width=23
										style="float: center; margin-right: 0.5em"></a></td>


								<td><a href="RoomType_deleteServlet?id=<%=e.getId()%>">
										delete <img src="images/dlt.png" alt="" border=3 height=23
										width=23 style="float: center; margin-right: 0.5em">
								</a>
								<td>
							</tr>
							<tr>

								<%
									}
								%>
							
						</tbody>
					</table>

				</div>





			</div>



		</div>



	</div>


	<!-- /#page-content-wrapper -->

	<footer class="footer"
		style="background-color: #464646; z-index: 150; position: relative; margin-left: -15px; height: 40px; width: 103%;">
		<div class="container-fluid">

			<ul class="navbar-nav ml-auto mt-2 mt-lg-0">

				<li class="nav-link" style="text-color: #fff; text-align: center"><font
					color="#fffff">Developed By BOC IT Unit</font></li>
			</ul>

		</div>
	</footer>




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
		
		window.setTimeout(function() {
		    $(".alert").fadeTo(500, 0).slideUp(500, function(){
		        $(this).remove(); 
		    });
		}, 2000);
		
		
	</script>



</body>

</html>