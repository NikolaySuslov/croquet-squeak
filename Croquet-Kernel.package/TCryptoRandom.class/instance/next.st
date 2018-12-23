accessing
next
	"Answer the next byte from this random stream"
	^(self nextInto: (ByteArray new: 1)) at: 1