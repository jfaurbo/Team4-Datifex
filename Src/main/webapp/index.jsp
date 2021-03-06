<%@ page import="java.io.*,java.util.*, jakarta.servlet.*"
language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title>Flex App</title>
	<link rel="icon" href="favicon.png">
	
	<!-- Bootstrap core CSS -->
	<link href="CSS-assets/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Bootstrap Font Icon CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#"><b>Flex App - HMCS TORONTO</b></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarsExample04">
				<ul class="navbar-nav ms-auto mb-2 mb-md-0">
					<li class="nav-item">
						<a class="nav-link" href="newFlexItem.jsp"><i class="bi-plus-square"></i> New Flex Item</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link " href="#" id="dropdown04" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi-gear-fill"></i></a>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdown04">
							<li><a class="dropdown-item text-end disabled" href="#">Print Flex</a></li>
							<li><a class="dropdown-item text-end disabled" href="#">Set Zulu Time</a></li>
							<li><a class="dropdown-item text-end disabled" href="#">Change unit name</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	
	<br>
	<div class="container" align="center">
		
		
		<div id="flex_date_title">
			<h2 id="current-date-display">Flex for Monday 25 April 2022</h2>
		</div>

		<div class="d-flex justify-content-between align-items-center">
			<div class="p-2" id="last_update">
				<b>Generated: </b>
				<%
				Date date = new Date();
				out.print(date.toString() + "");
				%>
			</div>
			<div class="d-flex" id="flex-nav">
				<div class="p-1"><button type="button" class="btn btn-dark" id="set-today-btn"><i class="bi-calendar3-event"></i> Today</button></div>
				<div class="p-1"><button type="button" class="btn btn-dark" id="back-day-btn"><i class="bi-arrow-left-square-fill"></i></button></div>
				<div class="p-1"><button type="button" class="btn btn-dark"><i class="bi-calendar3"></i></button></div>
				<div class="p-1"><button type="button" class="btn btn-dark" id="forward-day-btn"><i class="bi-arrow-right-square-fill"></i></button></div>
				<div class="p-1"><button type="button" class="btn btn-dark disabled"><i class="bi-filter"></i>Filter</button></div>
				<div class="p-1 table_option_button">
					
					<button type="button" class="btn btn-dark" id="dropdownRightMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi-three-dots-vertical"></i>
					</button>
					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownRightMenuButton">
						<li><Button class="btn btn-link dropdown-item" id="check-conflict-btn">Check for Conflicts</button></li>
						<li><a class="dropdown-item disabled" href="#">Print view</a></li>
						<li><a class="dropdown-item disabled" href="#">Save Filter</a></li>
					</ul>
					
				</div>
			</div>
		</div>
		
		
		
		<div class="table-responsive">
			<table class="table table-striped">
				<thead class="table-dark">
					<tr>
						<th width="70">Serial ID</th>
						<th width="120">Timing</th>
						<th width="350">Serial</th>
						<th width="100">Location</th>
						<th width="400">Added Information</th>
						<th width="50"></th>
					</tr>
				</thead>
				<tbody id="flex-data-table"></tbody>

			</table>
			
		</div>
		
		
		
	</div>	
	
	<!--Check Conflicts Modal-->
	<div class="modal fade" id="staticConflictCheckLive" tabindex="-1" aria-labelledby="staticConflictCheckLiveLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticConflictCheckLiveLabel">Conflict Check</h5>
					<button type="button" class="btn-close close-conflict-modal" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p id="conflict-count">There are [input].</p>
					<div class="table-responsive p-1">
						<table class="table table-striped">
							<thead class="table-dark">
								<tr>
									<th width="50">ID#</th>
									<th width="200">Conflict Details</th>
								</tr>
							</thead>
							<tbody id="flex-conflict-query"></tbody>
						</table>
						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary close-conflict-modal" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

		<!--Required Bootstrap Script for CSS-->
	  <script src="https://code.jquery.com/jquery-3.6.0.js"
	  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	  crossorigin="anonymous"></script>

	  <!--Required Bootstrap Script for CSS-->
	  <script src="CSS-assets/dist/js/bootstrap.bundle.min.js"></script>

	  <script src="index.js"></script>
		
	</body>
	</html>
	
