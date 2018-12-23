events
eventMask

"this forces the avatar to be an object owner. This is because I need to test for 'avatar-ness' sometimes, and the only way to do that is if the avatar hierarchy is actually owned by someone."
	^ EventPointerOver bitOr: EventBlockRecurse.