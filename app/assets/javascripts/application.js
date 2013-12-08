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

$(window).resize( function() {
	$('body').css('padding-top', $('.container').height());
});

$(document).ready( function() {
	$.backstretch([
		'https://dl.dropboxusercontent.com/sh/qz66j1s91ael6z5/AtgWWlEXUT/southpaw.jpg?token_hash=AAEp5tYrEFxJV0mLEoYb1I61RkPdEcPLMzl7M065WBMQ-A',
		'https://dl.dropboxusercontent.com/sh/qz66j1s91ael6z5/R5TpmLfBVq/gck-chicken-bowl.jpeg?token_hash=AAEp5tYrEFxJV0mLEoYb1I61RkPdEcPLMzl7M065WBMQ-A',
		'https://dl.dropboxusercontent.com/sh/qz66j1s91ael6z5/iwURrl1yZZ/jablows-signature_pastrami_sandwich.jpg?token_hash=AAEp5tYrEFxJV0mLEoYb1I61RkPdEcPLMzl7M065WBMQ-A',
		'https://dl.dropboxusercontent.com/sh/qz66j1s91ael6z5/nmfVUugfOu/IMG_0223.jpg?token_hash=AAEp5tYrEFxJV0mLEoYb1I61RkPdEcPLMzl7M065WBMQ-A',
		'https://dl.dropboxusercontent.com/sh/qz66j1s91ael6z5/_ir1_g0wyS/IMG_0360.jpg?token_hash=AAEp5tYrEFxJV0mLEoYb1I61RkPdEcPLMzl7M065WBMQ-A',
		'https://dl.dropboxusercontent.com/sh/qz66j1s91ael6z5/JkDT1ISGyS/haparamen.jpg?token_hash=AAEp5tYrEFxJV0mLEoYb1I61RkPdEcPLMzl7M065WBMQ-A',
		'https://dl.dropboxusercontent.com/sh/qz66j1s91ael6z5/dTw6HYGFZt/IMG_0172.jpg?token_hash=AAEp5tYrEFxJV0mLEoYb1I61RkPdEcPLMzl7M065WBMQ-A',
		'https://dl.dropboxusercontent.com/sh/qz66j1s91ael6z5/VEbeenwBcI/IMG_0218.jpg?token_hash=AAEp5tYrEFxJV0mLEoYb1I61RkPdEcPLMzl7M065WBMQ-A'
		],{duration: 10000, fade: 750});

	$('.main-table-items').click(function() {
		$('td').removeClass('success');
		$(this).addClass('success');
		$('#area-container').removeClass('slide-left');
		$('#area-container').addClass('slide-left');
	});
});

