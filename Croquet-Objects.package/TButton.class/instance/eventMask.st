events
eventMask

	^ (EventPointerOver bitOr: EventPointerDown) bitOr: EventBlockRecurse. 
