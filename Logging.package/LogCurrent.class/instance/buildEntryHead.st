line-buffer
buildEntryHead
"The metadata about the message to be logged, mostly for pre-filtering"

	^ LogEntry new
		level: level;
		category: self category;
		sender: sender;
		pid: self pid;
		yourself