private
objectForDataStream: refStream
    "Return an object to store on an external data stream."
	myName ifNil:[^self error: 'This object has no name'].
"@@@@@//@@@@@ Should we unpack them into farrefs if the proxy is for another island?"
	(refStream sameIslandAs: self)
		ifFalse: [self log warn: ('{Potential problem with TFarRef serialization: island mismatch: ' , myName printString , '}')].
    ^(TObjectProxy new: 16)
		replaceFrom: 1 to: 16 with: myName startingAt: 1;
		yourself