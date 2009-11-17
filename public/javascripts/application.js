$(document).ready(function() {
		
	$('#inner_content').fadeTo(500, 1).fadeIn("3000");
	
	$('#errorExplanation p').append("<a href='#' id='close_error_box'> Close </a>").bind('click', function() {
		$('#errorExplanation').slideUp('5000').fadeOut("3000");
	});;
		
	$('.fieldWithErrors').bind('change', function(event) {
		$(this).removeClass("fieldWithErrors");
		$(this).css("display", "inline")
	});
	
	$.validator.setDefaults({
		submitHandler: function() { alert("submitted!"); }
	});
	
	
	$('#appointment').validate({
		debug: true,
		rules: {
		     	full_name:{
							required: true,
							minlength: 2
	   			},
				email: {
		       			required: true,
		       			email: true
		       }
		},	
		messages: {
			     full_name: {
			       required: "We need your email address to contact you",
			       minlength: jQuery.format("At least {0} characters required!")
			     }
			   }
		
		
	});
	
	
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