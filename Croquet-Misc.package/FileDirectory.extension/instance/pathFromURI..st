*Croquet-Misc
pathFromURI: aString
	| localPath |
	aString class == Array ifTrue:["bullet-proofing"
		^FileDirectory pathFrom: {self pathName}, aString].
	localPath := aString.
	self slash = '/' ifFalse: [localPath := aString copyReplaceAll: '/' with: self slash].
	^ self fullNameFor: localPath