// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
	$("button").click(function() {
		//if plus or minus
		var row_id = this.parentNode.parentNode.id;
		var current_quantity = get_quantity_value(get_quantity(row_id));
		var current_price_value = get_price_value(get_price_object(row_id), current_quantity);
		//var symbol = this.className;
		//alert(symbol);
		alter_quantity(row_id, current_quantity);
		var new_quantity = get_quantity_value(get_quantity(row_id));
		alter_price(row_id, current_price_value, new_quantity);
	});

	var get_quantity = function(row_id) {
		return $("#" + row_id).children(".qty");
	};

	var get_quantity_value = function(quantity) {
		return Number(quantity.html());
	};

	var get_price_object = function(row_id) {
		return $("#" + row_id).children(".price");
	};

	var get_price_value = function(price_object, quantity) {
		return Number(price_object.html()) / quantity;
	}

	var alter_quantity = function(row_id, current_quantity) {
		var quantity = get_quantity(row_id);
		//if symbol == 'plus':
		var new_quantity_value = current_quantity + 1;
		//else:
		//	var new_quantity_value = current_quantity - 1;
		quantity.html(new_quantity_value);
	};

	var alter_price = function(row_id, current_price_value, quantity_value) {
		var price = get_price_object(row_id);
		var new_price_value = current_price_value * (quantity_value + 1);
		price.html(new_price_value);
	};
});