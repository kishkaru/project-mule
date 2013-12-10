$(document).ready(function() {
	//edit user page
	var delivery_area_collection = $('#delivery-area-collection-select');
	if ($('#user_role option:selected').html() == 'Server') {
		delivery_area_collection.show();
	};
	//new user page
	$('#user_role').change(function() {
		if ($('#user_role option:selected').html() == 'Server') {
			delivery_area_collection.show();
		} else {
			delivery_area_collection.hide();
		};
	});
});