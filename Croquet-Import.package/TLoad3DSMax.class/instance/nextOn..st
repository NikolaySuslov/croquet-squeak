parse
nextOn: aStream 
	"Answer pair of {name. value}. name is a Symbol and value is a String.  
	First character of name is $*, all rest string is stored into value.  
	If name is not found, name is set as nil.  
	Answer nil if end of file"
	[aheadChar
		ifNil: [^ Array with: #EOF with: nil].
	aheadChar = $*
		ifTrue: [^ self nextFieldOn: aStream].
	aheadChar = ${
		ifTrue: [self nextTokenTo: DelimSet1 on: aStream.
			^ Array with: #BEGIN with: nil].
	aheadChar = $}
		ifTrue: [self nextTokenTo: DelimSet1 on: aStream.
			^ Array with: #END with: nil].
	"Skip dirt"
	self nextTokenTo: DelimSet1 on: aStream] repeat