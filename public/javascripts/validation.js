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

$('.phone').mask("(999) 999-9999");
