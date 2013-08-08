$ = jQuery

$(window).load( ->
	if window.location.pathname.match("/topics") or window.location.pathname == "/"
		# go through every 2 blocks in a row, making sure they have identical heights
		for i in [0..$('.block').length] by 2
			block1 = $('.block').eq(i)
			block2 = $('.block').eq(i+1)
			height = Math.max(block1.outerHeight(), block2.eq(i+1).outerHeight())
			block1.css('height', String(height) + "px")
			block2.css('height', String(height) + "px")
)