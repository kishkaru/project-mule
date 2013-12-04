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
//= require jquery_ujs
//= require_tree .

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    $(link).parent().after(content.replace(regex, new_id));
    $('#new-ingredient-fields').modal('show');
}


$(document).ready(function() {

	var opts = {
	  lines: 13, // The number of lines to draw
	  length: 10, // The length of each line
	  width: 5, // The line thickness
	  radius: 15, // The radius of the inner circle
	  corners: 1, // Corner roundness (0..1)
	  rotate: 0, // The rotation offset
	  direction: 1, // 1: clockwise, -1: counterclockwise
	  color: '#000', // #rgb or #rrggbb or array of colors
	  speed: 1, // Rounds per second
	  trail: 60, // Afterglow percentage
	  shadow: false, // Whether to render a shadow
	  hwaccel: false, // Whether to use hardware acceleration
	  className: 'spinner', // The CSS class to assign to the spinner
	  zIndex: 2e9, // The z-index (defaults to 2000000000)
	  top: 'auto', // Top position relative to parent in px
	  left: 'auto' // Left position relative to parent in px
	};
	var target = document.getElementById('spinner-cart-center');

	$("#cart_link").click( function () {
		$("#cart-modal-table").html("");
		var spinner = new Spinner(opts).spin(target);
		$.ajax({type: "GET",
			url: "/cart/",
			success: function(data) {
				spinner.spin();
				$("#cart-modal-table").html(data);
				bind_qty_buttons();
				bind_remove_buttons();
			}});
	});

	var bind_qty_buttons = function() {
		$("button.item-qty-buttons.plus").click(function() {
			var spinner = new Spinner(opts).spin(target);
			var row_id = this.parentNode.parentNode.id;
			$.ajax({type: "POST",
				url: "/add_item/" + row_id + "/",
				success: function(data) {
					spinner.spin();
					$("#cart-modal-table").html(data);
					bind_qty_buttons();
					bind_remove_buttons();
				}});
		});
		$("button.item-qty-buttons.minus").click(function() {
			var spinner = new Spinner(opts).spin(target);
			var row_id = this.parentNode.parentNode.id;
			$.ajax({type: "POST",
				url: "/minus_item/"  + row_id + "/",
				success: function(data) {
					spinner.spin();
					$("#cart-modal-table").html(data);
					bind_qty_buttons();
					bind_remove_buttons();
				}});
		});
	};

	var bind_remove_buttons = function() {
		$("button.item-remove-button").click(function() {
			var spinner = new Spinner(opts).spin(target);
			var row_id = this.parentNode.parentNode.id;
			$.ajax({type: "POST",
				url: "/remove_item/" + row_id + "/",
				success: function(data) {
					spinner.spin();
					$("#cart-modal-table").html(data);
					bind_remove_buttons();
					bind_qty_buttons();
				}});
		});
	};

	$('#checkout-btn').click( function() {
		$('#cart-modal-footer').attr('hidden', '');
		$('#cart-payment-info').removeAttr('hidden');
	});

	$('form#payment-form').submit( function(e) {
		$.ajax({type: "POST",
			url: "/order_summary",
			success: function(data) {
				$('#cart-and-payment').html(data);
			}});
		e.preventDefault();
	});

});

