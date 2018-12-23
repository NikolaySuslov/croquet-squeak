event loop
decode: aTMessage
	| msg obj |
	msg := TMessageSend new.
	obj := aTMessage receiver.
	msg receiver: (self lookup: obj ifAbsent:[
		self register: Object new name: obj. "try to trigger race condition"
		self errorNoSuchObject: obj]).
	msg selector: aTMessage selector.
	msg arguments: (TMessageEncoder decode: aTMessage arguments in: self).
	msg time: aTMessage time.
	msg id: aTMessage id.
	msg id isZero ifTrue:[msg id: nil].
	^msg