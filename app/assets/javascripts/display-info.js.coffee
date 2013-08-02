$ = jQuery

$(document).ready( ->

	# show info box
	$('.info-opener').click( ->
		$('.page-cover').addClass('fade')
		$('.info-container').addClass('show')
		$('.info-container').removeClass('hide')
		type = $(this).data('type')
		id = $(this).data('id')
		# ajax in the source data
		$.ajax(url: "/api/" + type + "/" + id).done((data) ->
			# fill promise objects with data
			if type == "sources"
				$('.source-img').attr('src', data.image_url)
				$('.source-name').append("<a href=" + data.url + " target='_blank'>" + data.name + "</a>")
				price = if data.price == 0 then "Free" else Array(data.price + 1).join '$'
				$('.source-info').append("<ul><li>Type: " + data.category + "</li><li>Price: " + price + "</li></ul>")
				$('.source-summary').text(data.summary)
			else
				$('.topic-name').append("<a href=" + ('/topics/' + id) + " >" + data.name + "</a>")
				$('.topic-description').text(data.description)
		)
	)

	# show source close
	infoBoxClose = ->
		$('.page-cover').removeClass('fade')
		$('.info-container').removeClass('show')
		$('.info-container').addClass('hide')
		$('.topic-name').html('')
		$('.topic-description').text('')
		$('.source-img').attr('src', '')
		$('.source-name').html('')
		$('.source-info').html('')
	$('.info-close').click( ->
		infoBoxClose()
	)
	$('body').keydown((e) ->
		infoBoxClose() if e.keyCode == 27
	)
)