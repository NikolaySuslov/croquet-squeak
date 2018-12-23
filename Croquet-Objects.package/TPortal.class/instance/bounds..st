accessing
bounds: bnds
	
" force extent to match the screen. Use extent width as base-line, only change height. "

	self extent: self extent x@ (self extent x * bnds height/bnds width).
