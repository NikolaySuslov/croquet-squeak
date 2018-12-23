as yet unclassified
compareFileNormals: file computed: computed
	"compare two arrays for similar values"

	| errors |
	((file size) = (computed size)) ifFalse: [Transcript show: 'file size: ', file size asString, ' computed size: ', (computed size) asString; cr.
		^false.
		].
	errors := 0.
	1 to: (file size) do: [ :i | 
		(self compareB3DVector3: (file at: i) to: (computed at: i)) ifFalse: [
			Transcript show: 'at index: ', (i asString); cr. 
			errors := errors +1. 
			(errors > 5) ifTrue: [^false.].
			].
		].
	^true.