resolving
resolve: arg
	"Resolve this promise"
	self unregister.
	result := arg.
	resolver ifNotNil:[
		resolver numArgs = 0 ifTrue:[resolver value].
		resolver numArgs = 1 ifTrue:[resolver value: arg].
		resolver := nil.
	].
	resolved := true.