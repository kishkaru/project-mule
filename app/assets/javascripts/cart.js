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
	});

	var setUpPayButton = function () {
		$('#payment-form').submit( function(e) {
			var pay_button = $('#pay-button');
			pay_button.attr('disabled', 'disabled');
			$.ajax({type: "POST",
				url: "/pay",
				data: $('#payment-form').serialize(),
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
	}

	$('#use-dif-cc').click( function() {
		$(this).attr('disabled', 'disabled');
		$('#spinner-cart-center').spin(opts);
		$.ajax({type: "GET",
			url: "/cart/change_credit_card",
			success: function(data) {
				$('#spinner-cart-center').spin(false)
				$('#user-credit-cards').html(data);
			}});
	})

	setUpPayButton();	
})
