*Scripting-Extensions
initialScriptPriority
	"Return the priority at which a user script process should be started.
	NOTE: The initial script priority needs to be higher than the priority
	during execution of the script. This is so that any scripts which are scheduled
	from another script preempt the running script to get in sync with the scheduler."
	^self userScriptPriority + 1