
$(document).on('ready page:load', function(){
	$('#search-form').on('submit',function(ev) {
		ev.preventDefault();
		var searchValue = $('#search').val();

		// $.ajax({
		// 	url: "/properties?search=" + searchValue,
		// 	type: 'GET',
		// 	dataType: 'html'
		// }).done(function(data) {
		// 	$('#properties').html(data);
		// });

		$.getScript("/properties?search=" + searchValue);

	});
});