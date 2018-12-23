*Croquet-Misc
modificationTimeFor: fileName

	| fileDir |
	fileDir := FileDirectory forFileName:  (FileDirectory pathFrom: {fileName}) .
	^(fileDir directoryEntryFor: fileName) modificationTime.