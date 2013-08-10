$ = jQuery

$(window).load( ->

	# grid block height set
	if window.location.pathname.match("/topics") or window.location.pathname == "/"
		# go through every 2 blocks in a row, making sure they have identical heights
		console.log "hi"
		for i in [0..$('.block').length] by 2
			block1 = $('.block').eq(i)
			block2 = $('.block').eq(i+1)
			height = Math.max(block1.outerHeight(), block2.eq(i+1).outerHeight())
			block1.css('height', String(height) + "px")
			block2.css('height', String(height) + "px")

  # top nav bar behavior
  	$('.navbar').css('position', 'fixed').css('top', '0')
		$(window).scroll( ->
			headerTop = ($('.topics-header').outerHeight() + $('.topics-header').offset().top)
			windowTop = $(window).scrollTop()
			navTop = $('.navbar').outerHeight()

			if (headerTop > (windowTop + navTop))
				$('.navbar').css('position', 'fixed').css('top', '0')
			if (headerTop < (windowTop + navTop))
				$('.navbar').css('position', 'absolute').css('top', String(headerTop - navTop) + 'px')
		)
	else
		$('.navbar').css('border-bottom', '5px solid black')
)