<!DOCTYPE html>
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

<title>Role View</title>

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

					<!-- /#Type Body Here -->
					
					<%
						String Deleted = (String) session.getAttribute("roleDeleteMessage");
						String Delete_Failed = (String) session.getAttribute("roleDeleteFailed");
						String Edited = (String) session.getAttribute("roleEditMessage");
						String Edited_Failed = (String) session.getAttribute("roleEditFailed");
						String Saved = (String) session.getAttribute("roleSaveMessage");
						String Saved_Faild = (String) session.getAttribute("roleSaveFailed");

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
						} else if (null != Saved_Faild) {
					%>
					<div class="alert alert-danger" role="alert">Save Failed..!</div>
					<%
						}
					%>
					
					

					<h3>View Roles</h3>

					<a href='User_role_managent.jsp'>Add New Role</a> <br>

					<%
						List<Role> list = RoleDao.getAllRoles();
					%>

					<br>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Role</th>
								<th scope="col">Role Description</th>
								<th scope="col">Edit</th>
								<th scope="col">Delete</th>

							</tr>
						</thead>
						<tbody>

							<%
								for (Role e : list) {
							%>
							<tr>



								<td><%=e.getId()%></td>
								<td><%=e.getRole()%></td>
								<td><%=e.getRoleDesc()%></td>


								<td><a href='R_Edit.jsp?id=<%=e.getId()%>'> edit <img
										src="images/edit.png" alt="" border=3 height=15 width=15
										style="float: center; margin-right: 0.5em"></a></td>


								<td><a href="DeleteServlet?id=<%=e.getId()%>"> delete <img
										src="images/delete.png" alt="" border=3 height=17 width=17
										style="float: center; margin-right: 0.5em"></a>
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
