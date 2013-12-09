var getDeliveryPoints = function(area_id) {
	$.ajax({type: "GET",
            url: '/delivery_areas/' + area_id + '/pts/',
            success: function(data) {
                $('#geographic-content #points').append(data);
            }
           });
}

$(document).ready( function() {
    $('.main-table-items').click(function() {
        var self = $(this);
		$('td').removeClass('success');
        self.addClass('success');
        $('#areas').removeClass('col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3');
        $('#areas').addClass('col-lg-4 col-md-4');
        if($('#points table').length > 0) {
            $('#points').empty();
            getDeliveryPoints(self.parent().data("area"));
        } else {
            _.delay(function() {
                getDeliveryPoints(self.parent().data("area"));
            }, 1000);
        }
    });
});
