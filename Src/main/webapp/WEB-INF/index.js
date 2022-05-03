var current_display_date = new Date;

function dateToDB (d) {
	// takes wire format yyyy-mm-dd transforms to dd/mm/yyyy for db
	var t = d.split('-');
	return t[2] + '/' + t[1] + '/' + t[0];
}

function dateFromDB (d) {
	// transform db date of dd/mm/yyyy to yyyy-mm-dd for display in input fields with date type
	var t = d.split('/');
	return t[2] + '-' + t[1] + '-' + t[0];
}

function buildItemsByDate( d) {

	$.ajax({
		data: {
			method: 'getFlexItemsDate',
			date_local: d
		},
		url: 'api',
		type: 'GET',
		success: function (jsdata) {

			var entries = JSON.parse(jsdata);
			console.log(entries);
			var tb = '';
			$(entries).each(function(index, val) {
				var element = val.properties;
				var number = element.hasOwnProperty('serial_number') ? element.serial_number : '';
				var startTime = element.hasOwnProperty('serial_time_start_local') ? element.serial_time_start_local : '';
				var endTime = element.hasOwnProperty('serial_time_end_local') ? element.serial_time_end_local : '';
				var startTimeZulu = element.hasOwnProperty('serial_time_start_zulu') ? element.serial_time_start_zulu : '';
				var endTimeZulu = element.hasOwnProperty('serial_time_end_zulu') ? element.serial_time_end_zulu : '';
				var title = element.hasOwnProperty('serial_title') ? element.serial_title : '';
				var location = element.hasOwnProperty('serial_location') ? element.serial_location : '';
				var edit_id = element.hasOwnProperty('id') ? element.id : '';
				var opi = element.hasOwnProperty('serial_opi') ? element.serial_opi : '';
				var participants = element.hasOwnProperty('serial_participants') ? element.serial_participants : '';
				var info = element.hasOwnProperty('serial_info') ? element.serial_info : '';

				var tr = `<td>${number}</td>
					<td>${startTime}-${endTime}<br>(${startTimeZulu}Z-${endTimeZulu}Z)</td>
					<td><b>${title}</b><br> OPI: ${opi} | Required: ${participants}</td>
					<td>${location}</td>
					<td>${info}</td>
					<td>
						<button type="button" class="btn btn-light" id="dropdownRightMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi-three-dots"></i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownRightMenuButton">
							<li><a class="dropdown-item" href="newFlexItem.jsp?edit_id=${edit_id}">Edit Item</a></li>
							<li><a class="dropdown-item" href="">Delete Item</a></li>
							<li><a class="dropdown-item disabled" href="#">Report Conflict</a></li>
						</ul>
					</td>`;
				tb = `${tb}<tr>${tr}</tr>`;

			});

			// render to the table
			$('#flex-data-table').html(tb);


		}
	});
}

function dateMath(startDate, daysOffset) {
	var sd = new Date(startDate);
	var offset = 1000 * 60 * 60 * 24 * daysOffset;
	var newTime = sd.getTime() + offset;

	sd.setTime(newTime);

	return sd;
}

function dateFormatter (d) {
	var dd = d.getDate();
	var m = d.getMonth();
	m = m + 1;
	var y = d.getFullYear();
	if (dd.length == 1) {
		dd = `0${dd}`;
	}
	if (m <= 9) {
		m = `0${m}`;
	}

	return `${dd}/${m}/${y}`;
}

function setDisplayDate () {
	$('#current-date-display').text(`Flex for ${current_display_date.toLocaleDateString()}`);
}

$(document).on('click', '#set-today-btn', function(e) {
	e.preventDefault();
	var t = new Date;
	current_display_date = t;
	var day = dateFormatter(t);
	buildItemsByDate(day);
	setDisplayDate();


})

$(document).on('click', '#back-day-btn', function(e) {
	e.preventDefault();
	var newDate = dateMath(current_display_date, -1);
	current_display_date = newDate;
	var day = dateFormatter(current_display_date);
	buildItemsByDate(day);
	setDisplayDate();

})

$(document).on('click', '#forward-day-btn', function(e) {
	e.preventDefault();
	var newDate = dateMath(current_display_date, 1);
	current_display_date = newDate;
	var day = dateFormatter(current_display_date);
	buildItemsByDate(day);
	setDisplayDate();

})

$(document).on('click', '#check-conflict-btn', function(e) {
	e.preventDefault();
	var day = dateFormatter(current_display_date);
	$.ajax({
		data: {
			method: 'checkConflictDate',
			date_local: day
		},
		url: 'api',
		type: 'GET',
		success: function (jsdata) {
			var entries = JSON.parse(jsdata);
			console.log(entries);
			if (entries.result == '0 conflicts') {
				// all good, no conflicts
				alert ("There are no conflicts for this day.");
			}
			else {
				// fill in the modal table and show it
				var m = new bootstrap.Modal(document.getElementById('staticConflictCheckLive'), {backdrop: true, focus: true, keyboard: false});
				var rRaw = entries.result.split(" ");
				var conflictCount = rRaw[0];
				$('#conflict-count').text(`There are ${conflictCount} conflict(s)`);
				// generate lisitng
				var tb = '';
				for (var i = 1; i <= conflictCount; i++) {
					tb = `${tb}<tr><td>${i}</td><td>${entries[i]}</td></tr>`;
				}


				//render listing
				$('#flex-conflict-query').html(tb)
				m.show();
			}
		}
	});

});

$(document).ready(function() {
	var d = current_display_date;
	var day = dateFormatter(d);
	buildItemsByDate(day);
	setDisplayDate();
});