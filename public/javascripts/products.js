$(document).ready(function() {
	$(".tooltip-trigger").tooltip({ effect: 'slide', position: 'center left', delay: 500});
		
	$('.product-title').bind('click', function(event) {
 		var product = $(this).attr("data-productID");
		$.get('/products/' + product,function(data){
			$('#product-focus').html(data)
		});
	});
});
