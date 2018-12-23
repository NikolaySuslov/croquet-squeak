logging
withLogFileDo: aBlock
	| file filePath |
	filePath := FileDirectory pathFrom: {FileDirectory default pathName . 'log'. 'Croquet.log' }.
	mutex critical:[
		file := [FileStream fileNamed: filePath] 
			on: Error
			do:[:ex| ex return: nil].
		file
			ifNotNil:[
				[
					[
						file setToEnd.
						aBlock value: file
					]
						on: Error
						do:[:ex| ex return]
				] ensure:[file close]
			].
	].
