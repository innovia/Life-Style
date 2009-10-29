$(document).ready(function() {
		
	$('#inner_content').fadeTo(500, 1).fadeIn("3000");

	gallery();
	
	enable_edit(); 

	// initialize scrollable  
	$("div.scrollable").scrollable({size: 1});

	$("div.vertical_scrollable").scrollable({ 
	        vertical:true,  
	        size: 1,
				  prev: 'div.prev_product',
				 	next: 'div.next_product'
	})

	$('.date_picker').datepicker();
	
	
	
	function gallery(){
		$("#triggers img[rel]").overlay({effect: 'apple'});
	}
	
	function enable_edit(){
		$('#edit_page').bind('click', function(event) {
			$('#display_content').toggle();
			$('#edit_content').toggle();
		});
		
		$('.toggle_edit').bind('click', function(event) {
			$('#display_content').toggle();
			$('#edit_content').toggle();
		});
		
	}
	
});