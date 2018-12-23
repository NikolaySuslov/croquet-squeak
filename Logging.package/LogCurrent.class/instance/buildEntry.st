line-buffer
buildEntry
"The full message to be logged"

	^ self buildEntryHead
		stamp: DateAndTime now;
		line: stream contents;
		processDescription: Processor activeProcess name;
		yourself