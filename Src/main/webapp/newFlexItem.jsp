<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge;" />
  <title>New Flex Item</title>
  <link rel="icon" href="favicon.png">
  
  <!-- Bootstrap core CSS -->
  <link href="../CSS-assets/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Bootstrap Font Icon CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  

  <script>
    function goBack() {
      window.history.back()
    }
  </script>

</head>
<body>
  
  <!-- Nav Bar -->
  <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" href="index.jsp"><b>Flex App - HMCS TORONTO</b></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarsExample04">
        <ul class="navbar-nav ms-auto mb-2 mb-md-0">
          <li class="nav-item dropdown">
            <a class="nav-link " href="#" id="dropdown04" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi-gear-fill"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdown04">
              <li><a class="dropdown-item text-end disabled" href="#">Option 1</a></li>
              <li><a class="dropdown-item text-end disabled" href="#">Option 2</a></li>
              <li><a class="dropdown-item text-end disabled" href="#">Option 3</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!--Back Button-->
  <div class="container">
    <div class="position-relative">
      <div class="position-absolute top-0 start-0">
        <button class="btn btn-dark my-3" onclick="goBack()"><i class="bi-arrow-left"></i>Back</button>
      </div>
    </div>
  </div>
  

  <!-- Title -->
  <div class="container">
       <h2 class="my-3 text-center">Edit Flex Item</h2>
  </div>
  
  <!-- Item Input Form -->
  <div class="container">
    
    <form>
      
      
      <!--flex item Meta Data-->
      <div class="row align-items-center mb-3">
        
        <div class="col-auto">
          <label for="inputSerialStatus" class="form-label">Status</label>
          <select type="text" class="form-select" id="serial_status">
            <option value="status_draft">Draft</option>
            <option value="status_approved">Approved</option>
            <option value="status_cancelled">Cancelled</option>
          </select>
        </div>
        
        <div class="col-auto">
          <label for="inputSerialColor" class="form-label">Class</label>
          <select type="text" class="form-select" id="serial_color">
            <option value="color_black">Black</option>
            <option value="color_red">Red</option>
          </select> 
        </div>
        
        <div class="col-auto">
          <label for="inputSerialNumber" class="form-label">Serial Number</label>
          <input type="text" class="form-control" id="serial_number" placeholder="Enter serial number"> 
        </div>
        
      </div>
      
      <!--Serial Title-->
      <div class="mb-3">
        <label for="inputSerialTitle" class="form-label">Serial Title</label>
        <input type="text" class="form-control" id="serial_title" placeholder="Enter serial title">
      </div>
      
      <!--OPI and Serial Type-->
      <div class="row align-items-center mb-3">
        <div class="col-auto">
          <label for="inputSerialOPI" class="form-label">Serial OPI</label>
          <input type="text" class="form-control" id="serial_opi" placeholder="Enter serial OPI">
        </div>
        
        <div class="col-auto">
          <label for="inputSerialType" class="form-label">Serial Type</label>
          <select type="text" id="serial_type" class="form-select">
            <option value="all_ship">All Ship</option>
            <option value="all_watch">All Watch</option>
            <option value="dept">Departmental</option>
            <option value="dept_maintenance">Departmental Maintenance</option>
            <option value="air_ops">Air Operations</option>
          </select>
        </div>
      </div>
      
      <!--Participants-->
      <div class="mb-3">
        <label for="inputSerialParticipants" class="form-label">Serial Participants</label>
        <input type="text" class="form-control" id="serial_participants" placeholder="Enter serial participants separated by commas">
      </div>
      
      <!--Time Local-->
      <div class="row align-items-center mb-3">
        <div class="col-auto">
          <label for="inputSerialStartDateLocal" class="form-label">Serial Start Date Local</label>
          <input type="date" class="form-control" id="serial_date_start_local" value="2022-04-26" min="2022-04-26">
        </div>
        
        <div class="col-auto">
          <label for="inputSerialStartTimeLocal" class="form-label">Serial Start Time Local</label>
          <input type="time" class="form-control" id="serial_time_start_local">
        </div>
        
        <div class="col-auto">
          <label for="inputSerialEndDateLocal" class="form-label">Serial End Date Local</label>
          <input type="date" class="form-control" id="serial_date_end_local" value="2022-04-26" min="2022-04-26">
        </div>
        
        <div class="col-auto">
          <label for="inputSerialEndTimeLocal" class="form-label">Serial End Time Local</label>
          <input type="time" class="form-control" id="serial_time_end_local">
        </div>
      </div>
      
      <!--Time Zulu-->
      <div class="row align-items-center mb-3">
        <div class="col-auto">
          <label for="inputSerialStartDateZulu" class="form-label">Serial Start Date Zulu</label>
          <input type="date" class="form-control" id="serial_date_start_zulu" value="2022-04-26" min="2022-04-26">
        </div>
        
        <div class="col-auto">
          <label for="inputSerialStartTimeZulu" class="form-label">Serial Start Time Zulu</label>
          <input type="time" class="form-control" id="serial_time_start_zulu">
        </div>
        
        <div class="col-auto">
          <label for="inputSerialEndDateZulu" class="form-label">Serial End Date Zulu</label>
          <input type="date" class="form-control" id="serial_date_end_zulu" value="2022-04-26" min="2022-04-26">
        </div>
        
        <div class="col-auto">
          <label for="inputSerialEndTimeZulu" class="form-label">Serial End Time Zulu</label>
          <input type="time" class="form-control" id="serial_time_end_zulu">
        </div>
      </div>
      
      
      <!--Location and Addition Info-->
      <div class="mb-3">
        <label for="inputSerialLocation" class="form-label">Serial Location</label>
        <input type="text" class="form-control" id="serial_location" placeholder="Enter serial location">
      </div>
      
      <div class="mb-3">
        <label for="inputSerialInfo" class="form-label">Addition Serial Info</label>
        <input type="text" class="form-control" id="serial_info" placeholder="Enter serial info">
      </div>
      
      <button type="button" class="btn btn-dark my-3" id="save-item-btn">Save Flex Item</button>
      
      <a href="newFlexItem.jsp"><button type="button" class="btn btn-dark my-3" id="new-item-btn">Create New Flex Item</button></a>
      <p id="last-updated-feedback"></p>
    </form>
    
  </div>
  
	
	
	
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
	<!--Required Bootstrap Script for CSS-->
	<script src="CSS-assets/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="flexItem.js"></script>
	
</body>
</html>
