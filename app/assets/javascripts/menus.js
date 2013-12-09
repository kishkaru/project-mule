$( function() {
    $("#select-delivery_area select").select2();
    $("#select-vendor").select2();
    $("#select-item").select2();


    function add_delivery_area(delivery_area) {
        $("#selected-delivery_areas").append("<div class='delivery_area'>" +
                                          "<input type='hidden' name='menu_options[delivery_areas][]' value='" +
                                          delivery_area +
                                          "'>" +
                                          "<span>" +
                                          delivery_area +
                                          "</span>" +
                                          " </input>" +
                                          "<button class='btn btn-danger btn-xs remove-delivery_area'>X</button>" +
                                          "</div>");
    }

    function add_delivery_area_option(delivery_area) {
        $("#select-delivery_area select").append("<option>" + delivery_area + "</option>");
    }

    function remove_delivery_area_option(delivery_area) {
        $("#select-delivery_area select option:contains('" + delivery_area + "')").remove();
    }

    $("body").on("click", ".remove-delivery_area", function() {
        self = $(this);
        delivery_area = self.siblings('span').text();
        self.parent().remove();
        add_delivery_area_option(delivery_area);
        return false;
    });

    $("#add-delivery_area").click( function() {
        delivery_area = $("#select-delivery_area .select2-chosen").text();
        add_delivery_area(delivery_area);
        remove_delivery_area_option(delivery_area);
        $("#select-delivery_area .select2-chosen").text("");
        return false;
    });

    function populate_items(vendor) {
        if(typeof vendor === 'undefined'){
            return false;
        };
        $.getJSON( "/vendors/" + vendor + "/items.json", function( data ) {
            $("table#item-choices tbody").empty();
            $.each( data.items, function( i, item ) {
                $("table#item-choices tbody").append( "<tr>" +
                                                      "<td>" + item.name + "</td>" +
                                                      "<td>" + item.description + "</td>" +
                                                      "<td>" + item.price + "</td>" +
                                                      "<td>" + "<button class='add-to-menu btn btn-xs btn-primary' " +
                                                      "data-item-id='" + item.id + "' " +
                                                      "data-item-name='" + item.name + "' " +
                                                      "data-item-description='" + item.description + "' " +
                                                      "data-item-price='" + item.price + "' " +
                                                      "data-vendor='" + data.vendor.name + "'>" + "Add To Menu" + "</button>" + "</td>" +
                                                      "</tr>"
                                                    );
            });
        });
    }

    populate_items($("#select-vendor").val());

    $("#add-item select").change(function () {
        populate_items($("#select-vendor").val());
    });

    $("body").on("click", "button.add-to-menu", function() {
        self = $(this);
        $("#items table tbody").append( "<tr>" +
                                        "<td>" + self.data("item-name") + "</td>" +
                                        "<td>" + self.data("item-description") + "</td>" +
                                        "<td>" + self.data("item-price") + "</td>" +
                                        "<td><input name='menu_options[item_quantities][" + self.data("item-id") + "]' type='number' class='form-control' value='0'></td>" +
                                        "<td>" + self.data("vendor") + "</td>" +
                                        "<td>" + "<button class='remove-from-menu btn btn-xs btn-primary' " +
                                        "data-item-id='" + self.data("item-id") + "'>" + "Remove" + "</button>" + "</td>" +
                                        "<input type='hidden' value='" + self.data("item-id") + "' name='menu_options[items][]'>" +
                                        "</tr>"
                                      );
        return false;
    });

    $("body").on("click", "button.remove-from-menu", function() {
        self = $(this);
        self.parents("#items tr").remove()
        return false;
    });

    $("button.add-to-cart").click( function() {
        self = $(this);
        $.post( "/add_item/" + self.data("item"), function( data ) {
            alert("Item added to cart!")
        });
    });

});
