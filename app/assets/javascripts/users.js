$(document).ready(function() {
	//edit user page
	var delivery_area_collection = $('#delivery-area-collection-select');
	if ($('#user_role option:selected').html() == 'Server') {
        delivery_area_collection.show();
        delivery_area_collection.children('select').prop('required',true);
    };
    //new user page
    $('#user_role').change(function() {
        if ($('#user_role option:selected').html() == 'Server') {
            delivery_area_collection.show();
            delivery_area_collection.children('select').prop('required',true);
        } else {
            delivery_area_collection.hide();
            delivery_area_collection.children('select').prop('required',false);
        };
    });
});
