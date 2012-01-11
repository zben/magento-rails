###
WISHLIST VISIBILITY TOGGLE

Refactored in coffeescript, because why not
###

$ ->
	openText = 'Wishlist it!'
	closeText = 'Close Wishlists'
	listSelector = 'ul.wishLists'
	
	$('.add_to_wishlist').each(
		-> $(this).children('h5').addClass('btn').toggle(
			-> $(this).addClass('info').text(closeText)
				.siblings(listSelector).show(250, 'swing')
			,
			-> $(this).removeClass('info').text(openText)
				.siblings(listSelector).hide(250, 'swing')
		)
		.end()
		.children(listSelector).hide()
	)
	