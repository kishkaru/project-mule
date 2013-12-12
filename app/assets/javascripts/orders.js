$( function() {

    $('#order-date').datepicker({
        format: "mm/dd/yy",
        todayBtn: 'linked',
        todayHighlight: true,
        orientation: 'top'
    })

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

    $("#order-date input").change( _.debounce(function() {
        self = $(this);
        updatePageWithParam("date", self.val());
    }, 500));

    $("#order-customers .delivery-point-notify").click( function (e) {
        self = $(this);
        var point = self.parents('.da');
        var point_id = point.data('id');
        $.ajax({type: "POST",
            url: "/delivery_points/" + point_id + "/notify_pickup",
            success: function(data) {

            }});
        e.preventDefault();
        e.stopPropagation();
    });

    $("#order-customers .list-group .btn-warning").click( function (e) {
        var user = $(this).parents('.order');
        var user_id = user.data('user');
        $.ajax({type: "POST",
            url: "/users/" + user_id + "/notify_pickup",
            success: function(data) {

            }});
        e.preventDefault();
        e.stopPropagation();
    });

    var bind_unsuccess_texts = function() {
        $("#order-customers .list-group .btn-default").click( function (e) {
            var order = $(this).parents(".list-group-item");
            var order_id = order.attr('data-order');
            this.disabled = true;
            $.ajax({type: "GET",
                context: this,
                url: "/update_picked_up/" + order_id,
                success: function(data) {
                    self = $(this);
                    list_item = self.parents("#order-customers .list-group-item:not(:last-child)");
                    this.disabled = false;
                    self.removeClass('btn-default');
                    self.addClass('btn-success');
                    self.unbind('click');
                    list_item.slideUp(500, function () {
                        list_item.parent().append(list_item);
                        list_item.slideDown(500);
                    });
                    bind_success_texts();
                }});
            e.preventDefault();
            e.stopPropagation();
        });
    };

    var bind_success_texts = function() {
        $("#order-customers .list-group .btn-success").click( function (e) {
            var order = $(this).parents(".list-group-item");
            var order_id = order.attr('data-order');
            this.disabled = true;
            $.ajax({type: "GET",
                context: this,
                url: "/un_update_picked_up/" + order_id,
                success: function(data) {
                    this.disabled = false;
                    $(this).removeClass('btn-success');
                    $(this).addClass('btn-default');
                    $(this).unbind('click');
                    bind_unsuccess_texts();
                }});
            e.preventDefault();
            e.stopPropagation();
        });
    };

    bind_unsuccess_texts();
    bind_success_texts();

});
