sanity
testNoLooseExtensionMethods
	"Ensure we have no loose extension methods hanging around"
	Smalltalk allClassesDo:[:cls|
		cls organization categories do:[:cat|
			(cat at: 1) = $* ifTrue:["extension category"
				self assert: (self isPackageCategoryCovered: cat allButFirst).
			].
		].
	].