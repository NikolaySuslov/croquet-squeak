accessing
printOn: aStream

"show the default - usually 'a ClassName'"
	super printOn: aStream.
"show the size of the frameChildren array"
	frameChildren ifNotNil:[
		aStream nextPutAll:'[';
			print:frameChildren size;
			nextPutAll:']'.
	].
"show the name of this object"
	objectName ifNotNil:[
		aStream nextPutAll:':';
		print: objectName.].