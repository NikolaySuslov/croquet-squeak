as yet unclassified
newHistoryLog
	 
	^ LogCurrent new adapter: (LogAdaptersSet with: (LogHistory size: 30)); yourself 