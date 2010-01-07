$(document).ready(function() {
		
	
	
	// main vertical scroll 
	$("#main").scrollable({ vertical: true, size: 1, clickable: false, 

	    // up/down keys will always control this scrollable 
	    keyboard: 'static', 

	    // assign left/right keys to the actively viewed scrollable 
	    onSeek: function(event, i) { 
	        horizontal.scrollable(i).focus(); 
	    } 

	// main navigator (thumbnail images) 
	}).navigator("#main_navi"); 

	// horizontal scrollables. each one is circular and has its own navigator instance 
	var horizontal = $(".scrollable").scrollable({size: 1}).navigator(".navi"); 
		
	
});