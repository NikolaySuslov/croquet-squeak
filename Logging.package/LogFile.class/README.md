This is a simple emitter to a log file on disk to be used with SLLog. See #start to see how it is added to the SLLog singleton as an emitter. It handles log rotation with a max filesize and number of old logfiles kept around.

	SLLogFile open