accessing
make: aClass
	| obj |
	obj := self new: aClass.
	self register: obj.
	^obj