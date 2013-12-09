adjustContainer = _.debounce(function() {
    var height = $('header').outerHeight();
    $('#main').css('top', height);
    $('#main').css('height', $(window).height() - height);
}, 10);

hideSplash = _.delay(function() {
    splash = $("#splash")
    splash.animate({ marginTop: splash.outerHeight() * -1}, 1500, "swing", function () {
        splash.remove();
    });
}, 1000);

$( function() {

    $(window).resize( function() {
        adjustContainer();
    });


    $(window).load(function() {
        adjustContainer();
    });

    $('ul.nav .dropdown a').click(function() {
        adjustContainer();
    });

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
