actions
snapshotWindow: event
	| atar |
	contents ifNil:[^nil].
	contents isPortal ifFalse:[^nil].
	atar := event avatar ifNil:[^nil].
	atar signal: #snapshot with: contents postcardLink.