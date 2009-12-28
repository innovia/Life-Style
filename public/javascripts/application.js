jQuery.ajaxSetup({
	'beforeSend': function(xhr){ xhr.setRequestHeader("Accept", "text/javascript")} 
})

$(document).ready(function() {
		
	$('#inner_content').fadeTo(500, 1).fadeIn("3000");
	
	$('#errorExplanation p').append("<a href='#' id='close_error_box'> Close </a>").bind('click', function() {
		$('#errorExplanation').slideUp('5000').fadeOut("3000");
	});;
		
	$('.fieldWithErrors').bind('change', function(event) {
		$(this).removeClass("fieldWithErrors");
		$(this).css("display", "inline")
	});
		
	jQuery.validator.addMethod("phoneUS", function(phone_number, element) {
	    phone_number = phone_number.replace(/\s+/g, ""); 
		return this.optional(element) || phone_number.length > 9 &&
			phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
	}, "Please specify a valid phone number");
	
	$("input.remove_title").attr("title", "");
	
	$('#appointment').validate({
		rules: {
						first_name:{
												required: true,
												minlength: 2
	 										},
						last_name:{
												required: true,
												minlength: 2
	 										},
								email:{
	       								required: true,
	       								email: true
	    								},
								gender: "required"
								,
					phone_number:{
												required: true,
												phoneUS: true
											},
				requested_date:{
												required: true,
												date: true
											},
									hour:{
												required: true,
												range: [1, 12]
											},
					  		minute:{
												required: true,
												range: [00, 59]
											},
								service: "required"
								,
								stylist: "required"
		}, // End Rules
		messages: {
		     	first_name:{
		       required: "We need your first name",
		       minlength: jQuery.format("At least {0} characters required!")
		     	},
					last_name:{
		       required: "We need your last name",
		       minlength: jQuery.format("At least {0} characters required!")
		     	},
					email: {
				   		required: "We need your e-mail address so we can contact you",
					 		email: "Your email address must be in the format of name@domain.com"
					},
					gender:{
				   		required: "Please specify your gender"
					},
		phone_number:{
							required: "We need your phone number to contact you"
					},
	requested_date:{ required: "When would you like to come in?"
					},
						hour:{ required: "Please specify the hour"
					},
					minute:{ required: "Please specify the minute"
					}
					
 	},
		// the errorPlacement has to take the table layout into account 
		errorPlacement: function(error, element) { 
		    if ( element.is(":radio") ) 
		        error.appendTo( element.parent().next()); 
		    else if ( element.is(":checkbox") ) 
		        error.appendTo ( element.next() ); 
		    else 
		        error.appendTo( element.parent() ); 
		  }, 
		  
		  // set this class to error-labels to indicate valid fields 
		  success: function(label) { 
		      // set as text for IE 
					label.html(" ").addClass("checked"); 
		  }
	});
	
	$('#phone_number').mask("(999) 999-9999");
	$('#cell').mask("(999) 999-9999");	
	
	gallery();
	
	enable_edit(); 

	// initialize scrollable  
	$("div.scrollable").scrollable({size: 1, clickable: false});

	$("div.vertical_scrollable").scrollable({ 
	        vertical:true,
	  			clickable: false,
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
	
		$('#wizard.scrollable').scrollable({size: 1, clickable: false});
		
		$('.service_icon').bind('click', function(event) {
			 $('.service_icon').removeClass('selected');
			 $(this).addClass('selected');
			 var selectedService = $(this).attr("data-service");
			 $('#service').val(selectedService);
			 $('#service_name_summary').html($(this).attr("data-service_name"));
		});
		
		$('.stylist_icon').bind('click', function(event) {
			$('.stylist_icon').removeClass('selected');
			$(this).addClass('selected');
			var selectedStylist = $(this).attr("data-stylist");
			$('#stylist').val(selectedStylist);
			$('#stylist_name').html($(this).attr("data-stylist_name"));
			$('#stylist_name_summary').html($(this).attr("data-stylist_name"));
			
			$.ajax({
			  url: '/stylists/' + selectedStylist + '/schedules',
			  type: "GET",
			  dataType: "script",
			  data: null	
			});
		});
		
		$('#requested_date').datepicker({
				onSelect: function(dateText, inst){ $('#date_summary').html(dateText); }
		});
		
		$('#hour').bind('blur', function(event) {
			$('#hour_summary').html($('#hour').val());
		});
		
		$('#minute').bind('blur', function(event) {
			$('#minute_summary').html($('#minute').val());
		});
			
	
});