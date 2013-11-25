$( function() {
    $("#select-delivery_area select").select2();


    function add_delivery_area(delivery_area) {
        $("#selected-delivery_areas").append("<div class='delivery_area'>" +
                                          "<input type='hidden' name='menu[delivery_areas][]' value='" +
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

});
