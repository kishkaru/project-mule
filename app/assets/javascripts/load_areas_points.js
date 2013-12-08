var getDeliveryPoints = function(area_id) {
	$.ajax({type: "GET",
		url: '/delivery_areas/' + area_id + '/pts/',
		success: function(data) {
			$('#geographic-content').append(data);
		}});
};

$(document).ready( function() {
	$('.main-table-items').click(function() {
		$('td').removeClass('success');
		$(this).addClass('success');
		$('#area-table').removeClass('stay-centered');
		$('#area-table').addClass('slide-left');
		$('#point-container').remove();
		getDeliveryPoints(this.parentNode.id);
	});
});