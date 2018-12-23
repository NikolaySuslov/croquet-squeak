accessing
loadResourceFor: resourceDesc

	| result  data |
	url ifNil: [ ^nil ].
	result := (url newFromRelativeText: resourceDesc sha) retrieveContents.
	result contentStream binary.
 	data := result contents asByteArray.
	^data

