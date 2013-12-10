$( function() {

    function getOrderInfo(orderID) {
        $.getJSON( "/orders/" + orderID + "/items.json", function( data ) {
            $("#customer-order-items").empty();
            $("#customer-order-items").append("<h3 >" + "Order Items & Quantities for " + data.customer_name + "</h3>")
            $("#customer-order-items").append("<ul class='list-group'></ul>")
            $.each( data.items, function( i, item ) {
                $("#customer-order-items ul").append("<li class='list-group-item'>" +
                                                     item.name +
                                                     "<span class='badge'>" + item.quantity + "</span>" +
                                                     "</li>");
            });
        });
    }

    $("#order-customers .list-group-item").click( function () {
        self = $(this);
        self.siblings().removeClass("active");
        self.addClass("active");
        getOrderInfo(self.data("order"));
    });

    $(".list-group button").click( function (e) {
        var user = $(this).siblings();
        var user_id = user.attr('data-user');
        $.ajax({type: "GET",
            url: "/send_sms/" + user_id,
            success: function(data) {

            }});
        e.preventDefault();
    });


});
