# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

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
});