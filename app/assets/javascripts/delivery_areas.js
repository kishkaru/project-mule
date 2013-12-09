$( function() {
    $("#select-state").select2();

    function populate_delivery_points(state) {
        if(typeof state === 'undefined'){
            return false;
        };
        $.getJSON( "/delivery_points.json?state=" + state, function( data ) {
            $("table#delivery-point-choices tbody").empty();
            $.each( data, function( i, delivery_point ) {
                $("table#delivery-point-choices tbody").append( "<tr>" +
                                                      "<td>" + delivery_point.address + "</td>" +
                                                      "<td>" + "<button class='add-to-delivery-area btn btn-xs btn-primary' " +
                                                      "data-delivery-point-id='" + delivery_point.id + "' " +
                                                      "data-delivery-point-address='" + delivery_point.address + "'>" + "Add To Delivery Area" + "</button>" + "</td>" +
                                                      "</tr>"
                                                    );
            });
        });
    }

    populate_delivery_points($("#select-state").val());

    $("#add-delivery-point select").change(function () {
        populate_delivery_points($("#select-state").val());
    });

    $("body").on("click", "button.add-to-delivery-area", function() {
        self = $(this);
        $("#delivery-points table tbody").append( "<tr>" +
                                        "<td>" + self.data("delivery-point-address") + "</td>" +
                                        "<td>" + "<button class='remove-from-delivery-area btn btn-xs btn-primary' " +
                                        "data-delivery-point-id='" + self.data("delivery-point-id") + "'>" + "Remove" + "</button>" + "</td>" +
                                        "<input type='hidden' value='" + self.data("delivery-point-id") + "' name='delivery_area_options[delivery_points][]'>" +
                                        "</tr>"
                                      );
        return false;
    });

    $("body").on("click", "button.remove-from-delivery-area", function() {
        self = $(this);
        self.parents("#delivery-points tr").remove()
        return false;
    });

});
