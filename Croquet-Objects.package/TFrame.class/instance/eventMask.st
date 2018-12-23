events
eventMask
	"Answer the receiver's event mask"
	^eventMask ifNil:[EventNone]

"There are three kinds of events - EventKeyboard, EventPointerOver, and EventPointerDown.  If this TFrame can handle any combination of events it must return the bitOr combination of the event types, hence, if you handle all three kinds of events, you return:

 ^ EventKeyboard bitOr: EventPointerOver bitOr: EventPointerDown. 

If you handle just the keyboard event, return:

 ^ EventKeyboard. 

The default is no event or EventNone which we return here."
