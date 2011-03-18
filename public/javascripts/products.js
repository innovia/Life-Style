$(document).ready(function() {		
	
	$('.product-title').bind('click', function(event) {
		$('.product-title').removeClass("selected-product");
		$(this).toggleClass("selected-product");
 		var product = $(this).attr("data-productID");
		$.get('/products/' + product,function(data){
			$('#product-focus').html(data)
		});
	});
	
});
