initialization
initialize: ss

	spreadSheet := ss.
	self crAction: (MessageSend receiver: self selector: #acceptContents).
	self autoFit: false.