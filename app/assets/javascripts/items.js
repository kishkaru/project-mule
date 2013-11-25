$( function() {
    $("#select-ingredient select").select2();


    function add_ingredient(ingredient) {
        $("#selected-ingredients").append("<div class='ingredient'>" +
                                          "<input type='hidden' name='item[ingredients][]' value='" +
                                          ingredient +
                                          "'>" +
                                          "<span>" +
                                          ingredient +
                                          "</span>" +
                                          " </input>" +
                                          "<button class='btn btn-danger btn-xs remove-ingredient'>X</button>" +
                                          "</div>");
    }

    function add_ingredient_option(ingredient) {
        $("#select-ingredient select").append("<option>" + ingredient + "</option>");
    }

    function remove_ingredient_option(ingredient) {
        $("#select-ingredient select option:contains('" + ingredient + "')").remove();
    }

    $("body").on("click", ".remove-ingredient", function() {
        self = $(this);
        ingredient = self.siblings('span').text();
        self.parent().remove();
        add_ingredient_option(ingredient);
        return false;
    });

    $("#add-ingredient").click( function() {
        ingredient = $("#select-ingredient .select2-chosen").text();
        add_ingredient(ingredient);
        remove_ingredient_option(ingredient);
        $("#select-ingredient .select2-chosen").text("");
        return false;
    });

    $("#create-ingredient").click( function() {
        ingredient = $("#new-ingredient input").val();
        add_ingredient(ingredient);
        remove_ingredient_option(ingredient);
        $("#new-ingredient input").val("");
        return false;
    });

});
