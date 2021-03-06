<!DOCTYPE html>
<%@page import="RoomTypeMaster.roomTypeDAO"%>
<%@page import="RoomTypeMaster.Room_type"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="block_Register.block"%>
<%@page import="connections.DBConnection"%>
<%@page import="RoomManagement.RoomDao"%>
<%@page import="RoomReservation.RoomDAO"%>
<%@page import="RoomManagement.Room"%>
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html lang="en">


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

<title>Room View</title>

</head>

<body>
<body onload="startTime()">

	<div class="d-flex" id="sidebar-wrapper">

		<!-- Side-bar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#side-bar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<h3>Rooms</h3>

				<div class="container">

					<!-- /#Type Body Here -->
					
					<%
						String Deleted = (String) session.getAttribute("RMDeleteMessage");
						String Delete_Failed = (String) session.getAttribute("RMDeleteFailed");
						String Edited = (String) session.getAttribute("RMEditMessage");
						String Edited_Failed = (String) session.getAttribute("RMEditFailed");
						String Saved = (String) session.getAttribute("RMSaveMessage");
						String Saved_Failed = (String) session.getAttribute("RMSaveFailed");

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


					<a href='room_save.jsp'>Add New room</a> <br>
					<%
						List<Room> list = RoomDao.getAllRooms();
					%>

					<br>
					<table class="table">
						<thead class="thead-dark">
							<tr>

								<th scope="col">Room Number</th>
								<th scope="col">Room Type</th>
								<th scope="col">Block Name</th>
								<th scope="col">Edit</th>
								<th scope="col">Delete</th>

							</tr>
						</thead>
						<tbody>

							<%
								for (Room e : list) {
									block b = blockDAO.getBlockByIdForRooms(e.getBlockID());
									Room_type r = roomTypeDAO.getRoomTypeById(e.getRoomType());
							%>

							<tr>


								<td><%=e.getRoomNo()%></td>
								<td><%=r.getRoom_Type()%></td>
								<td><%=b.getBlock_name()%></td>



								<td><a href='room_edit.jsp?id=<%=e.getId()%>'> edit <img
										src="images/edt.png" alt="" border=3 height=15 width=15
										style="float: center; margin-right: 0.5em"></a></td>


								<td><a href="RoomDelete?id=<%=e.getId()%>"> delete <img
										src="images/dlt.png" alt="" border=3 height=17 width=17
										style="float: center; margin-right: 0.5em"></a>
								<td>
							</tr>
							
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
		
		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 2000);
	</script>



</body>

</html>