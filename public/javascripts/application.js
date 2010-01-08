jQuery.ajaxSetup({
	'beforeSend': function(xhr){ xhr.setRequestHeader("Accept", "text/javascript")} 
})

$(document).ready(function() {
	enable_edit(); 	
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
	}, "invalid phone number");

	$("input.remove_title").attr("title", "");
	
	$('#appointment_form').validate({
		rules: {
						first_name: { required: true, minlength: 2 },
						 last_name: { required: true, minlength: 2 },
								 email: { required: true, email: true },
								gender: "required",
					phone_number:{ required: true, phoneUS: true }
					}, // End Rules
		messages: {
		     	first_name:{
		       required: "First name required",
		       minlength: jQuery.format("At least {0} characters required!")
		     	},
					last_name:{
		       required: "Last name required",
		       minlength: jQuery.format("At least {0} characters required!")
		     	},
					email: {
				   		required: "e-mail required",
					 		email: "email address is invalid"
					},
					gender:{
				   		required: "Gender required"
					},
		phone_number:{
							required: "phone number required"
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

		$('.service_icon').bind('click', function(event) {
			 $('.service_icon').removeClass('selected');
			 $(this).addClass('selected');
			 var selectedService = $(this).attr("data-service_name");
			 $('#service').val(selectedService);
			 $('#service_name_summary').html(selectedService);
		});

		$('.stylist_icon').bind('click', function(event) {
			$('.stylist_icon').removeClass('selected');
			$(this).addClass('selected');
				var selectedStylist = $(this).attr("data-stylist_name");
				var stylistID = $(this).attr("data-stylist");
				$('#stylist').val(selectedStylist);
			
				$('#stylist_name').html(selectedStylist);
				$('#stylist_name_summary').html(selectedStylist);

			$.ajax({
			  url: '/stylists/' + stylistID + '/schedules',
			  type: "GET",
			  dataType: "script",
			  data: null	
			});
		});

		$('.date_picker').datepicker({
				onSelect: function(dateText, inst){ 
						$('#date_summary').html(dateText); 
						$('#requested_date').val(dateText);
				}
		});

		$('#hours_select').bind('change', function(event) {
			$('#hour_summary').html($('#hours_select :selected').text());
		});

		$('#min_select').bind('change', function(event) {
			$('#minute_summary').html($('#min_select :selected').text());
		});
		
		$('#ampm_select').bind('change', function(event) {
			$('#ampm_summary').html($('#ampm_select').val())
		});
		
		$('#first_name').bind('blur', function(event) {
			$('#first_name_summary').html($('#first_name').val());
		});
		
		$('#last_name').bind('blur', function(event) {
			$('#last_name_summary').html($('#last_name').val());
		});

		$('#email').bind('blur', function(event) {
			$('#email_summary').html($('#email').val());
		});

		$('#day_phone').bind('blur', function(event) {
			$('#day_phone_summary').html($('#day_phone').val());
		});
// jQuery Tools Section

gallery();

function gallery(){
	$("#triggers img[rel]").overlay({effect: 'apple'});
}

$("div.vertical_scrollable").scrollable({
        vertical:true,
  			clickable: false,
        size: 1,
			  prev: 'div.prev_product',
			  next: 'div.next_product'
})

$("#gallery_scroll").scrollable();


});


