$(document).ready(function() {
   gallery(); 
	
	$('textarea').wysiwyg({
		height: 30
	}
		
	);
	// initialize scrollable  
	$("div.scrollable").scrollable({size: 1});

	$("div.vertical_scrollable").scrollable({ 
	        vertical:true,  
	        size: 1,
				  prev: 'div.prev_product',
				 	next: 'div.next_product'
	})

	$('.date_picker').datepicker();


	function desaturate_stylists_images(){
		$('.stylist_image').pixastic("desaturate");
	}

	function stylist_index_focus(){
		var img;
		$('.stylist_image').hover(function() {
			img = $(this); //save the image for later
			$(this).pixastic("desaturate");
		}, function() {
			$(this).html(img);
		});	
	}
	
	
	
	function gallery(){
		$("#triggers img[rel]").overlay({effect: 'apple'});
	}
	
	
	$('#first_service_add_link').bind('click', function() {
		$('#create_category').overlay({
						    top: 272,
						 expose: { 
											 color: '#fff', 
						 	         loadSpeed: 200, 
								       opacity: 0.5 
								   		}, 
			 closeOnClick: false,   // disable this for modal dialog-type of overlays 
								api: true 
		}).load();
	});
});