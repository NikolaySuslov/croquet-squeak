line-buffer
endEntry

	self isIgnore ifFalse: [self logEntry: self buildEntry].
	sender := nil.
	stream reset.
