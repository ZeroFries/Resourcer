$ = jQuery

$(document).ready( ->
	completed = false
	bookmarked = false

	# close info box
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

	# info box icons and hotkeys
	infoBoxKeys = (completed, bookmarked, id) ->
		# hot keys
		$('body').bind('keydown', (e) ->
			uncompleteSource(id) if completed and e.keyCode == 78 # N
			completeSource(id) if !completed and e.keyCode == 67 # C
			bookmarkSource(id) if !bookmarked and e.keyCode == 66 # B
		)

	# show info box
	$('.info-opener').click( ->
		$('.page-cover').addClass('fade')
		$('.info-container').addClass('show')
		$('.info-container').removeClass('hide')
		$('body').bind('keydown', (e) ->
			if e.keyCode == 27 # esc
				infoBoxClose()
				$('body').unbind('keydown')
				$('.choose-path-container').hide()
				$('.page-cover').removeClass('fade')
		)
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

				# bookmarked or completed?
				$.when($.ajax(url: "/api/completed_sources/" + id), $.ajax(url: "/api/bookmarks/" + id)).done((c, b) ->
					completed = c[0].json.completed
					bookmarked = b[0].json.bookmarked
					infoBoxKeys(completed, bookmarked, id)
				)

			else
				$('.info-container').css("width", "25%").css("min-height", "12.5em").css("left", "37.5%").css("top", "37.5%").css("font-size", "16px").css('opacity', 1)
				$('.info-name').append("<a href=" + ('/topics/' + id) + " >" + data.name + "</a>")
				$('.info-description').text(data.description)
		)
	)

	refreshLearningPath = ->
		$.ajax(url: "/api/current_learning_paths/1").done((data) ->
			console.log data
			$('.learning_path-wrapper').html data
		)

	completeSource = (id) ->
		completed = true
		infoBoxKeys(completed, bookmarked, id)
		$.ajax({url: "/api/completed_sources/", type: "POST", data: {id: id}}).done((data) ->
			refreshLearningPath()
		)

	uncompleteSource = (id) ->
		completed = false
		infoBoxKeys(completed, bookmarked, id)
		$.ajax({url: "/api/completed_sources/" + id, type: "DELETE"}).done((data) ->
			refreshLearningPath()
		)

	bookmarkSource = (id) ->
		bookmarked = true
		infoBoxKeys(completed, bookmarked, id)
		$.ajax({url: "/api/bookmarks/", type: "POST", data: {id: id}}).done((data) ->
			# add note functionality
			console.log data
		)

	# Choose learning path
	$(".learning_path-choose").click( ->
		console.log "yo"
		$('.choose-path-container').show()
		$('.page-cover').addClass('fade')

		$('.path-select').click( ->
			id = $(this).data('id')
			$.ajax({url: "/api/current_learning_paths/", type: "POST", data: {id: id}}).done( ->
				refreshLearningPath()
			)
			$('.choose-path-container').hide()
			$('.page-cover').removeClass('fade')
		)
	)
)