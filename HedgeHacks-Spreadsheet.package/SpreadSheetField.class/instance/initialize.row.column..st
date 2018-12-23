initialization
initialize: ss row:r column:c

	spreadSheet := ss.
	self crAction: (MessageSend receiver: self selector: #acceptContents).
	self autoFit: false.
	row := r.
	column := c.