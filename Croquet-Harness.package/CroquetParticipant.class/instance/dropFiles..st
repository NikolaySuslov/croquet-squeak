event handling
dropFiles: anEvent
	"Handle a number of dropped files from the OS."
	| numFiles stream |
	numFiles := anEvent contents.
	1 to: numFiles do: [:i |
		stream := FileStream requestDropStream: i.
		[harness dropFile: stream] ensure:[stream close].
	].