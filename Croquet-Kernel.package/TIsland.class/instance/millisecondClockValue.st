accessing
millisecondClockValue
	"Answer the number of milliseconds since the millisecond clock was last reset or rolled over."
	^time truncated bitAnd: 16r3FFFFFFF