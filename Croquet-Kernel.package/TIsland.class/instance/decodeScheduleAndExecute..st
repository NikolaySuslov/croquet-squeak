event loop
decodeScheduleAndExecute: aTMessage
	"Decode, schedule, and execute all message up to the time specified in aTMessage."
	| msg |
	"Shoul make the error logging much more explicit @@@@"
	self flag: #jrd . 
	msg := [ self decode: aTMessage ] on: Error do: [:e | 
		self log error: 'Invalid TMessage ' , e description.
		^ self.
	].
	self scheduleMessage: msg at: msg time.
	self advanceTo: msg time.