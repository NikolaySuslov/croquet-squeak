private
privateRunMsg
	"Private. Evaluate the associated message."
	self startScriptProcess.
	result := message value. "if any"
	self stopScriptProcess: result.
