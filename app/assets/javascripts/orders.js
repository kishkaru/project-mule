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

    $(".form-group button .btn-info").click( function (e) {
        var area = $('h1');
        var area_id = area.attr('data-area-id');
        $.ajax({type: "GET",
            url: "/mass_send_sms/" + area_id,
            success: function(data) {

            }});
        e.preventDefault();
    });

    $(".list-group .btn-warning").click( function (e) {
        var user = $(this).parent();
        var user_id = user.attr('data-user');
        $.ajax({type: "GET",
            url: "/send_sms/" + user_id,
            success: function(data) {

            }});
        e.preventDefault();
    });

    $(".list-group .btn-default").click( function (e) {
        var order = $(this).parent();
        var order_id = order.attr('data-order');
        $.ajax({type: "GET",
            context: this,
            url: "/update_picked_up/" + order_id,
            success: function(data) {
                $(this).removeClass('btn-default');
                $(this).addClass('btn-success');
                $(this).html('√');
            }});
        e.preventDefault();
    });

    $(".list-group .btn-success").click( function (e) {
        var order = $(this).parent();
        var order_id = order.attr('data-order');
        $.ajax({type: "GET",
            context: this,
            url: "/un_update_picked_up/" + order_id,
            success: function(data) {
                $(this).removeClass('btn-success');
                $(this).addClass('btn-default');
                $(this).html('?');  
            }});
        e.preventDefault();
    });


});
