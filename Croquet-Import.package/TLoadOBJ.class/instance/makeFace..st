parsing
makeFace: args

	| face indices |
	face := TOBJFace new.

	2 to: args size do: [:i |
		indices := (args at: i) findTokens: $/.
		indices size = 1 ifTrue: [ 
			face addVertex: (indices at: 1) texture: nil normal: nil.
		].
		indices size = 2 ifTrue: [
			((args at: i) includesSubString: '//') ifTrue: [
				face addVertex: (indices at: 1) texture: nil normal: (indices at: 2).
			] ifFalse: [
				face addVertex: (indices at: 1) texture: (indices at: 2) normal: nil.
			].
		].
		indices size = 3 ifTrue: [
			face addVertex: (indices at: 1) texture: (indices at: 2) normal: (indices at: 3).
		].
	].

	^ face