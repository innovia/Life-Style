$(document).ready(function() {
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
	default:
	}

});

api.onSeek(function(event, i){
	page = api.getIndex();

 		if (page == 4) {
			// copy all request fields to summary if something is missing go back to fix it at the end of the copy
			
			// is service selected // services page
			if ($('.service_icon.selected').length == 0) {
				api.seekTo(0);
				slide_drawer('Please pick a service');
			} else { 
				drawer.slideUp(); 
				var selectedService = $('.service_icon.selected').attr("data-service_name");
				$('#service').val(selectedService);
				$('#service_name_summary').html(selectedService);
			}
			
			// is stylist selected // stylists page
			if ($('.stylist_icon.selected').length == 0) {
				api.seekTo(1);
				slide_drawer('Please pick a stylist who will do the service');
			}	else { 
					drawer.slideUp();
					var selectedStylist = $('.stylist_icon.selected').attr("data-stylist_name");
					$('#stylist').val(selectedStylist); //copy to form hidden field
					$('#stylist_name_summary').html(selectedStylist);	// copy to summary
			}
			
			// is time and date selected // come in page
			if ( 	$('.date_picker').val() == ""  || 
						$('#hours_select :selected').val() == "" ||
						$('#min_select :selected').val() == "" || 
						$('#ampm_select :selected').val() == "" ) 
			{
					api.seekTo(2);
					slide_drawer('Please pick a date and time');
				}	else { 
						drawer.slideUp();
						$('#hour_summary').html($('#hours_select :selected').text());
						$('#hour').val($('#hours_select :selected').text());
						
						$('#minute_summary').html($('#min_select :selected').text());
						$('#minute').val($('#min_select :selected').text());
						
						$('#ampm_summary').html($('#ampm_select :selected').text());
						$('#ampm').val($('#ampm_select :selected').text());
			}
		
		
			// form page, is the form valid
			if (	$('form').valid() == false &&
				 		$('.date_picker').val() != "" &&
				    $('#hours_select :selected').val() != "" &&
						$('#min_select :selected').val() != "" && 
						$('#ampm_select :selected').val() != "" )
				 {
						slide_drawer('Please correct the form fields');
						api.seekTo(3);
					} else if ($('form').valid() == true && $('.date_picker').val() != "") {
						drawer.slideUp();
						$('#first_name_summary').html($('#first_name').val());
						$('#last_name_summary').html($('#last_name').val());
						$('#email_summary').html($('#email').val());
						$('#day_phone_summary').html($('#day_phone').val());
						$('#cell_summary').html($('#cell').val());
						$('#date_summary').html($('#date_picker').val());
			}
 }
});
});