stepping
chooseTarget
	target := self root frameChildren detect:[:any| any name = 'light'].
