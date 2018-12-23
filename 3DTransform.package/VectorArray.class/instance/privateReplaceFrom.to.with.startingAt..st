private
privateReplaceFrom: start to: stop with: replacement startingAt: repStart 
	<primitive: 105>
	start to: stop do:[:i|
		self basicAt: i put: (replacement at: i - start + repStart).
	].