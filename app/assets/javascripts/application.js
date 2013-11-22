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

	var get_quantity = function(row_id) {
		return $("#" + row_id).children(".qty");
	};

	var get_quantity_value = function(quantity) {
		return Number(quantity.html());
	};

	var get_price_object = function(row_id) {
		return $("#" + row_id).children(".price");
	};

	var get_price_value = function(price_object) {
		return Number(price_object.html());
	};

	var get_subtotal = function() {
		return $('#subtotal');
	};

	var get_tax_total = function() {
		return $('#tax-total');
	};

	var get_total = function() {
		return $('#total');
	}

	var update_quantity = function(row_id, current_quantity, symbol) {
		var quantity = get_quantity(row_id);
		if (symbol == 'plus qty-buttons') {
			var new_quantity_value = current_quantity + 1;
		} else {
			var new_quantity_value = current_quantity - 1;
		}
		quantity.html(new_quantity_value);
	};

	var update_subtotal = function(price_value, symbol) {
		var subtotal = get_subtotal();
		var subtotal_value = Number(subtotal.html());
		if (symbol == 'plus qty-buttons') {
			subtotal.html(subtotal_value + price_value);
		} else {
			subtotal.html(subtotal_value - price_value);
		}
	};

	var update_tax = function() {
		var tax_pct_str = $("#tax-pct").html();
		tax_pct_str = tax_pct_str.substring(0, tax_pct_str.length - 1);
		var tax_pct_value = Number(tax_pct_str);
		var new_tax_total = tax_pct_value * Number(get_subtotal().html()) / 100.0;
		get_tax_total().html(new_tax_total);
	};

	var update_total = function() {
		get_total().html(Number(get_subtotal().html()) + Number(get_tax_total().html()));
	};

	$("#cart_link").click( function () {
		$.ajax({type: "GET",
			url: "/cart/",
			success: function(data) {
				$("#cart-modal-body").html(data);
				$("button.qty-buttons").click(function() {
					//if plus or minus
					var row_id = this.parentNode.parentNode.id;
					var current_quantity = get_quantity_value(get_quantity(row_id));
					var price_value = get_price_value(get_price_object(row_id));
					var symbol = this.className;
					update_quantity(row_id, current_quantity, symbol);
					update_subtotal(price_value, symbol);
					update_tax();
					update_total();
				});
			}});
	});
});