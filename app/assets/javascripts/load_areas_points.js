var getDeliveryPoints = function(area_id) {
	$.ajax({type: "GET",
            url: '/delivery_areas/' + area_id + '/pts/',
            success: function(data) {
                $('#geographic-content #points').append(data);
            }
           });
};


$(document).ready( function() {
    $('.main-table-items').click(function() {
        var self = $(this);
		$('.main-table-items').removeClass('success');
        self.addClass('success');
        $('#areas').removeClass('col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3');
        $('#areas').addClass('col-lg-4 col-md-4');
        if($('#points table').length > 0) {
            $('#points').empty();
            $('#geographic-content img').remove();
            getDeliveryPoints(self.parent().data("area"));
        } else {
            _.delay(function() {
                getDeliveryPoints(self.parent().data("area"));
            }, 500);
        }
    });

    $('body').on('click', '.point-items', function() {
        var self = $(this);
        $('.point-items').removeClass('success');
        //$('#geographic-content img').remove();
        self.addClass('success');
        $('#points').removeClass('col-lg-8 col-lg-offset-0 col-md-8 col-md-offset-0');
        $('#points').addClass('col-lg-3 col-md-3');
        $('#areas').removeClass('col-lg-4 col-md-4');
        $('#areas').addClass('col-lg-3 col-md-3');
        //$('#maps').addClass('col-lg-6 col-md-6');
        var width = $('#map').width();
        var size_parameter = width + 'x' + width;
        var center_parameter = $.trim(self.html().replace(/\n/g, ' ').replace(/ +(?= )/g,''));
        center_parameter = center_parameter.replace(/ /g, '+');
        var zoom_parameter = '15';
        var sensor_parameter = 'false';
        var url = 'http://maps.googleapis.com/maps/api/staticmap?center=' + center_parameter + '&zoom=' + zoom_parameter + '&size=' + size_parameter + '&sensor=' + sensor_parameter;
        var img = $('<img src="'+ url +'">');
        if ($('#map img').length > 0) {
            $('#geographic-content img').remove();
            $('#map').append(img);
        } else {
            _.delay(function() {
                $('#map').append(img);
            }, 500);
        }
       /* $.ajax({type: 'GET',
                url: url,
                success: function(data) {
                    var img = document.createElement('img');
                    img.attr('src', url);
                    $('#map').append(img);
                }});*/
    });
});
