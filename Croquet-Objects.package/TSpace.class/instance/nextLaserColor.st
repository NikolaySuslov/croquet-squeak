accessing
nextLaserColor
	"Answer the next default laser color"
	defaultLaserColors atEnd ifTrue:[defaultLaserColors position: 0].
	^defaultLaserColors next