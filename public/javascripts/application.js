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
	
	validate_appointment_request();
	
	function validate_appointment_request(){
	$('#appointment_form').validate({
		rules: {
						first_name: { required: true, minlength: 2 },
						 last_name: { required: true, minlength: 2 },
								 email: { required: true, email: true },
								gender: "required",
					phone_number:{ required: true, phoneUS: true },
				requested_date:{ required: true, date: true },
									hour:{ required: true, range: [1, 12] },
					  		minute:{ required: true, range: [00, 59] },
								service: "required",
								stylist: "required"
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
}


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

// main vertical scroll
api = $("#main").scrollable({
	clickable: false,
	vertical: true,
	size: 1,
	prev: 'a.prev_page',
	next: 'a.next_page',
	keyboard: false
}).navigator({navi: "#main_navi", api: true});	// main navigator (thumbnail images)



// horizontal scrollables. each one is circular and has its own navigator instance
horizontal = $(".scrollable").scrollable({size: 1, clickable: false, prev: 'a.prev_horizontal', next: 'a.next_horizontal'}).navigator({navi: ".navi", api: true});


function slide_drawer(msg){
			drawer.html(msg);
			drawer.slideDown(function()  { 
      drawer.css("backgroundColor", "#FFCB66"); // colored flash effect 
      setTimeout(function() { drawer.css("backgroundColor", "#fff"); }, 1000); 
  });
};

api.onBeforeSeek(function(event, i) { 
 drawer = $("#drawer"); 
 var page = api.getIndex();
 
	switch(page){
	case 0: // services page
		if ($('.service_icon.selected').length == 0) {
		slide_drawer('Please pick a service');
			return false; // cancel seeking of the scrollable by returning false 						
		}	else { 
			            drawer.slideUp(); 
			}
		break;
	
	case	1: // stylists page
			if ($('.stylist_icon.selected').length == 0) {
				slide_drawer('Please pick a stylist who will do the service');
				return false; // cancel seeking of the scrollable by returning false 						
			} else { 
				drawer.slideUp(); 
			}
		break;
	
	case	2: // date and time page
					
					if ($('#requested_date').val() == "") {
						slide_drawer('Please pick a date, pay attention to the stylist schedule');
						return false; // cancel seeking of the scrollable by returning false 						
					}	else { drawer.slideUp(); }
				
					if ($('#minute').val() == "") { slide_drawer('Please fill in the correct time')
						return false;
					}	else { drawer.slideUp(); }
			
					if ($('#hour').val() == ""){ slide_drawer('Please fill in the correct time')
						return false;
				}	else { drawer.slideUp(); }
			
		break;
	
	case 3: //form
		 	if ($('.stylist_icon.selected').length == 0) {
				slide_drawer('Please pick a stylist who will do the service');
		//		$('#submit_request').attr("disabled", "true");
			} else { //$('#submit_request').removeAttr("disabled"); 
							 drawer.slideUp(); }
	break; 
	
	default:
		
	}

});
});

