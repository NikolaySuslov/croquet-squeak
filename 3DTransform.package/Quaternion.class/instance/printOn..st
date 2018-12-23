printing
printOn: aStream

	aStream 
		nextPutAll: self class name;
		nextPut:$(;
		print: self angle;
		nextPut: Character space;
		print: self axis;
		nextPut:$).