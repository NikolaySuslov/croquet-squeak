*Islands
startUpInIslandReader: reader
	"Rehash but without #become:"
	| sz newSelf key |
	sz := self basicSize.
	"newSelf := (MethodDictionary new: sz) init: sz."
	newSelf := (MethodDictionary new: sz) initialize: sz.
	1 to: sz do:[:i | 
		key := self basicAt: i.
		key == nil ifFalse: [newSelf at: key put: (array at: i)].
	].
	1 to: sz do:[:i| self basicAt: i put: (newSelf basicAt: i)].
	array := newSelf array.