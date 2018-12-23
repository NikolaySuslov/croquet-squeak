private
isDropTarget: aPayload

	"Will this TFrame handle 'acceptDrop: aPayload' ?

	 This can be replaced in the fullness of time (once there is an Interface formalism
	 and an Object #supports: Interface method that works quickly).
	 For now, the method stands for 'self respondsTo:#acceptDrop:',
       and is needed because 'respondsTo:' is far too slow to use in interactive mouse loops."

	^ false