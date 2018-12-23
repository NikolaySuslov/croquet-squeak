hierarchy
removeSelf

	self parent ifNotNil:[
		self parent removeChild: self.].
