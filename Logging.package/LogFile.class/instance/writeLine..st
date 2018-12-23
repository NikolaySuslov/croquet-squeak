private
writeLine: aString
	aString ifNil: [^ self].
	file ifNil: [^ self].
	file critical: [file nextPutAll: aString, String crlf]