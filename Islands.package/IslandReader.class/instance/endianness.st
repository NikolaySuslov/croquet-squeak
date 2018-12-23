private
endianness
	"Return which endian kind the incoming segment came from"

	segment class isBits ifFalse:
		["Hope that primitive 98 did the right thing - anyway, we lost information about endianness, so pretend we share the image's endianness."
		^Smalltalk endianness].
	^(segment first bitShift: -24) asCharacter == $d ifTrue: [#big] ifFalse: [#little]