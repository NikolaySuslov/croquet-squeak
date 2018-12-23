pool initialization
initialize
	"OpenGLConstants initialize" 
	self init1.
	self init2.
	self init3.
	self init4.
	self init5.
	self init6.
	"check the class pool"
	self classPool keysAndValuesDo:[:key :val|
		val ifNil:[self error: key printString,' undefined'].
	].