$ = jQuery

$(document).ready( ->

	# show source info 
	$('.source-info-opener').click( ->
		$('.page-cover').addClass('fade')
		$('.source-show-container').addClass('show')
		$('.source-show-container').removeClass('hide')
		id = $(this).data('source-id')
		# ajax in the source data
		$.ajax(url: "/api/sources/" + String(id)).done((data) ->
			console.log data
			$('.source-img').attr('src', data.image_url)
			$('.source-name').append("<a href=" + data.url + " target='_blank'>" + data.name + "</a>")
			price = if data.price == 0 then "Free" else Array(data.price + 1).join '$'
			$('.source-info').append("<ul><li>Type: " + data.category + "</li><li>Price: " + price + "</li></ul>")
			$('.source-summary').text(data.summary)
		)
	)

	# show source close
	showSourceClose = ->
		$('.page-cover').removeClass('fade')
		$('.source-show-container').removeClass('show')
		$('.source-show-container').addClass('hide')
		$('.source-img').attr('src', '')
		$('.source-name').html('')
		$('.source-info').html('')
	$('.source-show-close').click( ->
		showSourceClose()
	)
	$('body').keydown((e) ->
		showSourceClose() if e.keyCode == 27
	)

)