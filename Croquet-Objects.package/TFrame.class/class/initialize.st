class initialization
initialize
	"TFrame initialize"
	EventNone := 0.
	EventKeyboard := 1.
	EventPointerDown := 2.
	EventPointerOver := 4.
	EventBlockRecurse := 32.

	"EventMaskBits map event names to their required eventMask bits.
	E.g., for getting notifications about the pointerOver event we need to set
	the EventPointerOver bit and in this dictionary provides that mapping."
	EventMaskBits := IdentityDictionary new.
	{
		{EventKeyboard. #keyDown. #keyStroke. #keyUp }.
		{EventPointerDown. #pointerDown. #pointerUp. #pointerMove }.
		{EventPointerOver. #pointerEnter. #pointerLeave. #pointerOver }.
	} do:[:spec|
		spec allButFirst do:[:evtName| EventMaskBits at: evtName put: spec first].
	].