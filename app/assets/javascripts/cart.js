$( function() {
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

	$("#cart_link").click( function () {
		$("#cart-modal-table").html("");
		$('#spinner-cart-center').spin(opts);
		$.ajax({type: "GET",
			url: "/cart/",
			success: function(data) {
				$('#spinner-cart-center').spin(false);
				$("#cart-modal-table").html(data);
				bind_qty_buttons();
				bind_remove_buttons();
			}});
	});

	var bind_qty_buttons = function() {
		$("button.item-qty-buttons.plus").click(function() {
			$('#spinner-cart-center').spin(opts);
			var row_id = this.parentNode.parentNode.id;
			$.ajax({type: "POST",
				url: "/add_item/" + row_id + "/",
				success: function(data) {
					$('#spinner-cart-center').spin(false);
					$("#cart-modal-table").html(data);
					bind_qty_buttons();
					bind_remove_buttons();
				}});
		});
		$("button.item-qty-buttons.minus").click(function() {
			$('#spinner-cart-center').spin(opts);
			var row_id = this.parentNode.parentNode.id;
			$.ajax({type: "POST",
				url: "/minus_item/"  + row_id + "/",
				success: function(data) {
					$('#spinner-cart-center').spin(false);
					$("#cart-modal-table").html(data);
					bind_qty_buttons();
					bind_remove_buttons();
				}});
		});
	};

	var bind_remove_buttons = function() {
		$("button.item-remove-button").click(function() {
			$('#spinner-cart-center').spin(opts);
			var row_id = this.parentNode.parentNode.id;
			$.ajax({type: "POST",
				url: "/remove_item/" + row_id + "/",
				success: function(data) {
					$('#spinner-cart-center').spin(false);
					$("#cart-modal-table").html(data);
					bind_remove_buttons();
					bind_qty_buttons();
				}});
		});
	};

	$('#checkout-btn').click( function() {
		$('#cart-modal-footer').attr('hidden', '');
		$('#cart-payment-info').fadeIn();
		$('#order-summary').fadeIn();
		$('#cart-summary').remove();
	});

	$('#cart').on("hidden.bs.modal", function() {
		$('#cart-modal-footer').removeAttr('hidden');
		$('#cart-payment-info').fadeOut();
		$('#use-dif-cc').removeAttr('disabled');
		$('#use-new-cc').removeAttr('disabled');
		$('#user-credit-cards').empty();
		$('#new-credit-card').hide();
	});

	var setUpPayButton = function () {
		var payment_form = $('#payment-form');
		payment_form.submit( function(e) {
			var pay_button = $('#pay-button');
			pay_button.attr('disabled', 'disabled');
			$.ajax({type: "POST",
				url: payment_form.attr('action'),
				data: payment_form.serialize(),
				success: function(data) {
					if (data == "success") {
						window.location = '/order_receipt';
					} else {
						$('#checkout-notices').html(data);
					}
					pay_button.removeAttr('disabled');
				},
				error: function(data) {
					pay_button.removeAttr('disabled');
				}});
			e.preventDefault();
		});
	};

	$('#use-dif-cc').click( function() {
		var user_credit_cards = $('#user-credit-cards');
		$('#new-credit-card').hide();
		$(this).attr('disabled', 'disabled');
		$('#use-new-cc').removeAttr('disabled');
		user_credit_cards.spin(opts);
		$.ajax({type: "GET",
			url: "/cart/change_credit_card",
			success: function(data) {
				user_credit_cards.spin(false);
				user_credit_cards.html(data);
				user_credit_cards.hide();
				user_credit_cards.fadeIn();
				setUpChangeCCForm();
			}});
	});

	$('#use-new-cc').click( function() {
		$(this).attr('disabled', 'disabled');
		$('#use-dif-cc').removeAttr('disabled');
		$('#new-credit-card').fadeIn();
		$('#user-credit-cards').empty();
	});

	var setUpChangeCCForm = function() {
		var change_cc_form = $('#change-cc-form');
		change_cc_form.submit( function(e) {
			$('#pay-button').attr('disabled', 'disabled');
			change_cc_form.spin();
			$.ajax({type: "POST",
				url: change_cc_form.attr('action'),
				data: change_cc_form.serialize(),
				success: function(data) {
					$('#user-credit-cards').empty();
					$('#use-dif-cc').removeAttr('disabled', 'disabled');
					$('#pay-button').attr('value', "Pay with card ending in " + data);
					change_cc_form.spin(false);
					$('#pay-button').removeAttr('disabled');
				}});
			e.preventDefault();
		});
	};

	var setUpNewCCForm = function() {
		var new_cc_form = $('#new-cc-form');
		new_cc_form.submit( function(e) {
			$('#pay-button').attr('disabled', 'disabled');
			new_cc_form.spin();
			$.ajax({type: "POST",
				url: new_cc_form.attr('action'),
				data: new_cc_form.serialize(),
				success: function(data) {
					var cc_last_four = /[0-9]{4}/
					if (data.match(cc_last_four)) {
						$('#new-credit-card').hide();
						$('#use-new-cc').removeAttr('disabled');
						$('#pay-button').attr('value', "Pay with card ending in " + data);
					} else {
						$('#new-credit-card-errors').html(data);
					}
					new_cc_form.spin(false);
					$('#pay-button').removeAttr('disabled');
				}});
			e.preventDefault();
		});
	};

	setUpPayButton();
	setUpNewCCForm();
})
