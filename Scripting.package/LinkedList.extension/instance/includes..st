*Scripting-Extensions
includes: aLink
	| link |
	link := firstLink.
	[link == nil] whileFalse:[
		aLink == link ifTrue:[^true].
		link := link nextLink].
	^false