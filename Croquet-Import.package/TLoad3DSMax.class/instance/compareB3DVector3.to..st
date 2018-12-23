as yet unclassified
compareB3DVector3: a to: b
	"compare two B3DVectors for similar values"

	|  |
	
	(((a x - b x) abs < 0.1) and: [((a y - b y) abs < 0.1) and:  [((a z - b z) abs < 0.1)]]) ifFalse: [
		Transcript cr; show: 'values not close '; cr.
		Transcript show: a asString; cr.
		Transcript show: b asString; cr.
		^false.
		].
	^true. 