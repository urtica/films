// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
function f1()
{
	if ($('#name').val()!="")
	{
		$.ajax({url: "test_ajax",type: "POST", data: {tag: $('#name').val(), id: $('#film_id').val()}});
	}

}
function f2()
{
	if ($('#name').val()!="" ) {
		$.ajax({
			url: "test_add_tag",
			type: "POST",
			data: {tag: $('#name').val(), id: $('#film_id').val()}, 
			dataType: "json",
		    success: function(data){ 
				if (jQuery.isEmptyObject(data.error.tags)) { 
						if ($('#taglist').text().length==0) { 
								$('#taglist').append($('#name').val().toString())
							}
					   else {
					   	   $('#taglist').append(", "+$('#name').val().toString())
					   }; 
					  $('#error').text(data.error.tags).hide()} 
		    	else { 
		    		    $('#error').html('').show(); 
		    		    for (var key in data.error ) { 
		    		    		$('#error').append(key+"--"+data.error[key])
		    		    	} 
		    		 }
		    	 
		    }
		});
		    
	}

}

function remove_film()
{
	if (confirm("Удалить?"))
	{
		var t=$(this)

		$.ajax({
			url: "films/"+t.attr("data-film-id"), 
			type: "DELETE", 
			success: function(data){
				t.closest('tr').remove();
			}
		});
	}
	
}

$(document).ready(function(){ 
	$('.remove_film').click(remove_film) 
})