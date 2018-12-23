public
this
"Log the calling methods and its arguments"

 	self << sender receiver class << '-'.
	self selectorAndArgs: sender asMessage