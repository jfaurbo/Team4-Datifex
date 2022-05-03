var mode = 'new'; // default action
var edit_id = 0; // default, over-ridden if an edit is requested
var return_page = ''; // default blank, set if there is an edit requested

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

function saveNewItem () {
	$.ajax({
			data: {
				'method': 'createFlexItem',
				'serial_number': $('#serial_number').val(),
				'serial_title': $('#serial_title').val(),
				'serial_color': $('#serial_color').val(),
				'serial_date_start_local': dateToDB($('#serial_date_start_local').val()),
				'serial_date_end_local': dateToDB($('#serial_date_end_local').val()),
				'serial_date_start_zulu': dateToDB($('#serial_date_start_zulu').val()),
				'serial_date_end_zulu': dateToDB($('#serial_date_end_zulu').val()),
				'serial_time_start_local': $('#serial_time_start_local').val(),
				'serial_time_end_local': $('#serial_time_end_local').val(),
				'serial_time_start_zulu': $('#serial_time_start_zulu').val(),
				'serial_time_end_zulu': $('#serial_time_end_zulu').val(),
				'serial_opi_unit': $('#serial_opi_unit').val(),
				'serial_opi': $('#serial_opi').val(),
				'serial_participants': $('#serial_participants').val(),
				'serial_location': $('#serial_location').val(),
				'serial_info': $('#serial_info').val(),
				'serial_type': $('#serial_type').val(),
				'serial_status': $('#serial_status').val()
			},
			url: 'api',
			type: 'POST',
			success: function (jsdata) {
				console.log('successful api post');
				console.log(jsdata);
				alert('Event Saved. Now in Edit mode; or create New Event');
				mode = 'edit';
				$('#save-item-btn').text('Update Item');
				var rd = JSON.parse(jsdata).properties;
				var updateTS = rd.serial_modified_timestamp;
				$('#last-updated-feedback').text(`Last updated: ${updateTS}`);
				$('#new-item-btn').show();
			}
		});
}



function saveEdit () {
	$.ajax({
			data: {
				'method': 'updateFlexItem',
				'id': edit_id,
				'serial_number': $('#serial_number').val(),
				'serial_title': $('#serial_title').val(),
				'serial_color': $('#serial_color').val(),
				'serial_date_start_local': dateToDB($('#serial_date_start_local').val()),
				'serial_date_end_local': dateToDB($('#serial_date_end_local').val()),
				'serial_date_start_zulu': dateToDB($('#serial_date_start_zulu').val()),
				'serial_date_end_zulu': dateToDB($('#serial_date_end_zulu').val()),
				'serial_time_start_local': $('#serial_time_start_local').val(),
				'serial_time_end_local': $('#serial_time_end_local').val(),
				'serial_time_start_zulu': $('#serial_time_start_zulu').val(),
				'serial_time_end_zulu': $('#serial_time_end_zulu').val(),
				'serial_opi_unit': $('#serial_opi_unit').val(),
				'serial_opi': $('#serial_opi').val(),
				'serial_participants': $('#serial_participants').val(),
				'serial_location': $('#serial_location').val(),
				'serial_info': $('#serial_info').val(),
				'serial_type': $('#serial_type').val(),
				'serial_status': $('#serial_status').val()
			},
			url: 'api',
			type: 'POST',
			success: function (jsdata) {
				console.log('successful api post for an edit');
				console.log(jsdata);

				// trigger the redirect

			}
		});
}

function prepareEdit (item_id) {
	$.ajax({
		data: {
			'method': 'getOneFlexItem',
			'id': item_id
		},
		url: 'api',
		type: 'GET',
		success: function (jsdata) {
			var serial = JSON.parse(jsdata).properties;
			// populate the inputs
			// serial.hasOwnProperty('blah') ? : ''
			$('#serial_number').val(serial.hasOwnProperty('serial_number') ? serial.serial_number : '');
			$('#serial_title').val(serial.hasOwnProperty('serial_title') ? serial.serial_title : '');
			$('#serial_date_start_local').val(serial.hasOwnProperty('serial_date_start_local') ? dateFromDB(serial.serial_date_start_local) : '');
			$('#serial_date_end_local').val(serial.hasOwnProperty('serial_date_end_local') ? dateFromDB(serial.serial_date_end_local) : '');
			$('#serial_date_start_zulu').val(serial.hasOwnProperty('serial_date_start_zulu') ? dateFromDB(serial.serial_date_start_zulu) : '');
			$('#serial_date_end_zulu').val(serial.hasOwnProperty('serial_date_end_zulu') ? dateFromDB(serial.serial_date_end_zulu) : '');
			$('#serial_time_start_local').val(serial.hasOwnProperty('serial_time_start_local') ? serial.serial_time_start_local : '');
			$('#serial_time_end_local').val(serial.hasOwnProperty('serial_time_end_local') ? serial.serial_time_end_local : '');
			$('#serial_time_start_zulu').val(serial.hasOwnProperty('serial_time_start_zulu') ? serial.serial_time_start_zulu : '');
			$('#serial_time_end_zulu').val(serial.hasOwnProperty('serial_time_end_zulu') ? serial.serial_time_end_zulu : '');
			$('#serial_opi_unit').val(serial.hasOwnProperty('serial_opi_unit') ? serial.serial_opi_unit : '');
			$('#serial_opi').val(serial.hasOwnProperty('serial_opi') ? serial.serial_opi : '');
			$('#serial_participants').val(serial.hasOwnProperty('serial_participants') ? serial.serial_participants : '');
			$('#serial_location').val(serial.hasOwnProperty('serial_location') ? serial.serial_location : '');
			$('#serial_info').val(serial.hasOwnProperty('serial_info') ? serial.serial_info : '');

			// selects
			$('#serial_type').val(serial.hasOwnProperty('serial_type') ? serial.serial_type : '');
			$('#serial_color').val(serial.hasOwnProperty('serial_color') ? serial.serial_color : '');
			$('#serial_status').val(serial.hasOwnProperty('serial_status') ? serial.serial_status : '');

			console.log(serial);
			$('#save-item-btn').text('Update Item');
			var updateTS = serial.serial_modified_timestamp;
			$('#last-updated-feedback').text(`Last updated: ${updateTS}`);
		}
	});
}

$(document).on('click', '#save-item-btn', function(e) {
	e.preventDefault();
	if (mode == 'new') {
		saveNewItem();
	}
	if (mode == 'edit') {
		saveEdit();
	}
});

$(document).on('submit', '#new-flex-item-form', function(e) {
	e.preventDefault();
	if (mode == 'new') {
		saveNewItem();
	}
	if (mode == 'edit') {
		saveEdit();
	}
});

$(document).ready(function() {
	$('#new-item-btn').hide();

	if (window.location.search != '') {

		// only do this if there are search params
		var params = new URLSearchParams(window.location.search);
		edit_id = params.get('edit_id');
		if (edit_id != 0) {
			mode = 'edit';
			return_page = params.get('return');
			$('#db_id').val(edit_id);

			// grab this data from db and populate the fields
			prepareEdit(edit_id);
		}
	}

});