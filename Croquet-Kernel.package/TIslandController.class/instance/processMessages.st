actions
processMessages
	"Process pending messages for this island"
	| nextMsg |
	island ifNil:[^nil]. "we are probably still sync-ing"
	self critical:[
		"Get the next message from the (concurrent) network queue"
		[nextMsg := networkQueue nextOrNil.
		nextMsg == nil] whileFalse:[
			"And have the island decode, schedule, and update to that message"
			island send:[:obj| obj decodeScheduleAndExecute: nextMsg].
		].
	].
