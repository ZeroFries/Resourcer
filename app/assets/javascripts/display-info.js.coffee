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
				$('.info-container').css("width", "50%").css("min-height", "25em").css("left", "25%").css("top", "25%").css("font-size", "16px").css('opacity', 1)
				$('.source-img').attr('src', data.image_url)
				$('.source-name').append("<a href=" + data.url + " target='_blank'>" + data.name + "</a>")
				price = if data.price == 0 then "Free" else Array(data.price + 1).join '$'
				$('.source-info').append("<ul><li>Type: " + data.category + "</li><li>Price: " + price + "</li></ul>")
				$('.source-summary').text(data.summary)
				$('body').bind('keydown', (e) ->
					completeSource(id) if e.keyCode == 67
				)
			else
				$('.info-container').css("width", "25%").css("min-height", "12.5em").css("left", "37.5%").css("top", "37.5%").css("font-size", "16px").css('opacity', 1)
				$('.info-name').append("<a href=" + ('/topics/' + id) + " >" + data.name + "</a>")
				$('.info-description').text(data.description)
		)
	)

	# show source close
	infoBoxClose = ->
		$('body').unbind('keydown')
		$('.page-cover').removeClass('fade')
		$('.info-container').removeClass('show')
		$('.info-container').addClass('hide')
		$('.info-name').html('')
		$('.info-description').text('')
		$('.source-img').attr('src', '')
		$('.source-name').html('')
		$('.source-info').html('')
		$('.info-container').css("width", "1px").css("min-height", "1px").css("left", "50%").css("top", "50%").css("font-size", "1px").css('opacity', 0)
	$('.info-close').click( ->
		infoBoxClose()
	)
	$('body').keydown((e) ->
		infoBoxClose() if e.keyCode == 27
	)

	completeSource = (id) ->
		$.ajax({url: "/api/completed_sources/", type: "POST", data: {id: id}}).done((data) ->
			console.log data
			$('.learning_path-container').html data
		)


)