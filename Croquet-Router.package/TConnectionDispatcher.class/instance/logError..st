server
logError: error
	"Log an error"
	TLogger withLogFileDo:[:file|
		file nextPutAll: error description.
		error signalerContext errorReportOn: file.
	].