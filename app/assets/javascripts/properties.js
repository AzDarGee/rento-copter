
$(document).on('ready page:load', function(){
	$('#search-form').on('submit',function(ev) {
		ev.preventDefault();
		var searchValue = $('#search').val();

		$.getScript("/properties?search=" + searchValue);

	});
});