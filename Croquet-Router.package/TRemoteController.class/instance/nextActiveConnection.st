router switching
nextActiveConnection
"Answers the next connection that is active (ie. recieving messages). Answers the currently used connection if none of the backups are active. Answers nil if no connections are active."

	self connectionsDo: [:ea | (ea facets includesKey: #recv) ifTrue: [^ ea]].
	^ nil