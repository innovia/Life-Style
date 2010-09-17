jQuery.ajaxSetup({'beforeSend': function(xhr){ xhr.setRequestHeader("Accept", "text/javascript")}});

$(document).ready(function() {
	enable_edit(); 	
	$('#inner_content').fadeTo(500, 1).fadeIn("3000");	
	$("input.remove_title").attr("title", "");
	
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
		});

		$('.stylist_icon').bind('click', function(event) {
			$('.stylist_icon').removeClass('selected');
			$(this).addClass('selected');
				var stylistID = $(this).attr("data-stylist");
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
		
$("#triggers img[rel]").overlay({effect: 'apple'});

$("div.vertical_scrollable").scrollable({vertical:true, clickable: false, size: 1, prev: 'a.prevPage', next: 'a.nextPage'});

$("#gallery_scroll").scrollable();

});


