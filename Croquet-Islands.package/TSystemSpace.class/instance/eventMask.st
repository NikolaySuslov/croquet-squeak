events
eventMask

" eat all of the spurious events - these would normally go to the avatar, but the overlay is not handled in quite the same way "
	^ EventPointerOver bitOr: (EventPointerDown bitOr: EventKeyboard).