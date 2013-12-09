var getDeliveryPoints = function(area_id) {
	$.ajax({type: "GET",
            url: '/delivery_areas/' + area_id + '/pts/',
            success: function(data) {
                $('#geographic-content #points .rounded-border').append(data);
            }
           });
};


$(document).ready( function() {
    $('.main-table-items').click(function() {
        $('#go').addClass('hidden');
        $('#delivery-select').removeClass('col-lg-6 col-md-6');
        $('#delivery-select').addClass('col-lg-12 col-md-12');
        $('#points').removeClass('col-lg-6 col-md-6');
        $('#points').addClass('col-lg-8 col-lg-offset-0 col-md-8 col-md-offset-0');
        var self = $(this);
        $('.main-table-items').removeClass('success');
        self.addClass('success');
        $('#areas').removeClass('col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3');
        $('#areas').addClass('col-lg-4 col-md-4');
        if($('#points table').length > 0) {
            $('#points div').empty();
            $('#geographic-content img').remove();
            getDeliveryPoints(self.parent().data("area"));
        } else {
            _.delay(function() {
                getDeliveryPoints(self.parent().data("area"));
                $('#points').removeClass('hidden');
            }, 500);
        }
    });

    $('body').on('click', '.point-items', function() {
        var self = $(this);
        $('.point-items').removeClass('success');
        //$('#geographic-content img').remove();
        self.addClass('success');
        $('#points').removeClass('col-lg-8 col-lg-offset-0 col-md-8 col-md-offset-0');
        $('#points').addClass('col-lg-6 col-md-6');
        $('#areas').removeClass('col-lg-4 col-md-4');
        $('#areas').addClass('col-lg-6 col-md-6');
        $('#delivery-select').removeClass('col-lg-12 col-md-12');
        $('#delivery-select').addClass('col-lg-6 col-md-6');
        //$('#maps').addClass('col-lg-6 col-md-6');
        var width = $('#map').width();
        var size_parameter = width + 'x' + Math.round(width*.66);
        var center_parameter = $.trim(self.html().replace(/\n/g, ' ').replace(/ +(?= )/g,''));
        center_parameter = center_parameter.replace(/ /g, '+');
        var zoom_parameter = '16';
        var sensor_parameter = 'false';
        var url = 'http://maps.googleapis.com/maps/api/staticmap?center=' + center_parameter + '&zoom=' + zoom_parameter + '&size=' + size_parameter + '&sensor=' + sensor_parameter;
        var img = $('<img src="'+ url +'">');
        if ($('#map img').length > 0) {
            $('#geographic-content img').remove();
            $('#map').append(img);
        } else {
            _.delay(function() {
                $('#map').append(img);
                $('#go').removeClass('hidden');
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
