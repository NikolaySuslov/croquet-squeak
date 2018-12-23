constructing
addList: itemSpecList target: aTarget
	itemSpecList do:[:itemSpec|
		self addItemSpec: itemSpec target: aTarget.
	].